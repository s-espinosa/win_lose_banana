class Game < ActiveRecord::Base
  validates :game_code, uniqueness: true
  has_many  :users

  def generate_game_code
    while true
      code = SecureRandom.hex(3)
      break if update(game_code: code)
    end
  end

  def generate_role
    roles           = [0, 1, 2]
    taken_roles     = users.pluck(:role)
    available_roles = roles.map do |role|
      taken_roles.include?(role) ? nil : role
    end.compact
    available_roles == [] ? "error" : available_roles.sample
  end
end
