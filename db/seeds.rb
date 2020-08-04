# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Hospitals:
hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")
hospital2 =  Hospital.create!(name: "Seaside Health & Wellness Center")

# Doctors:
meredith = hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
karev = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
bailey = hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
mcdreamy = hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")

# Patients:
patient1 = Patient.create!(name: "Katie Bryce", age: 24)
patient2 = Patient.create!(name: "Denny Duquette", age: 39)
patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

DoctorPatient.create(doctor_id: meredith.id, patient_id: patient1.id)
DoctorPatient.create(doctor_id: meredith.id, patient_id: patient4.id)

DoctorPatient.create(doctor_id: karev.id, patient_id: patient3.id)
DoctorPatient.create(doctor_id: karev.id, patient_id: patient4.id)

DoctorPatient.create(doctor_id: bailey.id, patient_id: patient2.id)
DoctorPatient.create(doctor_id: bailey.id, patient_id: patient3.id)

DoctorPatient.create(doctor_id: mcdreamy.id, patient_id: patient1.id)
DoctorPatient.create(doctor_id: mcdreamy.id, patient_id: patient2.id)
