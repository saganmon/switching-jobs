require 'rails_helper'

describe OfficesController do
  let(:user) { FactoryBot.create(:user) }

  it "renders the :index template" do

    before do
      login user
    end

    it 'renders index' do
      get :index
      expect(response).to render_template :index
    end
  end
end