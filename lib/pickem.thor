$LOAD_PATH<<'.'
require 'pickem'

class Picks < Thor
  desc "test", "an example description"
  def test(week_number)
    week = Pickem::Week.new(week_number)
    puts "Games:"
    puts week.games
    puts "-" * 80
    puts "Suggestions:"
    puts week.suggestions
  end
end
