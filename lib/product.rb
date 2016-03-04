require 'csv'
require_relative 'udacidata'

class Product < Udacidata
  attr_reader :id, :price, :brand, :name



  def initialize(opts={})

    # Get last ID from the database if ID exists
    get_last_id
    # Set the ID if it was passed in, otherwise use last existing ID
    @id = opts[:id] ? opts[:id].to_i : @@count_class_instances
    # Increment ID by 1
    auto_increment if !opts[:id]
    # Set the brand, name, and price normally
    @brand = opts[:brand]
    @name = opts[:name]
    @price = opts[:price]
  end


  def id
    @id
  end




  private

    # Reads the last line of the data file, and gets the id if one exists
    # If it exists, increment and use this value
    # Otherwise, use 0 as starting ID number
    def get_last_id
      file = File.dirname(__FILE__) + "/../data/data.csv"
      last_id = File.exist?(file) ? CSV.read(file).last[0].to_i + 1 : nil
      @@count_class_instances = last_id || 0
    end

    def auto_increment
      @@count_class_instances += 1
    end

end

=begin

data_path=File.dirname(__FILE__) + "/../data/data1.csv"


CSV.open(data_path, "wb") do |csv|
  csv << ["id", "brand", "product", "price"]
end

product = Product.create(brand: "ColtToys", name: "Orchid Plant", price: 2.00)

newtoy=Product.create(brand: "WalterToys", name: "Sticky Notes", price: 34.00)
puts newtoy
puts product
puts Product.all
products_array=[]
products_array=Product.parse_file
puts products_array

products_array.each do |product|
  puts product.class_check
end


=end
