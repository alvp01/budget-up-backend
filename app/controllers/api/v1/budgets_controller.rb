class Api::V1::BudgetsController < ApplicationController
  before_action :set_budget, only: %i[destroy update]
  before_action :set_budget_by_year_and_month, only: %i[budget_by_year_and_month]

  def index
    @budgets = Budget.all
    render json: { budgets: @budgets, success: true, message: "Budgets fetched successfully" }
  end

  def show
    render json: @budget
  end

  def destroy
    if @budget.destroy
      render json: { success: true, message: "Budget deleted successfully" }
    else
      render json: { success: false, message: "Failed to delete budget" }
    end
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      render json: { budget: @budget, success: true, message: "Budget created successfully" }
    else
      render json: { success: false, message: "Failed to create budget" }
    end
  end

  def update
    if @budget.update(budget_params)
      render json: { budget: @budget, success: true, message: "Budget updated successfully" }
    else
      render json: { success: false, message: "Failed to update budget" }
    end
  end

  def budget_by_year_and_month
    render json: { budget: @budget, success: true, message: "Budget fetched successfully" }
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def set_budget_by_year_and_month
    @budget = Budget.where("date_part('year', budget_date) = ? AND date_part('month', budget_date) = ?", params[:year], params[:month]).first
  end

  def budget_params
    params.require(:budget).permit(:planned_amount, :remaining_amount, :budget_date)
  end
end
