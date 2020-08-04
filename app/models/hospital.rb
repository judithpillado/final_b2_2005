class Hospital < ApplicationRecord

  validates_presence_of :name

  has_many :doctors

  def unique_universities_attended
    doctors.pluck(:education).uniq.to_sentence
  end
end
