# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.first_name = 'admin'
  user.last_name = 'administrator'
  user.email = 'admin@admin.com'
  user.password = 'password'
  user.is_admin = true
  user.telephone = 12345678
  user.address = Faker::Address.street_address
end