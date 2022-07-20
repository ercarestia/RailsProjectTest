# frozen_string_literal: true

require 'rails_helper'
describe Admin::AdminUsersController, type: :controller do
  render_views

  before(:each) do
    @user = create(:admin_user)
    sign_in @user
  end

  it 'creates an admin user' do
    post :create, params: { email: 'test@email.com', password: 'newpassword', password_confirmation: 'newpassword' }
    expect(AdminUser.all.count).to eq(1)
  end

  it 'should render the actual template' do
    get :index
    expect(response.body).to include(@user.email)
  end

  it 'Updates an admin user' do
    put :update, params: { id: @user.id, email: 'test2@email.com' }
    expect(AdminUser.all.count).to eq(1)
  end

  it 'renders index action for admin users' do
    get :index
    expect(response).to have_http_status(:ok)
    expect(response.body).to include(@user.email)
  end
end
