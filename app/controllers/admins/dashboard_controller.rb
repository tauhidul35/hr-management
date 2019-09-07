module Admins
  class DashboardController < Admins::ApplicationController
    def index
      @admin = current_admin
    end
  end
end
