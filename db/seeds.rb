Pet.destroy_all
Shelter.destroy_all
# Application.destroy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all

shelter1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
pet1 = shelter1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
pet2 = shelter1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
pet3 = shelter1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)

shelter2 = Shelter.create(name: 'Austin shelter', city: 'Austin, TX', foster_program: true, rank: 7)
pet4 = shelter2.pets.create(name: 'Snickers', breed: 'great dane', age: 12, adoptable: true)
pet5 = shelter2.pets.create(name: 'Clawdia', breed: 'terrier', age: 11, adoptable: true)
pet6 = shelter2.pets.create(name: 'Bailey', breed: 'great pyranese', age: 8, adoptable: true)

vet_office = VeterinaryOffice.create(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20)
vet1 = vet_office.veterinarians.create(name: 'Taylor', review_rating: 10, on_call: true)
vet2 = vet_office.veterinarians.create(name: 'Tanya', review_rating: 9, on_call: true)
vet3 = vet_office.veterinarians.create(name: 'Jim', review_rating: 8, on_call: true)
vet4 = vet_office.veterinarians.create(name: 'Sam', review_rating: 10, on_call: false)
