# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.firstname = 'admin'
  user.lastname = 'administrator'
  user.email = 'admin@admin.com'
  user.password = 'password'
  user.is_admin = true
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

# Create 2 standard users
User.find_or_create_by(email: 'demo@demo.com') do |user|
  user.firstname = 'demo'
  user.lastname = 'demo'
  user.email = 'demo@demo.com'
  user.password = 'password'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

User.find_or_create_by(email: 'demo2@demo.com') do |user|
  user.firstname = 'demo2'
  user.lastname = 'demo2'
  user.email = 'demo2@demo.com'
  user.password = 'password'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

# Create Provider user
# provider_count = 10
# if Provider.count < provider_count + 1
#   (provider_count - Provider.count).times do
#   end
# end

