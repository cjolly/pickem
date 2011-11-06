$LOAD_PATH<<'.'
require 'pickem'

module Pickem
  class Picks < Thor
    default_task :for_week

    desc "for_week", "Suggestions for week "
    def for_week(week_number)
      week = ::Pickem::Week.new(week_number)
      puts "##Suggestions:\n\n"
      puts week.suggestions
      puts "\n"
      puts "##Games:\n\n"
      puts week.games
    end
  end
end
