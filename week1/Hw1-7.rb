class CartesianProduct
  include Enumerable
  
  def initialize(a, b)
    @a = a
    @b = b
    @array = []
    @a.each do |x|
      @b.each do |y|
        @array << [x, y]
      end
    end
  end      
  
  def each
    @array.each { |x| yield x }
  end  
end




# #TEST-----------------------------------------------------------------------------------
# c = CartesianProduct.new([:a,:b, :d,:E], [4,5,6])
# c.each { |elt| puts elt.inspect }
# # [:a, 4]
# # [:a, 5]
# # [:b, 4]
# # [:b, 5]
# 
# c = CartesianProduct.new([:a,:b], [])
# c.each { |elt| puts elt.inspect }
# # Nothing printed since Cartesian product of anything with an empty collection is empty