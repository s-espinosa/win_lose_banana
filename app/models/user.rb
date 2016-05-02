class User < ActiveRecord::Base
  belongs_to :game

  enum role: %w(winner loser banana error)

  def flavor_text
    case role
    when "winner"
      "<p><strong>Tell them now!</strong></p><p>Banana judge,<br>plátano assessor,<br>knower of all fruits yellow!</p><p>Let them prove to you their worth!</p>".html_safe
    when "loser"
      "<p>Don't tell them that!</p><p>Lie!<br><strong>Lie, you fool!</strong></p><p>Convince them you're the banana you always wished you could be!</p>".html_safe
    when "banana"
      "<p>The loser is a dirty liar!</p><p>Don't let him convince the winner with his lies!</p><p><strong>You are the one true banana.</strong></p>".html_safe
    else
      "Sorry, start a new game, or find another group of three."
    end
  end

  def display
    role.upcase
  end
end
