module Admins
  class EmployeesController < ApplicationController
    # before_action set_employee, only: %i[show edit destroy]

    def index
      @employees = Employee.all
    end

    def show; end

    def new
      @employee = Employee.new
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to admins_employee_path @employee
      else
        render :new
      end
    end

    def edit; end

    def update; end

    def destroy; end

    private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:emp_id, :att_device_id, :name, :email,
                                       :joining_date, :designation)
    end
  end
end
