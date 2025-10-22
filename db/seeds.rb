# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


PotatoPriceTime.destroy_all

date = Date.parse("2025-01-01")
start_time = Time.parse("#{date} 09:00:00")

10.times do |i|
  PotatoPriceTime.create!(
    time: start_time + i.hours,
    value: rand(100.0..101.0).round(2)
  )
end

puts "Seeded #{PotatoPriceTime.count} potato price time records."
