# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



Faker::Config.locale = 'pt-BR'
   

100.times do
    App::HealthInsurance.create(name: Faker::Company.name)
    App::HealthUnit.create(name: Faker::Company.name, city: Faker::Address.city, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone, category: ['UPA', 'Hospital', 'Clínica', 'UBS', 'Pronto Socorro', 'Pronto Atendimento'].sample, token: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3))
    App::Area.create(name: Faker::Job.field)
    App::Specialization.create(name: Faker::Job.position, area_id: App::Area.all.sample.id)
    App::Professional.create(name: Faker::Name.name, crm: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3), role: ['Médico', 'Enfermeiro', 'Técnico de Enfermagem', 'Recepcionista'].sample)
    App::Workspace.create(health_unit_id: App::HealthUnit.all.sample.id)
    App::Queue.create(workspace_id: App::Workspace.all.sample.id, category: ['Normal', 'Prioritária', 'Pediatrica'].sample)
  end


