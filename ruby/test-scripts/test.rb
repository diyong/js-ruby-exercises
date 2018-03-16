require "httparty"
require "pp"

class Rep
	include HTTParty
	default_params :output => "json"
	format :json
end

puts "Please enter your zip: "
input = gets.chomp

raw = Rep.get("http://whoismyrepresentative.com/getall_mems.php", query: { zip: input })

raw = raw["results"]

i = 1

raw.each do |node|
	puts "Representative: #{i}"
	puts "Name: #{node["name"]}"
	puts "Party: #{node["party"]}"
	puts "State: #{node["state"]}"
	case node["district"]
	when ""
		puts "District: Representative is a Senator"
	else
		puts "District: #{node["district"]}"
	end
	puts "Phone: #{node["phone"]}"
	puts "Office Address: #{node["office"]}"
	case node["link"]
	when ""
		puts "Link: No URL available"
	else
		puts "Link: #{node["link"]}"
	end
	i += 1
	puts
end