class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :city, :image_url
  has_many :tvspecials, dependent: :destroy

  def count_tv_specials
    self.tvspecials.length
  end

  def self.average_age
    self.all.average(:age).round
  end

  def self.list_uniq_cities
    self.all.select(:city).distinct.pluck(:city)
  end

  def self.count_group_tvspecials
    all.joins(:tvspecials).count
  end
end
