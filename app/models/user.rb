class User < ActiveRecord::Base
  belongs_to :game

  enum role: %w(winner loser banana error)

  def flavor_text
    case role
    when "winner"
      "<p><strong>Tell them now!</strong></p><p>You are the banana judge,<br>the grand plátano assessor,<br>knower of all fruits yellow!</p><p>Let them prove to you their worth!</p>".html_safe
    when "loser"
      "<p>Don't tell them that!</p><p>Lie!<br><strong>Lie, you fool!</strong></p><p>Convince them that you're the banana that you always wished you could be!</p>".html_safe
    when "banana"
      "<p>But the loser is a dirty liar!</p><p>Don't let him convince the winner with his lies!</p><p><strong>You are the one true banana.</strong></p><p>Only you can save the winner from this treachery!</p>".html_safe
    else
      "Sorry, start a new game, or find another group of three."
    end
  end

  def display
    role.upcase
  end
end
