# require('capybara/rspec')
#   require('./app')
#   Capybara.app = Sinatra::Application
#   set(:show_exceptions, false)
#
#   describe('the amount due path', {:type => :feature}) do
#     it('processes the user request and returns amount due') do
#       visit('/')
#       fill_in('amount', :with => "100")
#       click_button('Send')
#       expect(page).to have_content(110)
#     end
#   end
