
class Cypher
	@@key = "abcdefghijklmnopqrstuvwxyz"

	def initialize(string, num)
		@string = string.split("")
		@num = num
	end

	def encode
		@string.map! do |x|
			if x != x.downcase
				generator(x.downcase).upcase
			else
				generator(x)
			end
		end

		return @string.join("")
	end

	def generator(x)
		if x.match?(/^\w$/i) && ((@@key.index(x) + @num) > 25)
			x = @@key[(25+@num)-26]
		elsif x.match?(/^\w$/i) && ((@@key.index(x) + @num) < 25)
			x = @@key[@@key.index(x) + @num]
		else
			x = x
		end
		return x
	end
end

test1 = Cypher.new("How about this?", 5)
puts test1.encode


