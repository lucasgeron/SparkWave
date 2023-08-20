Faker::Config.locale = 'pt-BR'

10.times do
  heath_unit = App::HealthUnit.create(name: Faker::Company.name,
                                      city: Faker::Address.city,
                                      address: Faker::Address.street_address,
                                      phone: Faker::PhoneNumber.cell_phone,
                                      category: App::HealthUnit::CATEGORIES.sample,
                                      token: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3))

  QueueCategory.list.each do |category|
    App::Queue.create(health_unit_id: heath_unit.id, category: category)
  end
end
