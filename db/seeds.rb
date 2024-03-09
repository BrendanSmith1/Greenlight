puts "Cleaning database..."

ProjectUser.destroy_all
Drawing.destroy_all
Project.destroy_all

for i in 1..10
  Project.create!(name: "Project #{i}", address: "Address #{i}", company: "Company #{i}", user: User.second )
end

puts "Projects created..."

for i in 1..100
  Drawing.create!(name: "Drawing #{i}", number: Faker::Alphanumeric.alphanumeric(number: 10), revision:('A'..'Z').to_a.sample, project: Project.all.sample)
end

puts "Drawings created..."
