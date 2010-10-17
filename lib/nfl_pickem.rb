require 'rubygems'
require 'pickem/week'
require 'pickem/matchup'
require 'pickem/team'

week = PickEm::Week.new(ENV['WEEK'])
puts "Matchups:"
puts week.matchups
puts "-" * 80
puts "Suggestions:"
puts week.suggestions