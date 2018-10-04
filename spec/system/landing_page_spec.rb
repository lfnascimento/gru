describe 'Landing page', type: :system do
  
  let!(:order_button_link_xpath) { '/html/body/div/div/a' }
  
  before { visit root_url }

  it 'shows welcome message and order button' do
    expect(page).to have_content I18n.t('landing.index.subtitle')
    expect(page).to have_xpath order_button_link_xpath
  end

end
