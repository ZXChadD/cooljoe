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
  provider.firstname = 'pro_firstname1'
  provider.lastname = 'pro_lastname1'
  provider.email = 'provider1@provider.com'
  provider.password = '123456'
  provider.license_num = 12345678
  provider.tel_num = Faker::Number.number(8)
  provider.description = "description"
  provider.experience = 4
  provider.avatar = Faker::Avatar.image  
end

# Create Providers
provider_count = 10
if Provider.count < provider_count + 1
  (provider_count - Provider.count).times do
    n = Provider.last.id + 1
    firstname = "pro_firstname#{n}"
    lastname = "pro_lastname#{n}"
    email = "provider#{n}@provider.com"
    password = '123456'
    license_num = 12345678
    tel_num = Faker::Number.number(8)
    description = "description"
    experience = Faker::Number.between(1, 4)
    avatar = Faker::Avatar.image

    provider = Provider.create(firstname: firstname, lastname: lastname, email: email, password: password, license_num: license_num, tel_num: tel_num, description: description, experience: experience, remote_avatar_url: avatar)
  end
end

