require_relative 'find_by'
require_relative 'errors'
require_relative 'product'
require_relative '../data/seeds'
require 'csv'
require 'fileutils'
require 'tempfile'

class Udacidata

  @@data_path=File.dirname(__FILE__) + "/../data/data.csv"
  @@data_path1=File.dirname(__FILE__) + "/../data/data1.csv"


  def self.create(option={})
      brand=option[:brand]
      name=option[:name]
      price=option[:price]
      id=option[:id]
      if option[:id]
        check=check_if_id_exists?(option[:id])
        if check == true
            new_product=Product.new({ brand: brand, name: name, price: price, id: id})
        else
            new_product=Product.new({ brand: brand, name: name, price: price})
            write_to_csv(id,brand,name,price)
          end
      else
        new_product=Product.new({ brand: brand, name: name, price: price})
        id=new_product.id
        write_to_csv(id,brand,name,price)
      end
        return new_product
      end


      def self.write_to_csv(id,brand,name,price)
        CSV.open(@@data_path, "ab") do |csv|
        csv << ["#{id}","#{brand}", "#{name}","#{price}"]
        end
      end


  def self.check_if_id_exists?(test_id)
    datas=CSV.read(@@data_path)
    datas.shift
    datas.each do |data|
    if  data[0] == test_id
      return true
      end
    end
      return false
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
  counter= -1
  list_product=[]
  products=[]
  products=self.product_array
  num_products=products.length
  if num == 1
    return products.last
  else
    num.times do
      list_product << products[counter]
      counter = counter -1
  end
    return list_product
  end
end


  def self.find(id)
    products=self.product_array
    products.each do |product|
      if product.id == id
        return product
      end
    end
    raise ProductNotFoundError, " Product ID #{id} does not  exist."
  end

  def self.destroy(id,option ={})
    destroyed=find(id)
    row=find_row(id)
    new_products = CSV.read(@@data_path, headers:true)
    new_products.delete(row)
    CSV.open(@@data_path, "wb") do |csv|
      csv << ["id", "brand", "product", "price"]
    end
    CSV.open(@@data_path, "ab") do |csv|
        new_products.each do |product|
        csv << product
    end
  end
  return destroyed
  end


def self.find_row(id)
    products=product_array
    row=product_array.find_index { |product| product.id == id }
    return row
  end



def self.where(options={})
      brand=options[:brand]
      name=options[:name]
      product_array=[]
      products=self.product_array
      if options[:brand]
        product_array=products.select { |product| product.brand == brand }
      end
      if options[:name]
        product_array= products.select { |product| product.name == name }
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



def update(options={})
      new_products = CSV.read(@@data_path, headers:true)
      row=Product.find_row(self.id)
      if options[:brand]
          self.brand = options[:brand]
          new_products[row]["brand"]=options[:brand]
      end
      if options[:name]
        self.name = options[:name]
        new_products[row]["name"]=[:name]
      end
      if options[:price]
          self.price = options[:price]
          new_products[row]["price"]=options[:price]
      end
      Product.write_data(new_products)
        return self
      end


def self.write_data(new_products)
    CSV.open(@@data_path, "wb") do |csv|
    csv << ["id", "brand", "product", "price"]
  end
    CSV.open(@@data_path, "ab") do |csv|
    new_products.each do |product|
      csv << product
    end
  end
end





end
