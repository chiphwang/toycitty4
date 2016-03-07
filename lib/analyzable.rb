module Analyzable
  # Your code goes here!

def average_price(products)
    price_array=[]
    products.each do |product|
    price_array << product.price.to_f
    end
    cost=price_array.inject(0){|sum,x| sum + x }
    num=price_array.length
    average = cost/num
    average = average.round(2)
    return average
end

def count_by_name(products)
    names_array=[]
    name_hash={}
    names_array=generate_inventory(products)
    names_array.each do |name|
      num_products=inventory_count(products,name)
      name_hash["#{name}"] = num_products
    end
    return name_hash
end


def count_by_brand(products)
  brands_array=[]
  brands_hash={}
  brands_array=generate_brands(products)
  brands_array.each do |brand|
    num_products=product_count(products,brand)
    brands_hash["#{brand}"] = num_products
  end
return brands_hash
end




def print_report(products)
    report=[]
    price_average = average_price(products)
    report << "The Average Price of all Products is #{price_average}"
    report << "Inventory By Brand:"
    brands_array=[]
    brands_array=generate_brands(products)
    brands_array.each do |brand|
    num_products=product_count(products,brand)
      report << "-#{brand}: #{num_products}"
      end
      report << "Inventory by name:"
      inventory_array=[]
      inventory_array=generate_inventory(products)
      inventory_array.each do |inventory|
      num_inventory=inventory_count(products,inventory)
       report << "-#{inventory}: #{num_inventory}"
      end
      report=report.map { |i| "'" + i.to_s + "'" }.join(" ")
      return report
    end


      def inventory_count(products,inventory)
        product_array=[]
        products.each do | product |
          if product.name == inventory
            product_array << product
          end
        end
        num_products=product_array.length
        return num_products
      end

      def product_count(products,brand)
        product_array=[]
        products.each do | product |
          if product.brand == brand
            product_array << product
          end
        end
        num_products=product_array.length
        return num_products
      end


def generate_brands(report)
    brand_array=[]
    report.each do |report|
    brand_array << report.brand
  end
    brand_array=brand_array.map {|brand| brand}.uniq
    return brand_array
  end


  def generate_inventory(report)
    inventory_array=[]
    report.each do |report|
    inventory_array << report.name
    end
    inventory_array=inventory_array.map {|brand| brand}.uniq
    return inventory_array
  end


end
