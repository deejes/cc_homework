require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let (:user) {FactoryGirl.create(:user)}
  let (:idea) {FactoryGirl.create(:idea)}


  describe 'new' do
    it 'renders the new idea page' do
      request.session[:user_id] = user.id
      get :new
      expect(response).to render_template(:new)
    end
    it 'assigns an instance variable to an empty product' do
      request.session[:user_id] = user.id
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe 'create' do
    context 'with valid inputs' do
        it 'adds a new idea to the database' do
          # byebug
          before_count = Idea.count
          idea
          after_count = Idea.count
          expect(before_count).to_not eq(after_count)
        end
        it 'redirects to the ideas page' do
          attributes = FactoryGirl.attributes_for(:idea)
          post :create,  params: {idea: attributes}
          expect(response).to redirect_to(ideas_path)
        end
      context 'without valid inputs'do
        it 'will not add to the idea databse' do

          before_count = Idea.count
          attributes = FactoryGirl.attributes_for(:idea)
          attributes[:title] = nil
          post :create,  params: {idea: attributes}
          after_count = Idea.count
          expect(before_count).to eq(after_count)
          # byebug
        end
      end




      end
    end
  end
