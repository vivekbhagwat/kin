require 'image'
require 'sku'

module Kin
  class Product
    attr_accessor :name, :product, :id, :brand, :url, :image_urls, :skus,
      :description, :fit_notes, :material, :care_instructions, :origin #optional
    
    def initialize(obj={})
      raise "Invalid Argument" unless obj.is_a?(Hash)
      initialize(obj['name'], obj['product'], obj['id'], obj['url'], obj['image_urls'], obj['skus'],
        obj['description'], obj['fit_notes'], obj['material'], obj['care_instructions'], obj['origin'])
    end
    
    def initialize(name='',product='',id=0, brand='',url='',image_urls={},skus=[],
                  description='',fit_notes='',material='', care_instructions='',origin='')
      @name = name.to_s
      @product = product.to_s
      @id = id.to_i
      @brand = brand.to_i
      @url = URI.parse(url.to_s)
      @image_urls = image_urls
      @skus = skus
      @description = description.to_s
      @fit_notes = fit_notes.to_s
      @material = material.to_s 
      @care_instructions = care_instructions.to_s
      @origin = origin.to_s
    end
  
    def get_images
      @image_urls.values.flatten if image_urls.is_a?(Hash)
    end

  end  
end