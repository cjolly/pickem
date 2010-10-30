# encoding: utf-8

puts "NFL Pickem specs: Running on Ruby Version: #{RUBY_VERSION}"

require "rubygems"

PICKEM_ROOT = File.join(File.dirname(__FILE__), '..')
PICKEM_FIXTURES_DIR = File.join(PICKEM_ROOT, 'spec', 'fixtures')

$LOAD_PATH << File.join(PICKEM_ROOT, 'lib', 'pickem')

require 'fakeweb'
FakeWeb.allow_net_connect = false

accuscore = File.open(File.join(PICKEM_FIXTURES_DIR, 'espn', 'accuscore.html'))
FakeWeb.register_uri(:get, %r|http://insider\.espn\.go\.com\/nfl\/projections|, :response => accuscore)

yahoo = File.open(File.join(PICKEM_FIXTURES_DIR, 'yahoo', 'pickem.html'))
FakeWeb.register_uri(:get, 'http://sports.yahoo.com/nfl/pickem', :response => yahoo)