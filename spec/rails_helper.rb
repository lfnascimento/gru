require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'shoulda/matchers'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.render_views
  config.include FactoryBot::Syntax::Methods
  config.include ActiveSupport::Testing::TimeHelpers
  config.include Devise::Test::ControllerHelpers, type: :controller
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

omniauth_hash = {
  provider: 'facebook',
  uid: '1234567',
  info: {
    email: 'joe@bloggs.com',
    name: 'Joe Bloggs',
    first_name: 'Joe',
    last_name: 'Bloggs',
    image: 'http://graph.facebook.com/1234567/picture?type=square',
    verified: true
  },
  credentials: {
    token: 'ABCDEF...',
    expires_at: 1321747205,
    expires: true 
  },
  extra: {
    raw_info: {
      id: '1234567',
      name: 'Joe Bloggs',
      first_name: 'Joe',
      last_name: 'Bloggs',
      link: 'http://www.facebook.com/jbloggs',
      username: 'jbloggs',
      location: { id: '123456789', name: 'Palo Alto, California' },
      gender: 'male',
      email: 'joe@bloggs.com',
      timezone: -8,
      locale: 'en_US',
      verified: true,
      updated_time: '2011-11-11T06:21:03+0000',
      # ...
    }
  }
}
OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook, omniauth_hash)
OmniAuth.config.mock_auth[:facebook_invalid] = :invalid_credentials
