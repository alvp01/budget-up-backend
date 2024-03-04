class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show destroy]
  def index
    @budgets = Budget.includes(:categories, :items, :transactions)
    render json: { budgets: @budgets, success: true }
  end

  def show
    render json: @budget
  end

  def destroy
    if @budget.destroy!
      render json: { success: true, message: "Budget deleted successfully" }
    else
      render json: { success: false, message: "Failed to delete budget", errors: @budget.errors.full_messages }
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
