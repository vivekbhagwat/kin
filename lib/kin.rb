require 'sale'
require 'net/http'
require 'net/https'


module Kin
  class Client
    attr_accessor :apikey
    
    @stores = ['women', 'men', 'kids', 'home']
    @domain = "https://api.gilt.com/v1/"
  
    def initialize(apikey)
      @apikey = apikey.to_s
      make_request('https://api.gilt.com/v1/sales/active.json')
    end
    
    def active_sales
      make_request(@domain + "sales/active.json")
    end
    
    def active_sales_in_store(store_key)
      if validate_store_key(store_key)
        make_request(@domain + "sales/" + store_key + "/active.json")
      else
        raise 'Invalid Store Key'
      end
    end
    
    def upcoming_sales
      make_request(@domain + "sales/upcoming.json")
    end
    
    def upcoming_sales_in_store(store_key)
      if validate_store_key(store_key)
        make_request(@domain + "sales/" + store_key + "/upcoming.json")
      else
        raise 'Invalid Store Key'
      end
    end
    
    def sale_detail(store_key, sale_key)
      if validate_store_key(store_key)
        make_request(@domain + "/sales/" + store_key + "/" + sale_key + "/detail.json")
      else
        raise 'Invalid Store Key'
      end
    end
    
    def product_detail(product_id)
      make_request(@domain + "products/" + product_id.to_s + "/detail.json")
    end
    
    private 
    
    def make_request(url_string,params={:apikey=>@apikey})
      url = URI.parse(url_string)
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == 'https'
      
      request = Net::HTTP::Get.new(url.path + '?apikey=' + @apikey)
      # request.set_form_data(params)
      puts http.request(request).body
    end
    
    def validate_store_key(store_key) 
      @stores.include?(store_key) 
    end
    
  end
end