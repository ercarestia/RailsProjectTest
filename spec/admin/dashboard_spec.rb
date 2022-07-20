# frozen_string_literal: true

require 'rails_helper'

describe Admin::DashboardController, type: :controller do
  render_views

  before(:each) do
    @user = create(:admin_user)
    sign_in @user
  end

  it 'renders index action dashboard' do
    get :index
    expect(response).to have_http_status(:ok)
    expect(response.body).to include I18n.t('active_admin.dashboard')
  end
end
