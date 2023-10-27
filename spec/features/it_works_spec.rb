# frozen_string_literal: true

require "spec_helper"

RSpec.feature "It works root rails demo page", :js, type: :feature do
  scenario "I have rails" do
    When "user visits the app" do
      pending "a deploy happened"
      visit "http://localhost:3000"
    end

    Then "a thing"
    And "another thing"
    When " something"

    Then "user sees they are on rails" do
      expect(
        find("ul li", text: "Rails version")
      ).to have_text "Rails version: 7.1.1"

      expect(
        find("ul li", text: "Ruby version")
      ).to have_text "Ruby version: ruby 3.2.2"
    end
  end
end
