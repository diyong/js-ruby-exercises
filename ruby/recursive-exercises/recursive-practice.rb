module RecursiveExercises

	#Non-recursive fibonacci sequence method. This method will spit out the 
	#fibonacci sequence up to "num" position.
	def fib(num, arry = [0, 1])
		counter = 2

		if num == 0
			arry[0]
		elsif num == 1
			arry[1]
		else
			while counter <= num
				arry[counter] = arry[counter-1] + arry[counter-2]
				counter += 1
			end
		end
		puts arry.join(", ")
	end

	#Recursive. Same as above, but using a recursive design.
	def fib_rec(num)
		if num <= 1 then return num == 1 ? [0, 1] : [0] end
		arry = fib_rec(num - 1)
		return arry << arry[-1] + arry[-2] 
	end


	#Merge_sort to practice recursive design
	def merge_sort(arry)
		if arry.length <= 1
			arry
		else
			a = arry[0...(arry.length / 2)]
			b = arry[(arry.length / 2)..arry.length]
			merge(merge_sort(a), merge_sort(b))
		end
	end

	#Tail call. Had to be iterative because of stack error (stack level too deep)
	def merge(a, b)
		x = []

		while !a.empty? && !b.empty?
			if a[0] < b[0]
				x << a.shift
			else
				x << b.shift
			end
		end

		x + a + b
	end
end