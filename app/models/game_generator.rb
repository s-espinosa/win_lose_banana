class GameGenerator
  def initialize(user, action, game)
    @user   = user
    @action = action
    @game   = game
    generate_game
  end

  def generate_game
    if @user.save && @action == "Host Game"
      new_game
    elsif @user.save && @action == "Join Game"
      join_game
    end
  end

  def new_game
    @game = Game.new
    @game.generate_game_code
    role = @game.generate_role
    @user.update(game_id: @game.id, role: role)
  end

  def join_game
    game = Game.find_by(game_code: @game.downcase)
    role = game.generate_role
    @user.update(game_id: game.id, role: role)
  end
end
