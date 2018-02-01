#This exercise required me to create certain Enumerable methods from scratch. 
#Through this exercise, I practiced my understanding of blocks, procs, modules, iterators, and more. 

module Enumerable 

  def my_each
    return to_enum(__method__) unless block_given?
    for i in 0...self.length
      yield(self[i])
    end
    self
	end

	def my_each_with_index
		return to_enum(__method__) unless block_given?
		for i in 0...self.length
			yield(self[i], i)
		end
		self
	end	

	def my_select
		return to_enum(__method__) unless block_given?
		result_array = []
		for i in 0...self.length
			if yield(self[i]) == true
				result_array << self[i]
			else
				next
			end
		end
		result_array
	end

	def my_all?
		return true unless block_given?
		for i in 0...self.length
			if yield(self[i]) == false
				return false
			else
				next
			end
		end
		return true
	end

	def my_none?
		unless block_given?
			if self.include?(true) == true
				return false 
			else
				return true
			end
		end
		for i in 0...self.length
			if yield(self[i]) == false
				return true
			else
				next
			end
		end
		return false
	end

	def my_count(*num)
		counter = 0
		unless block_given?
			if num.empty?
				return self.length
			else
				for i in 0...self.length
					if self[i] == num
						counter += 1
					else
						next
					end
				end
			end
			return counter
		end
		for i in 0...self.length
			if yield(self[i]) == true
				counter += 1
			else
				next
			end
		end
		return counter
	end

	def my_map(&my_proc)
		return to_enum(__method__) unless block_given? || my_map_proc
		result = []
		if block_given?
			for i in 0...self.length
				result << yield(self[i])
			end
		elsif my_proc
			for i in 0...self.length
				result << my_proc.call(self[i])
			end
		end
		return result
	end

	def my_inject(num=nil)
		arry_copy = self.dup
		num ||= arry_copy.shift
		arry_copy.my_each do |x|
			num = yield(num, x)
		end
		return num
	end

	def multiply_els
		self.my_inject {|total, x| total * x }
	end
end

