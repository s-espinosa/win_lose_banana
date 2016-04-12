class User < ActiveRecord::Base
  belongs_to :game

  enum role: %w(win lose banana error)
end
