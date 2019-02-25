# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'faker'
require 'json'
require 'csv'

# json_data = File.read("./db/data.json")
# data = JSON.parse( json_data )
# student_data = data["students"]
# project_data = data["projects"]

# student_data.each do |student|
#     Student.create(
#         name: student["name"],
#         img_url: student["avatar"],
#         github_url: Faker::Internet.email,
#         graduated: rand() < 0.5 ? true : false,
#     )
# end

# project_data.each do |project|
#     new_project = Project.create(
#         title: project["title"],
#         img_url: project["screenshot"],
#         live_url: project["url"],
#         frontend_repo: project["frontend_repo"],
#         backend_repo: project["backend_repo"],
#     )

#     project.students.each do |student_slug|
#         student = Student.find_by_slug(student_slug)
#         Contribution.create(
#             project: new_project,
#             student: student,
#         )
#     end
# end

GITHUB_USERS_API = "https://api.github.com/users"
GITHUB_AUTH_TOKEN = "3c71f471f2fc0e7689301a9f2a4ec74e73b8a9a5"
csv_london_data = File.read('./db/london_data.csv')
london_data = CSV.parse(csv_london_data, headers: true)

london_data.each do |student|
  response = RestClient.get(GITHUB_USERS_API + "/#{student["github_username"]}", { Authorization: "token " + GITHUB_AUTH_TOKEN })
  student_github = JSON.parse(response.body)

  new_student = Student.create(
    first_name: student["first_name"].capitalize, 
    last_name: student["last_name"].capitalize,
    github_username: student["github_username"],
    img_url: student_github["avatar_url"]
  )
  
  puts "Created: " + new_student.full_name
end

puts "------------------------------"
puts "----------- SEEDED -----------"
puts "------------------------------"
