RSpec.configure do |config|
  if ENV['coverage'] == 'on'
    require 'simplecov'
    
    SimpleCov.start 'rails' do
    minimum_coverage 100
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
