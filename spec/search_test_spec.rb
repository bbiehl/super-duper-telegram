RSpec.feature 'can do stuff', type: :feature do
  before :all do
    Selenium::WebDriver::Chrome::Service.driver_path = '/applications/Chromedriver'
    Capybara.default_driver = :selenium_chrome
  end

  after :all do
  end

  let(:formy) { 'https://formy-project.herokuapp.com/' }

  class Date
    def today
      Time.now.strftime '%m/%d/%Y'
    end
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

  scenario 'can fill out autocomplete form' do
    visit formy
    expect(page).to have_content('Welcome to Formy')
    click_on('Autocomplete')
    fill_in 'Address', with: '1555 Park Blvd, Palo Alto, CA'
    #TODO
  end

  scenario 'can pick today as the date' do
    visit formy
    click_on('Datepicker')
    find('#datepicker').click
    find('td.today').click
  end
end

