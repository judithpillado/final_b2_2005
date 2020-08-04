require 'rails_helper'

RSpec.describe Hospital do

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    before(:each) do
      @hospital1 =  Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital2 =  Hospital.create!(name: "Seaside Health & Wellness Center")

      @meredith = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
      @karev = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")
      @bailey = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
      @mcdreamy = @hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania")
    end

    it '#unique_universities_attended' do
      expect(@hospital2.unique_universities_attended).to eq("#{@bailey.education} and #{@mcdreamy.education}")
    end
  end

end
