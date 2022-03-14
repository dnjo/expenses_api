class ExpensesController < ApplicationController
  before_action :require_login

  def index
    render json: current_user.expenses.sort_by { |e| e.title }
  end

  def create
    expense = Expense.create title: params[:title],
                             description: params[:description],
                             user: current_user
    render json: expense
  end

  def show
    expense = current_user.expenses.find params[:id]
    render json: expense
  end

  def update
    expense = current_user.expenses.find params[:id]
    expense.update title: params[:title],
                   description: params[:description]
    render json: expense
  end

  def destroy
    expense = current_user.expenses.find params[:id]
    expense.destroy
  end
end
