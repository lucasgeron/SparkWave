Faker::Config.locale = 'pt-BR'

10.times do
  App::HealthInsurance.create(name: Faker::Company.name)
end

10.times do
   p heath_unit = App::HealthUnit.create(name: Faker::Company.name, 
                                      city: Faker::Address.city, 
                                      address: Faker::Address.street_address, 
                                      phone: Faker::PhoneNumber.cell_phone, 
                                      category: App::HealthUnit::CATEGORIES.sample, 
                                      token: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3))

  App::Queue::CATEGORIES.each do |category|
    p App::Queue.create(health_unit_id: heath_unit.id, category: category)
  end

  100.times do
    p App::User.create(queue_id: App::Queue.all.sample.id, 
                        finished: Faker::Boolean.boolean, 
                        reference:Faker::Alphanumeric.alphanumeric(number: 5, min_alpha: 2, min_numeric: 3),
                        updated_at: rand(1..60).minutes.after )
  end
  
end


