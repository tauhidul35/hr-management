# Create default admin user
default_admin = Admin.find_by(email: 'admin@misfit.tech')

if default_admin
  puts "Default admin already exist with email #{default_admin.email}"
else
  default_admin = Admin.create(email: 'admin@misfit.tech',
                               password: 'MisFit9102',
                               password_confirmation: 'MisFit9102')
  puts "Default admin created with email #{default_admin.email}"
end
