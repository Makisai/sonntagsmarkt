ENV["RAILS_ENV"] ||= "test"

require "simplecov"
SimpleCov.start "rails" do
  enable_coverage :branch
  enable_coverage :line
  add_filter "/test/"
  SimpleCov.command_name "Minitest"
  enable_for_subprocesses true
  track_files "{app,lib}/**/*.rb"
end

require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Use factory_bot methods in tests
    include FactoryBot::Syntax::Methods

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in(user)
     post session_url, params: { email_address: user.email_address, password: "password" }
    end
  end
end
