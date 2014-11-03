# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |n|
  job_title  = Faker::Name.title 
  posted_on = Faker::Date.between(10.days.ago, Date.today)
  category = "Software Engineering"
  desc = Faker::Lorem.paragraphs(3)
  app_instructions = Faker::Lorem.paragraphs(1)
  company_name = Faker::Company.name
  company = Company.create!(name: company_name) 
  
  JobPosting.create!(job_title:  job_title,
               posted_on: posted_on,
               job_desc: desc,
               category: category,
               application_instructions: app_instructions,
               company: company
               )
end
