require "pry"
class Cart
	def initialize
		@items = []
		@unique_a = []
	end

	def calculate_price
		total_price = 0
		@items.each do |x|
			total_price += x.modified_price
		end 
		puts total_price
	end

	def filter(banana)
		@unique_a = @items.uniq
		total_price = 0
		@unique_a.each do |x|
			temp = @items.select {|y| y==x}
			if x.class.to_s == "Apple" && temp.length > 1
				price_modifier = ((temp.length.to_f/2).to_i)*x.modified_price
				puts "#{x.name}: #{temp.length} #{((x.modified_price) * temp.length) - price_modifier}"
				checkout = ((x.modified_price) * temp.length) - price_modifier
			elsif  x.class.to_s == "Oranges" && temp.length > 2
				price_modifier = ((temp.length.to_f/3).to_i)*x.modified_price
				puts "#{x.name}: #{temp.length} #{((x.modified_price) * temp.length) - price_modifier}"
				checkout = ((x.modified_price) * temp.length) - price_modifier
			elsif x.class.to_s == "Grapes" && temp.length > 3
				price_modifier = ((temp.length.to_f/4).to_i)
				(1..price_modifier).each do |o|
					@unique_a.push banana
					@items.push banana
					puts "#{x.name}: #{temp.length} #{((x.modified_price) * temp.length)}"
					checkout = ((x.modified_price) * temp.length)
				end

			else puts "#{x.name}: #{temp.length} #{((x.modified_price) * temp.length)}"
				checkout = ((x.modified_price) * temp.length)
			end
			total_price += checkout.to_i	
	end
	puts total_price

	end
	def add_item(fruit)
		@items.push(fruit)
	end
end

class Items
@@today = "sunday"
@@season = "summer"

attr_reader :name, :price
	def initialize(name, price)
		@name = name
		@price = price
	end

	def modified_price
		if @@season == "spring"
			price = @price

		elsif @@season == "summer"
			price = @price

		elsif @@season == "autumn"
			price = @price

		elsif @@season == "winter"
			price = @price

	end
end
end

class Banana < Items
	def modified_price
		if @@season == "winter"
			price = 21

		else
			price = @price

		end
	end
end

class Apple < Items
	def modified_price
		if @@season == "autumn"
			price = 15

		elsif @@season == "winter"
			price = 12

		else
			price = @price

		end
	end
end

class Oranges < Items
	def modified_price
		if @@season == "summer"
			price = 2

		else
			price = @price
		end
	end
end

class Grapes < Items
end


class Watermelon < Items
	def modified_price
		if @@today == "sunday"
			@price = price * 2
		else
			price = @price
		end

	end
end

cart1 = Cart.new	
apples = Apple.new("apples", 10)
oranges = Oranges.new("oranges", 5)
grapes = Grapes.new("grapes", 15)
banana = Banana.new("banana", 20)
watermelon = Watermelon.new("watermelon", 50)

cart1.add_item(oranges)


cart1.filter(banana)