RSpec.feature 'Users:', type: :feature do

  describe 'Creating a user' do

    before do
      expect(ActionMailer::Base.deliveries.empty?).to be true
      visit '/'
      click_on 'New User'
      fill_in 'Name', with: 'Sam Smith'
      fill_in 'Email', with: 'sam@email.com'
      click_on 'Create User'
    end

    it 'notifies an admin by email' do
      email = ActionMailer::Base.deliveries.last
      expect(email.subject).to eq 'New user added'
      expect(email.to_s).to include 'Sam Smith'
      ActionMailer::Base.deliveries = []
    end

  end

end
