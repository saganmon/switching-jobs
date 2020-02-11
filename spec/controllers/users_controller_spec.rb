require 'rails_helper'

describe UsersController do
  let(:user) { FactoryBot.create(:user) }
  # let(:office) { FactoryBot.create(:office) }
  # let(:conditions) { FactoryBot.create_list(:condition, 5, user_id: user.id, office_id: office.id) }

  describe '#index' do

    context 'log in' do
      before do
        login user
        get :index
      end
      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index
      end
      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end
    end
  end


  describe '#show' do

    context 'as an authenticated user' do
      before do
        login user
      end

      it 'responds successfully' do
        get :show, params: { id: user.id }
        expect(response).to be_success
      end
    end

    context 'as an not authenticated user' do

      it 'responds successfully' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end