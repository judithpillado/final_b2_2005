require 'rails_helper'

RSpec.describe 'Patient Index Page' do

  before(:each) do
    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)
  end

  it "displays names of patients listed from oldest to youngest" do

    visit "/patients"

    # expect(page).to have_content(@patient2.name)
    # expect(page).to have_content(@patient3.name)
    # expect(page).to have_content(@patient1.name)
    # expect(page).to have_content(@patient4.name)
    expect(@patient2.name).to appear_before(@patient3.name)
    expect(@patient3.name).to appear_before(@patient1.name)
    expect(@patient1.name).to appear_before(@patient4.name)
    expect(@patient4.name).to_not appear_before(@patient1.name)
  end

end
