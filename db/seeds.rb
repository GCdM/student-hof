# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

s1 = Student.create(name: Faker::Name.name, img_url: Faker::Avatar.image, github_url: Faker::Internet.email, graduated: true)
p1 = Project.create(title: Faker::App.name, live_url: 'www.example-url.com', frontend_repo: 'www.example-frontend-repo.com', backend_repo: 'www.example-backend-repo.com')
Contribution.create(project: p1, student: s1)

40.times do
    Student.create(name: Faker::Name.name, img_url: Faker::Avatar.image, github_url: Faker::Internet.email, graduated: true)
end

20.times do
    Student.create(name: Faker::Name.name, img_url: Faker::Avatar.image, github_url: Faker::Internet.email, graduated: false)
end

30.times do
    Project.create(title: Faker::App.name, live_url: 'www.example-url.com', frontend_repo: 'www.example-frontend-repo.com', backend_repo: 'www.example-backend-repo.com')
end

Project.all.each do |proj|
    2.times do
        Contribution.create(project: proj, student: Student.all.sample)
    end
end

puts "-----------------------------"
puts "----------- SEEDED ----------"
puts "-----------------------------"
