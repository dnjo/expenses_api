class ExpenseStatusesController < ApplicationController
  before_action :require_login

  def index
    statuses = period.expense_statuses.sort_by { |s| s.expense.title }.to_json include: :expense
    render json: statuses
  end

  def create
    expense = current_user.expenses.find params[:expense_id]
    status = ExpenseStatus.create expense: expense,
                                  time_period: period,
                                  amount: params[:amount],
                                  paid: false
    status_json = status.to_json include: :expense
    render json: status_json
  end

  def show
    status = period.expense_statuses.find params[:id]
    render json: status
  end

  def update
    expense = current_user.expenses.find params[:expense_id]
    status = current_user.expense_statuses.find params[:id]
    status.update expense: expense,
                  time_period: period,
                  amount: params[:amount],
                  paid: params[:paid]
    status_json = status.to_json include: :expense
    render json: status_json
  end

  def toggle_paid
    status = current_user.expense_statuses.find params[:id]
    status.update paid: !status.paid
    render json: status
  end

  def destroy
    status = current_user.expense_statuses.find params[:id]
    status.destroy
  end

  private

  def period
    current_user.time_periods.find params[:time_period_id]
  end
end
