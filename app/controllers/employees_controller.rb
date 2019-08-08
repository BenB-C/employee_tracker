class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    render :index
  end

  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    # binding.pry
    if @employee.save
      flash[:notice] = "Employee successfully added!"
      redirect_to division_path(id: params[:division_id])
    else
      flash[:alert] = "Employee couldn't be added!"
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
    @employee = Employee.find(params[:id])
    render :show
  end

  def update
    @employee= Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employee_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :division_id)
  end

end
