require 'sale'


module Kin
  class Client
    attr_accessor :apikey
    @stores = []
  
    def initialize(apikey)
      @apikey = apikey
    end
    
    def active_sales
      #make request to "https://api.gilt.com/v1/sales/active.json" with apikey
    end
    
    def active_sales_in_store(store_key)
      #make request to "https://api.gilt.com/v1/sales/" + store_key + "/active.json" with apikey
    end
    
    def upcoming_sales
      #make request to "https://api.gilt.com/v1/sales/upcoming.json" with apikey
    end
    
    def upcoming_sales_in_store(store_key)
      #make request to "https://api.gilt.com/v1/sales/" + store_key + "/upcoming.json" with apikey
    end
    
    def sale_detail(store_key, sale_key)
      #make request to "https://api.gilt.com/v1/sales/" + store_key + "/" + sale_key + "/detail.json" with apikey
    end
    
    def product_detail(product_id)
      #make request to "https://api.gilt.com/v1/products/" + product_id.toString + "detail.json" with apikey
    end
  end
end