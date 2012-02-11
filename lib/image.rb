require 'uri'
module Kin
  class Image
    attr_accessor :url, :width, :height
    
    def initialize(obj={})
      raise "Invalid Argument" unless obj.is_a?(Hash)
      initialize(obj['url'], obj['width'], obj['height'])
    end
    
    def initialize(url='',width=0,height=0)
      @url = URI.parse(url.to_s)
      @width = width.to_i
      @height = height.to_i
    end
    
    def to_s
      vars = {}
      self.instance_variables.map {|v| vars[v.to_sym] = self.instance_variable_get(v)}
      vars
    end
  end
end