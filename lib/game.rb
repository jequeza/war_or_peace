class Game
  attr_reader :turn
  def initialize(turn_obj)
    @turn = turn_obj
  end

  def start
    sleep(1)
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    sleep(1)
    p "The players today are #{@turn.player1.name} and #{@turn.player2.name}."
    sleep(1)
    p "Type 'GO' to start the game!"
    sleep(1)
    p "------------------------------------------------------------------"
    input = gets.chomp
    if input == "GO"
      orcherstrate
    else
      p "Come back soon"
      sleep(1)
      p "Goodbye!!!"
      sleep(2)
    end
  end

  # def orcherstrate
  #   turn_count = 1
  #   while turn_count != 1000000 || @turn.player1.has_lost? || @turn.player2.has_lost?
  #     if @turn.type == :war
  #       turn.pile_cards
  #       winner = turn.winner
  #       turn.award_spoils(winner)
  #       p "Turn #{turn_count}: WAR - #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
  #       turn_count += 1
  #     elsif @turn.type == :mutually_assured_destruction
  #       turn.pile_cards
  #       winner = turn.winner
  #       turn.award_spoils(winner)
  #       p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
  #       turn_count += 1
  #     else
  #       turn.pile_cards
  #       winner = turn.winner
  #       turn.award_spoils(winner)
  #       p "Turn #{turn_count}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
  #       turn_count += 1
  #     end
  #     if turn_count == 1000000
  #       p "---- DRAW ----"
  #     elsif turn.player1.has_lost?
  #       p "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
  #     elsif turn.player2.has_lost?
  #       p "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
  #     end
  #   end
  # end

  def orcherstrate
    @turn_count = 1
    while @turn_count != 1000000
      if !@turn.player1.has_lost? && !@turn.player2.has_lost?
        keep_playing
      elsif @turn.player1.has_lost? == true
        p "*~*~*~* #{@turn.player2.name} has won the game! *~*~*~*"
      elsif @turn.player2.has_lost? == true
        p "*~*~*~* #{@turn.player1.name} has won the game! *~*~*~*"
      end
    end
  end

  def keep_playing
    if @turn.type == :war
      @turn.pile_cards
      winner = @turn.winner
      @turn.award_spoils(winner)
      p "Turn #{@turn_count}: WAR - #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
      @turn_count += 1
    elsif @turn.type == :mutually_assured_destruction
      @turn.pile_cards
      winner = @turn.winner
      @turn.award_spoils(winner)
      p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
      @turn_count += 1
    else
      @turn.pile_cards
      winner = @turn.winner
      @turn.award_spoils(winner)
      p "Turn #{@turn_count}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
      @turn_count += 1
    end
  end
end