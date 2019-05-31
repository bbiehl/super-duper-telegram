RSpec.feature 'can do stuff', type: :feature do
  before :all do
    Selenium::WebDriver::Chrome::Service.driver_path = '/applications/Chromedriver'
    Capybara.default_driver = :selenium_chrome

  end

  after :all do
  end

  scenario 'can do a google search' do
    visit 'https://www.google.com'
    fill_in(name: "q", with: "hello world")
    # click_button(name: 'btnK')
    click_button "Google Search"
  end

  scenario 'can hit the NWS site' do
    visit 'https://www.weather.gov'
  end
end