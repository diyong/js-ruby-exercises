class StockPicker
	def initialize(arry)
		@arry = arry
	end

	def difference
		difference = []
		best_buy_days = []
		after_current = 0
		
		@arry.each do |i|
			after_current = @arry.index(i) + 1
			max_value = @arry[after_current..-1].max
			if max_value == nil
				max_value = @arry[-1]
			end
			difference << max_value - i
			best_buy_days << "The best day to buy is #{@arry.index(i) + 1} at a price of $#{i} and the best day to sell is #{@arry.index(max_value) + 1} at a price of $#{max_value}."
		end
		puts best_buy_days[difference.index(difference.max)]
	end
end

#test1 = StockPicker.new([1,2,3,4,5])
#test1 = StockPicker.new([12,4,5,2,7,10])
#test1 = StockPicker.new([2,6,9,10,1,5,6])
test1 = StockPicker.new([17,3,6,9,15,8,6,1,10])
test1.difference
