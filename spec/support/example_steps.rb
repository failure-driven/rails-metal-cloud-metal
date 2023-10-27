require "rspec/example_steps"

RSpec.configure do |config|
  # as per https://github.com/railsware/rspec-example_steps/issues/14
  RSpec::Core::Formatters.register(
    RSpec::Core::Formatters::DocumentationFormatter,
    :example_group_started,
    :example_group_finished,
    :example_passed,
    :example_pending,
    :example_failed,
    :example_started,
    :example_step_passed,
    :example_step_pending,
    :example_step_failed
  )

  # add the Capybara like feature and scenario to make the spec/features read
  # more like BDD specs as per
  #   https://github.com/teamcapybara/capybara/blob/master/lib/capybara/rspec/features.rb
  RSpec.configure do |config|
    config.alias_example_group_to :feature, :capybara_feature, type: :feature
    config.alias_example_group_to :xfeature, :capybara_feature, type: :feature, skip: "Temporarily disabled with xfeature"
    config.alias_example_group_to :ffeature, :capybara_feature, :focus, type: :feature
    config.alias_example_to :scenario
    config.alias_example_to :xscenario, skip: "Temporarily disabled with xscenario"
    config.alias_example_to :fscenario, :focus
  end
end
