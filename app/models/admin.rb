class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :registerable and :omniauthable
  devise :database_authenticatable, :trackable, :lockable, :timeoutable,
         :recoverable, :rememberable, :validatable
end
