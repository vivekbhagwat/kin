require 'product'
require 'image'

module Kin
  class Sale
    attr_accessor :name, :sale, :sale_key, :store, :sale_url, :begins, :image_urls, :description, :ends, :products
    
    def initialize(obj={})
      raise 'Invalid Argument' unless obj.is_a?(Hash)
      init_with_values(obj['name'], obj['sale'], obj['sale_key'], obj['store'], obj['sale_url'], obj['begins'], 
        obj['image_urls'], obj['description'], obj['ends'], obj['products'])
    end
    
    private 
    
    def init_with_values(name,sale,sale_key,store,sale_url,begins,image_urls, description='', ends='',products=[])
      @name = name.to_s
      @sale = sale.to_s
      @sale_key = sale_key.to_s
      @store = store.to_s
      @sale_url = sale_url.to_s
      @begins = begins.to_s
      @image_urls = image_urls
      @description = description.to_s
      @ends = ends.to_s
      @products = products
    end
  end
end
