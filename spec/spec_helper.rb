require 'chefspec'
ChefSpec::Coverage.start!

# Uncomment to use ChefSpec's Berkshelf extension
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.log_level = :warn
  config.alias_example_group_to :describe_recipe, type: :recipe
  config.alias_example_group_to :describe_resource, type: :resource
  config.alias_example_group_to :describe_attribute, type: :attribute

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.platform = 'centos'
  config.version = '6.7'

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end

at_exit { ChefSpec::Coverage.report! }

