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

# Create Users
user_count = 15
if User.count < user_count + 2
  (user_count - User.count).times do
    n = User.count
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = "user#{n}@user.com"
    password = '123456'
    is_admin = false
    tel_num = ("8#{Faker::Number.number(7)}").to_i
    user_address = Faker::Address.street_address

    User.create(firstname: firstname, lastname: lastname, email: email, password: password, is_admin: is_admin, tel_num: tel_num, user_address: user_address)
  end
end

# Create Providers
provider_count = 15
if Provider.count < provider_count + 1
  image_arr = ["http://i.imgur.com/bOCEefn.jpg", "http://i.imgur.com/9eABcLj.jpg", "http://i.imgur.com/yTJvpOc.png", "http://i.imgur.com/VN2yph7.png", "http://i.imgur.com/7hpAvw9.png", "http://i.imgur.com/IUf9Qxw.jpg", "http://i.imgur.com/dBWNHT2.png", "http://i.imgur.com/259G4eK.png", "http://i.imgur.com/Wwjb9Qq.png", "http://i.imgur.com/OA3SfYk.png", "http://i.imgur.com/F4998eD.png", "http://i.imgur.com/Xqg1zg5.png", "http://i.imgur.com/AM5dR4p.png", "http://i.imgur.com/XRcwN5x.jpg", "http://i.imgur.com/nckeDzd.jpg"].cycle
  
  (provider_count - Provider.count).times do
    n = Provider.count + 1
    firstname = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = "provider#{n}@provider.com"
    password = '123456'
    license_num = 12345678
    tel_num = ("9#{Faker::Number.number(7)}").to_i
    description = "description"
    experience = Faker::Number.between(1, 4)
    avatar = image_arr.next

    provider = Provider.create(firstname: firstname, lastname: lastname, email: email, password: password, license_num: license_num, tel_num: tel_num, description: description, experience: experience, remote_avatar_url: avatar)

    date = ['weekdays', 'weekends', 'all'].sample
    time = ['morning', 'afternoon', 'evening'].sample

    schedule = Schedule.create(provider_id: provider.id, date: date, time: time)

  end
end

# Create Likes
Provider.all.each do |provider|
  User.all.each do |user|
    unless user.is_admin
      if Faker::Boolean.boolean || (Like.where(provider_id: provider.id, user_id: user.id) == nil)
        user.likes.create(provider_id: provider.id)
      end
    end
  end
end

# Create Joblistings
joblisting_count = 100
if Joblisting.count < joblisting_count + 1
  image_arr = ["http://i.imgur.com/g8APGYvm.jpg", "http://i.imgur.com/SiR6LXsm.jpg", "http://i.imgur.com/yqH69lCm.jpg", "http://i.imgur.com/EadCjcQm.jpg", "http://i.imgur.com/s1r7GDBm.jpg"].cycle

  (joblisting_count - Joblisting.count).times do
    issue = ['Installation', 'Repair', 'Replace'].sample
    description = 'description'
    fixture = ['Wiring', 'Lights', 'Switches'].sample
    num_fixture = Faker::Number.between(1, 4)
    housing = ['HDBs', 'Condo', 'Landed'].sample
    job_address = Faker::Address.street_address
    date = ['5', '14', '31'].sample
    time = ['Morning', 'Afternoon', 'Evening'].sample
    status = Faker::Number.between(1, 5)

    user_id = Faker::Number.between(2, User.count)
    unless status == 1 || status == 5
      provider_id = Faker::Number.between(1, Provider.count)
    else
      provider_id = nil
    end
    joblisting = Joblisting.create(issue: issue, description: description, fixture: fixture, num_fixture: num_fixture, housing: housing, job_address: job_address, date: date, time: time, status: status, user_id: user_id, provider_id: provider_id)
    
    # Create Invoices
    if status == 4
      joblisting_id = joblisting.id
      job_description = 'description'
      price_size = Faker::Number.between(3, 4)
      price = Faker::Number.decimal(price_size, 2)
      invoice_status = Faker::Number.between(1, 3)
      invoice_ref = "CoolJoe_INV_#{Faker::Number.number(6)}"
      
      Invoice.create(provider_id: provider_id, joblisting_id: joblisting_id, job_description: job_description, status: invoice_status, price: price, invoice_ref: invoice_ref)
    end

    # Create Job_attaches
    job_attaches_count = Faker::Number.between(1, 3)
    job_attaches_count.times do
      image = image_arr.next
      title = 'title'
      job_listing_id = joblisting.id
    
      JobAttach.create(joblisting_id: job_listing_id, title: title, remote_image_url: image)
    end
  end
end
