$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$:.unshift('.')

require 'pickem'
require 'vcr'
require 'support/vcr'

RSpec.configure do |c|

end
