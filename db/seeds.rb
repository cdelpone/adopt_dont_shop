Pet.destroy_all
Shelter.destroy_all
Application.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

application1 = Application.create!(name: 'Xtina', street: '3431 N Vine Street', city: 'Denver', state: 'Colorado', zip: '85523', description: 'this is why I would make the best dog mom')

shelter1 = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
pet1 = shelter1.pets.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true)
pet2 = shelter1.pets.create(name: 'Pesto', age: 5, breed: 'Best Breed', adoptable: true)
pet3 = shelter1.pets.create(name: 'Clawdia', age: 3, breed: 'Mix', adoptable: true)

shelter2 = Shelter.create(name: 'Denver Shelter', city: 'Denver, CO', foster_program: true, rank: 7)
pet4 = shelter2.pets.create(name: 'Scooby', age: 5, breed: 'Great Dane', adoptable: true)
pet5 = shelter2.pets.create(name: 'Clawdia', age: 3, breed: 'Mix', adoptable: true)
pet6 = shelter2.pets.create(name: 'Dawson', age: 2, breed: 'Great Pyrenees', adoptable: true)

vet_office = VeterinaryOffice.create(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20)
vet1 = vet_office.veterinarians.create(name: 'Taylor', review_rating: 10, on_call: true)
vet2 = vet_office.veterinarians.create(name: 'Tanya', review_rating: 9, on_call: true)
vet3 = vet_office.veterinarians.create(name: 'Jim', review_rating: 8, on_call: true)
vet4 = vet_office.veterinarians.create(name: 'Sam', review_rating: 10, on_call: false)
