require 'coveralls'
require 'simplecov'

require './lib/models/plateau.rb'
require './lib/models/position.rb'
require './lib/models/orientation.rb'
require './lib/models/rover.rb'
require './lib/models/rover_model.rb'
require './lib/models/move_commands.rb'
require './lib/controllers/mission_control.rb'


Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
