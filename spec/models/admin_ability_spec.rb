# frozen_string_literal: true

describe AdminAbility do
  context 'initialize' do
    let(:super_admin_ability) { AdminAbility.new create(:admin_user, role: 'super_admin') }
    let(:config_admin_ability) { AdminAbility.new create(:admin_user, role: 'config_admin') }

    it 'should return if no abilities are passed' do
      expect(AdminAbility.new(nil).cannot?(:read, :all)).to be_truthy
    end
    it 'should allow super admin to manage all' do
      expect(super_admin_ability.can?(:read, :all)).to be_truthy
    end
    it 'should not allow config admin to create admin user' do
      expect(config_admin_ability.cannot?(:create, AdminUser)).to be_truthy
    end
    it 'should allow config admin to view admin user' do
      expect(config_admin_ability.can?(:read, AdminUser)).to be_truthy
    end
  end
end
