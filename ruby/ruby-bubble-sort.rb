#Using an optimized bubble sort.

class BubbleSort
	def initialize
	end

	def bubble_sort(arry)
		n = arry.length

		until n == 0
			new_n = 0
			for i in 1..(n-1) 
				if arry[i-1] > arry[i]
					arry[i-1], arry[i] = arry[i], arry[i-1]
					new_n = i
				end
			end
			n = new_n
		end
		return arry
	end

	#Assignment calls for sorting an array by string length. This was mainly to test 
	#yielding to blocks.

	def bubble_sort_by(arry)
		n = arry.length

		until n == 0
			new_n = 0
			for i in 1..(n-1)
				if yield(arry[i-1], arry[i])
					arry[i-1], arry[i] = arry[i], arry[i-1]
					new_n = i
				end
			end
			n = new_n
		end
		return arry
	end
end

test1 = BubbleSort.new
p test1.bubble_sort([4,3,78,2,0,2,10,8,9,25,31,18])
#p test1.bubble_sort_by(["hi", "hello", "hey", "hippo", "hater", "hag", "hat", "helicopter"]) {|left, right| left.length > right.length}
