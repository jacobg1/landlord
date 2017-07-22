require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

# 1. See a list of all apartments (include ID#, address, and monthly rent)
# 2. See a list of all tenants (include name and age)
# 3. See a list of all apartments and their associated tenants (just address and name)

puts "Greetings MR PIZZA,"
puts "please enter 1 for apartment list, "
puts "2 for tenant list, "
puts "3 to view apartments with associated tenants, "
puts "4 to adjust rent"
puts "5 to evict tenant"
puts "6 to exit"
input = gets.chomp
while true do
Apartment.find_each do |apart|
  if input == "1"
    puts "ID: #{apart.id}, address: #{apart.address}, price: #{apart.monthly_rent}"
  end
end
Tenant.find_each do |tenant|
  if input == "2"
    puts "Id: #{tenant.id}, name: #{tenant.name}, age: #{tenant.age}"
  end
end
Apartment.find_each do |a|
  if input == "3"
    puts "address: #{a.address}"
    puts '*' * 50
      a.tenants.each do |tenants|
        puts tenants.name
      end
    puts "-" * 50
  end
end
if input == "4"
  puts "which apartment would you like to adjust rent for? enter ID #:"
  num = gets.chomp
  k = Apartment.find(num)
  puts "enter new rent amount:"
  new_rent = gets.chomp
  k.monthly_rent = new_rent
  k.save
  puts "#{k.address}, new rent: #{k.monthly_rent}"
end
if input == "5"
  puts "which tenant would you like to evict?"
  puts "WARNING: this is permanent"
  evict_tenant = gets.chomp
  j = Tenant.find(evict_tenant)
  j.destroy
  puts "tenant evicted"
end
if input == "6"
  break
end
input = gets.chomp
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
