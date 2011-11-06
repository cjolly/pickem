$LOAD_PATH<<'.'
require 'pickem'
require 'terminal-table'

module Pickem
  class Picks < Thor
    default_task :for_week

    desc "for_week", "Suggestions for week "
    def for_week(week_number)
      week = ::Pickem::Week.new(week_number)
      puts Terminal::Table.new :title => "Week #{week_number} Suggestions", :rows => week.suggestions
    end
  end
end
