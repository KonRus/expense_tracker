require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:expense) { create(:expense, user: user, category: category) }
  let(:valid_attributes) do
    {
      title: "New Expense",
      amount: 50.0,
      date: Date.today,
      category_id: category.id,
      payment_method: "Credit Card",
      notes: "Some notes"
    }
  end

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, params: { expense: valid_attributes }
        }.to change(Expense, :count).by(1)
      end

      it "redirects to the expenses index" do
        post :create, params: { expense: valid_attributes }
        expect(response).to redirect_to(expenses_path)
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { expense: { title: "" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the expense" do
      expense_to_delete = create(:expense, user: user, category: category)
      expect {
        delete :destroy, params: { id: expense_to_delete.id }
      }.to change(Expense, :count).by(-1)
    end
  end
end
