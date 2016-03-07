
require 'faker'


# This file contains code that populates the database with
# fake data for testing purposes

# data/seeds.rb





def db_seed
  product_names =[]
  prices=[]
  brands=[]
10.times do
    product_names << Faker::Commerce.product_name
    prices << Faker::Commerce.price
    brands << Faker::Company.name
  end
    50.times do
      # you will write the "create" method as part of your project
      Product.create( brand: brands.sample,
                      name: product_names.sample,
                      price: prices.sample )
                    end
  end




=begin
def db_seed
  brands = ["Crayola", "Lego", "Nintendo", "Fisher-Price", "Hasbro"]
  product_names = ["crayons", "house", "video game", "kitchen", "toy car"]
  prices = ["2.00", "14.50", "2.10", "99.99", "19.99"]

  50.times do
    # you will write the "create" method as part of your project
    Product.create( brand: brands.sample,
                    name: product_names.sample,
                    price: prices.sample )
                  end

end
=end
