# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |n|
  job_title  = Faker::Name.title 
  posted_on = 3.days.ago
  category = "Software Engineering"
  desc = Faker::Lorem.paragraphs(3)
  app_instructions = "http://www.google.com and email me at harsha.mvenkata@gmail.com"
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

15.times do |n|
  job_title  = Faker::Name.title 
  posted_on = 33.days.ago
  category = "Software Engineering"
  desc = Faker::Lorem.paragraphs(3)
  app_instructions = "http://www.google.com and email me at harsha.mvenkata@gmail.com"
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
