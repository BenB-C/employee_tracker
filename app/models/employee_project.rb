class EmployeeProject < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  scope :available_projects, -> (employee_id) { where("employee.id != ?", "#{employee_id}")}
end
