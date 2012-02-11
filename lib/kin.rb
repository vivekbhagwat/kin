require 'sale'
require 'net/http'
require 'net/https'
require 'rubygems'
require 'json'


module Kin
  def Kin.stores
    ["women", 'men', 'kids', 'home']
  end
  
  def Kin.domain
    "https://api.gilt.com/v1/"
  end
  
  class Client
    attr_accessor :apikey

  
    def initialize(apikey)
      @apikey = apikey.to_s
    end
    
    def active_sales
      sales = make_request(Kin.domain + "sales/active.json")['sales']
      sales.each_with_index do |sale, i|
        sales[i] = Kin::Sale.new(sale)
      end
      sales
    end
    
    def active_sales_in_store(store_key)
      raise "Invalid Store Key" unless validate_store_key(store_key)
      make_request(Kin.domain + "sales/" + store_key + "/active.json")
    end
    
    def upcoming_sales
      make_request(Kin.domain + "sales/upcoming.json")
    end
    
    def upcoming_sales_in_store(store_key)
      raise "Invalid Store Key" unless validate_store_key(store_key)
      make_request(Kin.domain + "sales/" + store_key + "/upcoming.json")
    end
    
    def sale_detail(store_key, sale_key)
      raise "Invalid Store Key" unless validate_store_key(store_key)
      make_request(Kin.domain + "sales/" + store_key + "/" + sale_key + "/detail.json")
    end
    
    def product_detail(product_id)
      make_request(Kin.domain + "products/" + product_id.to_s + "/detail.json")
    end
    
    def product_detail_from_url(url)
      raise 'Invalid URL' unless validate_url(url)
      make_request(url)
    end
    
    private 
    
    def make_request(url_string)
      url = URI.parse(url_string)
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == 'https'
      
      request = Net::HTTP::Get.new(url.path + '?apikey=' + @apikey)
      # request.set_form_data(params)
      JSON.parse(http.request(request).body)
    end
    
    def validate_store_key(store_key) 
      Kin.stores.include?(store_key) 
    end
    
    def validate_url(url)
      url =~ /^#{Regexp.quote(Kin.domain + "products/")}\w+#{Regexp.quote('/detail.json')}$/
    end
    
  end
end
