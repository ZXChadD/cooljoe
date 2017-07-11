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
user2 = User.find_or_create_by(email: 'user1@user.com') do |user|
  user.firstname = Faker::Name.first_name
  user.lastname = Faker::Name.last_name
  user.email = 'user1@user.com'
  user.password = '123456'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

user3 = User.find_or_create_by(email: 'user2@user.com') do |user|
  user.firstname = Faker::Name.first_name
  user.lastname = Faker::Name.last_name
  user.email = 'user2@user.com'
  user.password = '123456'
  user.is_admin = false
  user.tel_num = 12345678
  user.user_address = Faker::Address.street_address
end

# Create Providers
provider_count = 15
if Provider.count < provider_count + 1
  (provider_count - Provider.count).times do
    n = Provider.count + 1
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = "provider#{n}@provider.com"
    password = '123456'
    license_num = 12345678
    tel_num = Faker::Number.number(8)
    description = "description"
    experience = Faker::Number.between(1, 4)
    avatar = Faker::Avatar.image

    provider = Provider.create(firstname: firstname, lastname: lastname, email: email, password: password, license_num: license_num, tel_num: tel_num, description: description, experience: experience, remote_avatar_url: avatar)

    date = ['weekdays', 'weekends', 'all'].sample
    time = ['morning', 'afternoon', 'evening'].sample

    schedule = Schedule.create(provider_id: provider.id, date: date, time: time)

  end
end

# Create Joblistings
joblisting_count = 50
if Joblisting.count < joblisting_count + 1
  (joblisting_count - Joblisting.count).times do
    issue = ['Installation', 'Repair', 'Replace'].sample
    description = 'description'
    fixture = ['Wiring', 'Lights', 'Switches'].sample
    num_fixture = Faker::Number.between(1, 4)
    housing = ['HDBs', 'Condo', 'Landed'].sample
    job_address = 'Job address'
    date = ['5', '14', '31'].sample
    time = ['Morning', 'Afternoon', 'Evening'].sample
    status = Faker::Number.between(1, 4)
    user_id = Faker::Number.between(1, User.count)
    provider_id = Faker::Number.between(1, Provider.count)

    joblisting = Joblisting.create(issue: issue, description: description, fixture: fixture, num_fixture: num_fixture, housing: housing, job_address: job_address, date: date, time: time, status: status, user_id: user_id, provider_id: provider_id)
  end
end
