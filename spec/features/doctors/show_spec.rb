require 'rails_helper'

RSpec.describe 'Doctors Show Page' do

  before(:each) do
    @hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @karev = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")

    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

    DoctorPatient.create(doctor_id: @meredith.id, patient_id: @patient1.id)
    DoctorPatient.create(doctor_id: @meredith.id, patient_id: @patient4.id)

    DoctorPatient.create(doctor_id: @karev.id, patient_id: @patient3.id)

  end

  it "displays doctor's information, including where they work and the names of their patients" do

    visit "/doctors/#{@meredith.id}"

    expect(page).to have_content("#{@meredith.name} M.D.")
    expect(page).to have_content("Specialty: #{@meredith.specialty}")
    expect(page).to have_content("Education: #{@meredith.education}")


    within('#patients') do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient4.name)
      expect(page).to_not have_content(@patient3.name)
    end
  end

end
