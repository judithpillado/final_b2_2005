require 'rails_helper'

RSpec.describe Patient do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    before(:each) do
      @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)
    end

    it "old_to_young" do
      expect(Patient.old_to_young).to eq([@patient2, @patient3, @patient1, @patient4])
    end
  end

end
