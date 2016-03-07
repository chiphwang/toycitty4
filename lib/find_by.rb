class Module


def create_finder_methods(*attributes)
  # Your code goes here!
  # Hint: Remember attr_reader and class_eval
    attributes.each do |attribute|
    finder_methods = %Q{
      def find_by_#{attribute}(item)
          products=Product.product_array
          products.each do |product|
          if product.#{attribute} == item
            return product
            end
            end
           end
    }
    class_eval(finder_methods)
  end
end



end
