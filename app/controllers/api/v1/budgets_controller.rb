class Api::V1::BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show destroy update]
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
      render json: { success: false, message: "Failed to delete budget", errors: @budget.errors.full_messages }
    end
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      render json: { budget: @budget, success: true, message: "Budget created successfully" }
    else
      render json: { success: false, message: "Failed to create budget", errors: @budget.errors.full_messages }
    end
  end

  def update
    if @budget.update(budget_params)
      render json: { budget: @budget, success: true, message: "Budget updated successfully" }
    else
      render json: { success: false, message: "Failed to update budget", errors: @budget.errors.full_messages }
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:planned_amount, :remaining_amount, :budget_date)
  end
end
