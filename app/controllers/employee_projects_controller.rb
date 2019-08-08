class EmployeeProjectsController < ApplicationController
  def new
    @employee = Employee.find(params[:id])
    @projects = Project.all - @employee.projects
    render :new
  end

  def create
    employee = Employee.find(params[:id])
    project = Project.find(params[:post][:project_id])
    employee.projects << project

    redirect_to employee_path(employee.id)
  end

  def destroy
    employee = Employee.find(params[:id])
    project = Project.find(params[:project_id])
    project.employees.delete(employee)
    redirect_to employee_path(employee)
  end
end
