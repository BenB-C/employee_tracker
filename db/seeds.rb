# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Division.destroy_all
Employee.destroy_all
Project.destroy_all
EmployeeProject.destroy_all

employees = []
10.times do |index|
  division = Division.create!(name: Faker::Job.unique.field)
  5.times do |index|
    employee = Employee.create!(name: Faker::Name.name, division_id: division.id)
    employees.push(employee)
  end
end
p "#{Employee.all.length} employees created"
p "#{Division.all.length} divisions created"

projects = []
10.times do |index|
  project = Project.create!(name: Faker::Job.unique.key_skill)
  projects.push(project)
end
p "#{Project.all.length} projects created"
employees.each_with_index do |employee, i|
  num_projects = rand(1..4)
  employee_projects = projects.sample(num_projects)
  employee_projects.each { |project| employee.projects << project }
  # p "#{employee.projects.length} projects added to employee #{i + 1}"
end
p "#{EmployeeProject.all.length} employee_projects created"
