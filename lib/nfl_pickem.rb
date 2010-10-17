require 'rubygems'
require 'pickem/week'
require 'pickem/game'
require 'pickem/team'

week = PickEm::Week.new(ENV['WEEK'])
puts "Games:"
puts week.games
puts "-" * 80
puts "Suggestions:"
puts week.suggestions