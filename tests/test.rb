require 'csv'

require_relative '../lib/analyzable'
require_relative '../data/seeds'
require_relative '../lib/product'
require_relative '../data/seeds'
#require_relative '../lib/udacidata'
require_relative '../lib/find_by'


include Analyzable

data_path = File.dirname(__FILE__) + "./data/data.csv"
CSV.open(data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end


  brands = ["Crayola", "Lego", "Nintendo", "Fisher-Price", "Hasbro"]
  product_names = ["crayons", "house", "video game", "kitchen", "toy car"]
  prices = ["2.00", "14.50", "2.10", "99.99", "19.99"]

  50.times do
    # you will write the "create" method as part of your project
    Product.create( brand: brands.sample,
                    name: product_names.sample,
                    price: prices.sample )
                  end
=begin
new_products = CSV.read(data_path, headers:true)
Product.write_data(new_products)
=end


Module.create_finder_methods("brand","name")



Product.create(brand: "OritToys", name: "Nyan Cat", price: 3.00)
product = Product.find_by_name("Nyan Cat")

puts product
puts product.name


puts Analyzable::average_price(Product.all)

Product.create(brand: "Lego", name: "FindMyName", price: "11.30")
expected = { "FindMyName" => 1 }
actual = Analyzable::count_by_name(Product.where(name: "FindMyName"))
puts actual


=begin

product1= Product.find(5)
puts product1.id
puts product1.brand
puts product1.name
product1=Product.find(5).update(price: 100000.00, brand: "Lolerskater")

puts product1.id
puts product1.brand
puts product1.name
puts product1.price
=end

#puts "#{product} #{product.id} #{product.brand} #{product.price}"
#product.price = "10000"
#puts "#{product} #{product.id} #{product.brand} #{product.price}"
