dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

class Substrings
	@@result = {}
	def initialize(string, dictionary)
		@string = string.tr(",.!?", "").downcase.split(" ")
		@dictionary = dictionary
	end

	def num_of_substrings
		@string.each do |x|
			@dictionary.each do |y|
				if x.match?(y)
					if @@result[y] == nil
						@@result[y] = x.scan(y).count
					else
						@@result[y] += x.scan(y).count
					end
				else
					next
				end
			end
		end
		puts @@result
	end
end

test1 = Substrings.new("Howdy partner, sit down! How's it going?", dictionary)
test1.num_of_substrings