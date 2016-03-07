module Analyzable
  # Your code goes here!


def average_price(products)
    price_array=[]
    price_array=products.map { |product| product.price.to_f }
    cost=price_array.inject(0){|sum,x| sum + x }
    num=price_array.length
    average = cost/num
    average = average.round(2)
    return average
  end




def count_by_name products
  names = Hash.new(0) # initializes an empty hash with default values of 0
  products.each do |product|
    names[product.name] += 1
  end
  names
end

def count_by_brand products
  brands = Hash.new(0) # initializes an empty hash with default values of 0
  products.each do |product|
    brands[product.brand] += 1
  end
  brands
end




def print_report(products)
    report=[]
    price_average = average_price(products)
    report << "The Average Price of all Products is #{price_average}\n"
    report << "Inventory By Brand:\n"
    brands_array=[]
    brands_array=generate_brands(products)
    brands_array.each do |brand|
    num_products=product_count(products,brand)
      report << "-#{brand}: #{num_products}\n"
      end
      report << "Inventory by name:\n"
      inventory_array=[]
      inventory_array=generate_inventory(products)
      inventory_array.each do |inventory|
      num_inventory=inventory_count(products,inventory)
       report << "-#{inventory}: #{num_inventory}\n"
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
