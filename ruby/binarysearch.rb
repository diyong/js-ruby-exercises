def binary_search(arry, target)
	min = 0
	max = arry.length - 1

	while min <= max
		mid = (min + max) / 2

		if arry[mid] == target
			return "Target: #{target} found at index: #{mid}."
		elsif arry[mid] < target
			min = mid + 1
		elsif arry[mid] > target
			max = mid - 1
		else
			return "Target not found."
		end
	end
end

def binary_search_rec(arry, target)
	min = 0
	max = arry.length - 1

	if arry.length == 0
		return "#{target} not found."
	else
		mid = (min + max) / 2

		if arry[mid] == target
			return "#{target} found."
		else
			if arry[mid] > target
				return binary_search_rec(arry[min, mid - 1], target)
			else
				return binary_search_rec(arry[mid + 1, max], target)
			end
		end
	end
end