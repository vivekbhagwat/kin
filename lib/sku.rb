module Kin
  class SKU
    attr_accessor :id, :inventory_status, :msrp_price, :sale_price, :shipping_surcharge, :attributes
    
    def initalize(obj={})
      raise "Invalid Argument" unless obj.is_a?(Hash)
      initialize(obj['id'], obj['inventory_status'], obj['sale_price'], obj['shipping_surcharge'], obj['attributes'])
    end
    
    def initialize(id=0,inventory_status='',sale_price='',shipping_surcharge='',attributes={})
      @id = id.to_i
      @inventory_status = inventory_status.to_s
      @sale_price = sale_price.to_s
      @shipping_surcharge = shipping_surcharge.to_s
      @attributes = attributes
    end
    
    def to_s
      vars = {}
      self.instance_variables.map {|v| vars[v.to_sym] = self.instance_variable_get(v)}
      vars
    end
  end
end