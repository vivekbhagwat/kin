require 'helper'
require 'secret'

class TestKin < Test::Unit::TestCase
  should "Return a list of active sales" do
    gilt = Kin::Client.new(Secret.password)
    actives = gilt.active_sales
    assert(!actives.empty?)
    # assert(!(actives.name.empty? || actives.sale.empty? || actives.sale_key.empty?
          # || actives.store.empty? || actives.sale_url.empty? || actives.begins.empty? || actives.image_urls.empty?))    
  end
  
  should "Return a list of active sales for this store" do
    gilt = Kin::Client.new(Secret.password)
    Kin.stores.each do |store|
      active = gilt.active_sales_in_store(store)
      assert(!active.empty?)
    end
  end
  
  should "Return a list of upcoming sales" do
    gilt = Kin::Client.new(Secret.password)
    upcomings = gilt.upcoming_sales
    assert(!upcomings.empty?)
    # assert(!(actives.name.empty? || actives.sale.empty? || actives.sale_key.empty?
          # || actives.store.empty? || actives.sale_url.empty? || actives.begins.empty? || actives.image_urls.empty?))    
  end
  
  should "Return a list of upcoming sales for this store" do
    gilt = Kin::Client.new(Secret.password)
    Kin.stores.each do |store|
      upcomings = gilt.upcoming_sales_in_store(store)
      assert(!upcomings.empty?)
    end
  end
  
  should "Return details about a sale" do
    gilt = Kin::Client.new(Secret.password)
    sales = gilt.active_sales
    list = []
    sales.each do |sale|
      list << gilt.sale_detail(sale.store, sale.sale_key)
    end
    assert(!list.empty?)
  end
  
  should "Return details about a product" do
    gilt = Kin::Client.new(Secret.password)
    sales = gilt.active_sales
    list = []
    sales.each do |sale|
      sale.products.each do |product|
        list << gilt.product_detail_from_url(product)
      end
    end
    assert(!list.empty?)
  end
  
end
