$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$:.unshift('.')

require 'pickem'
require 'vcr'
require 'support/vcr'

RSpec.configure do |c|
   c.treat_symbols_as_metadata_keys_with_true_values = true
end
