puts "Cleaning database..."

Project.destroy_all

for i in 1..10
  Project.create!(name: "Project #{i}", address: "Address #{i}", company: "Company #{i}")
end

puts "Projects created..."
