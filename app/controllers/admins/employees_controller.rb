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

    def create; end

    def edit; end

    def update; end

    def destroy; end

    private

    def set_employee
      @employee = Employee.find(params[:id])
    end
  end
end
