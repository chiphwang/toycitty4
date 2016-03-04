require 'csv'


require_relative 'product'
require_relative '../data/seeds'
require_relative 'udacidata'

data_path = File.dirname(__FILE__) + "/../data/data.csv"
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





product1=Product.destroy(5)
puts product1
