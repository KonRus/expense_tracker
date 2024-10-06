class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @expenses = current_user.expenses.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.json { render json: @expenses }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @expense }
    end
  end

  def new
    @expense = current_user.expenses.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: "Expense was successfully created." }
        format.json { render json: @expense, status: :created }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path, notice: "Expense was successfully updated." }
        format.json { render json: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_path, notice: "Expense was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def versions
    @expense = current_user.expenses.find(params[:id])
    @versions = @expense.versions
  end


  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:title, :amount, :date, :category_id, :payment_method, :notes)
  end
end
