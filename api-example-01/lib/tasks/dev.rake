namespace :dev do
  desc "Configura o ambiente de desenvolvimento"  
  task setup: :environment do
  
    puts "Iniciando processamento kind"
    kinds = %w(Amigo Comercial Conhecido)       
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    
    puts "Finalizando Processamento kind" 
    
    puts "Iniciando processamento Contact"
    100.times do |i|  
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birtdate: Faker::Date.between(35.days.ago, 18.years.ago),
        kind: Kind.all.sample
      ) 
    end       
    puts "Finalizando Processamento Contact"  
      
    puts "Iniciando processamento Phones"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end       
    puts "Finalizando Processamento Phones"  
    
    puts "Iniciando processamento Address"
    Contact.all.each do |contact|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
    end       
    puts "Finalizando Processamento Address"  
    
  end
end