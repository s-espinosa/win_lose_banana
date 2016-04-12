require 'rails_helper'

RSpec.feature "Joining an existing game" do
  scenario "sees a screen with their role when they join a game" do
    game = Game.new
    game.generate_game_code
    roles = %w(win lose banana)

    visit '/'
    within("#join") do
      fill_in "user[name]", with: "Joiner Name"
      fill_in "user[game]", with: game.game_code
    end
    click_on "Join Game"
    role = find("#role").native.inner_html
    expect(roles).to include(role)
  end
end
