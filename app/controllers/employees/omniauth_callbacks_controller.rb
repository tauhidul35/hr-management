module Employees
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @employee = Employee.from_omniauth(request.env['omniauth.auth'])
      if @employee.persisted?
        sign_in @employee, event: :authentication # this will throw if @employee is not activated
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        session['devise.google_data'] = request.env['omniauth.auth']
      end
      redirect_to root_path
    end

    def after_omniauth_failure_path_for(scope)
      root_path
    end
  end
end
