class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :city, :image_url
  has_many :tvspecials, dependent: :destroy

  def count_tv_specials
    self.tvspecials.length
  end

  def self.average_age
    self.all.average(:age).round
  end
end
