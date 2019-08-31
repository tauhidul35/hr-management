class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable,
  # :recoverable, :rememberable, :validatable,
  devise :database_authenticatable, :trackable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    employee = find_by(email: auth.info.email)
    employee ||= new(email: auth.info.email)
    employee.provider = auth.provider
    employee.uid = auth.uid
    employee.token = auth.credentials.token
    employee.expires = auth.credentials.expires
    employee.expires_at = auth.credentials.expires_at
    employee.refresh_token = auth.credentials.refresh_token
    employee.save
    employee
  end
end
