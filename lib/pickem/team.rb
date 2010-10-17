module PickEm
  class Team
    attr_accessor :name, :comm, :home, :percent
    def initialize(nokogiri_node)
      @name = nokogiri_node['name']
      @comm = nokogiri_node['comm']
      @home = nokogiri_node['home']
      @percent = nokogiri_node['percent'].to_f
    end

    def to_s
      "#{name} (#{percent})"
    end
  end
end