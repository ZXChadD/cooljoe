# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.firstname = 'admin'
  user.lastname = 'administrator'
  user.email = 'admin@admin.com'
  user.password = '123456'
  user.is_admin = true
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

# Create 2 standard users
User.find_or_create_by(email: 'user1@user.com') do |user|
  user.firstname = 'user1'
  user.lastname = 'user1'
  user.email = 'user1@user.com'
  user.password = '123456'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

User.find_or_create_by(email: 'user2@user.com') do |user|
  user.firstname = 'user2'
  user.lastname = 'user2'
  user.email = 'user2@user.com'
  user.password = '123456'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

# Create Provider
Provider.find_or_create_by(email: 'provider1@provider.com') do |provider|
  provider.firstname = 'provider1'
  provider.lastname = 'provider1'
  provider.email = 'provider1@provider.com'
  provider.password = '123456'
  provider.license_num = 12345678
  provider.tel_num = 12345678
end

# Create Provider users
# provider_count = 10
# if Provider.count < provider_count + 1
#   (provider_count - Provider.count).times do
#   end
# end

