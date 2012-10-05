class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

class String
  def valid_strat?
    if self.downcase == "r" or self.downcase == "s" or self.downcase == "p"
      return true
    else
      return false
    end  
  end
end
  
def rps_game_winner(game)
      raise WrongNumberOfPlayersError unless game.length == 2
    if game[1] == nil
      return game[0].flatten.compact
    end

    raise NoSuchStrategyError unless game[0][1].valid_strat? == true
    raise NoSuchStrategyError unless game[1][1].valid_strat? == true
    game.each do |player_info|
      if player_info[1].downcase == "r"
        if game[1][1].downcase == "p"
          return game[1]
        else
          return game[0]
        end
      elsif player_info[1].downcase == "p"
        if game[1][1].downcase == "s"
          return game[1]
        else
          return game[0]
        end
      elsif player_info[1].downcase == "s"
        if game[1][1].downcase == "r"
          return game[1]
        else
          return game[0]
        end
      end
    end  
end
#this needs to be refactored and still failing one spec
def rps_tournament_winner(array)
  if array[0][0].class == "string".class
    return rps_game_winner(array)
  end
  new_bracket = []
  newer_bracket = []
  array.each do |a| 
    if a[0][0].class == "string".class
      array = rps_game_winner(a)
      new_bracket << rps_game_winner(a)
    else
      a.each do |b|
        if b[0][0].class == "string".class
          array = rps_game_winner(b)
          new_bracket << rps_game_winner(b)
        else
          b.each do |c|
            if c[0][0].class == "string".class
              array = rps_game_winner(c)
              new_bracket << rps_game_winner(c)
            else
              c.each do |d|
                if d[0][0].class == "string".class
                  array = rps_game_winner(d)
                  new_bracket << rps_game_winner(d)
                else
                  d.each do |e|
                    if d[0][0].class == "string".class
                      array = rps_game_winner(d)
                      new_bracket << rps_game_winner(d)
                    else
                      break
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  (0..((new_bracket.length) - 1)).step(2).each do |num|
    newer_bracket << [new_bracket[num], new_bracket[num+1]]
  end
  if newer_bracket.flatten.compact.length == 2
    return newer_bracket.flatten.compact
  else 
    rps_tournament_winner(newer_bracket)
  end
end


