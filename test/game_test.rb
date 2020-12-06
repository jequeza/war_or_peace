require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/game"

class GameTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new(turn)
    assert_instance_of Game, game
  end
end