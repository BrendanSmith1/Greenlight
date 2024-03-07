puts "Cleaning database..."

Drawing.destroy_all
Project.destroy_all

for i in 1..10
  Project.create!(name: "Project #{i}", address: "Address #{i}", company: "Company #{i}", user: User.second )
end

puts "Projects created..."

for i in 1..10
  Drawing.create!(name: "Drawing #{i}", number: Faker::Alphanumeric.alphanumeric(number: 10), revision:'A', project: Project.all.sample)
end

puts "Drawings created..."
