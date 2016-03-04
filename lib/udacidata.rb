require_relative 'find_by'
require_relative 'errors'
require_relative 'product'
require_relative '../data/seeds'
require 'csv'
require 'fileutils'
require 'tempfile'

class Udacidata

  @@data_path=File.dirname(__FILE__) + "/../data/data.csv"


    def self.create(option={})
     brand=option[:brand]
     name=option[:name]
     price=option[:price]
     id = option[:id]
     if  option[:id]
     new_product=Product.new({ brand: brand, name: name, price: price, id: id})
    else
      new_product=Product.new({ brand: brand, name: name, price: price})
      id=new_product.id
     CSV.open(@@data_path, "ab") do |csv|
       csv << ["#{id}","#{brand}", "#{name}","#{price}"]
        end
      end
     return new_product
  end


  def self.all
      array_products=self.product_array
    return array_products
end


  def self.first(num=1)
    first_product=[]
    products=[]
    counter=0
    firstproduct=self.product_array
    if num ==1
    return firstproduct[0]
  else
    num.times do
      products << firstproduct[counter]
      counter=counter+1
    end
  return products
end
  end


def self.last(num=1)
  counter=0
  list_product=[]
  products=[]
  products=self.product_array
  if num == 1
  return products.last
else
   num.times do
  list_product << products[-counter]
  counter=counter+1
  end
  return list_product
end

end

  def self.find(num)
    new_num=num -1
    products=self.product_array
    return products[new_num]
  end



def self.destroy(id,option ={})
destroyed=find_product_id(id)
row=find_row(id)
new_products = CSV.read('../data/data.csv', headers:true)
new_products.delete(row)
CSV.open('../data/data.csv', "wb") do |csv|
csv << ["id", "brand", "product", "price"]
end

CSV.open('../data/data.csv', "ab") do |csv|
  new_products.each do |product|
    csv << product
    end
  end
  return destroyed
end



def self.find_product_id(id)
  products=self.product_array
  products.each do |product|
    if product.id == id
      return product
    end
  end
end


def self.find_row(id)
  products=self.product_array
  counter = 0
  products.each do |product|
    if product.id == id
      print "row #{id} will be deleted"
      return counter
    else
      counter=counter+1
    end
  end
end

=begin
def self.find_row(num)
  new_products = CSV.read('../data/data.csv', headers:true)
  counter=0
  new_products['id'].each do |id|
    if id == num
      puts "row #{id} is the row to be deleted"
      return counter
    else
    counter=counter+1
    end
  end
end

=end

  def self.find_by_brand(brand)
      products=self.product_array
      products.each do |product|
        if product.brand == brand
          return product
        end
      end
    end


    def self.find_by_name(name)
      products=self.product_array
      products.each do |product|
        if product.name == name
          return product
        end
      end
    end



def self.where(brand)
  product_array=[]
  products=self.product_array
  products.each do |product|
    if product.brand == brand
      product_array << product
    end
  end
  return product_array
end



  def self.product_array
    product_array=[]
    datas=CSV.read(@@data_path)
    datas.shift
    datas.each do |data|
    product_array << Product.create({id: data[0], brand: data[1], name: data[2], price: data[3]})
    end
    return product_array
  end



end
