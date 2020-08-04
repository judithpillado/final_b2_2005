require 'rails_helper'

RSpec.describe 'Hospital Show Page' do

  before(:each) do
    @hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 =  Hospital.create!(name: "Seaside Health & Wellness Center")

    @bailey = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @mcdreamy = @hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
  end

  it "displays hospital's name as well the nmber of doctors that work there and the list of universities attended " do

    visit "/hospitals/#{@hospital2.id}"

    expect(page).to have_content(@hospital2.name)
    expect(page).to_not have_content(@hospital1.name)

    within('.doctor-info') do
      expect(page).to have_content("This hospital has 2 doctors.")
      expect(page).to have_content(@bailey.education)
      expect(page).to have_content(@mcdreamy.education)
    end
  end

end
