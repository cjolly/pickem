$LOAD_PATH<<'.'
require 'pickem'

module Pickem
  class Picks < Thor
    default_task :for_week

    desc "for_week", "Suggestions for week "
    def for_week(week_number)
      week = ::Pickem::Week.new(week_number)
      puts "Games:"
      puts week.games
      puts "-" * 80
      puts "Suggestions:"
      puts week.suggestions
    end
  end
end
