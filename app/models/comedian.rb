class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :city, :image_url
  has_many :tvspecials, dependent: :destroy

  def count_tv_specials
    self.tvspecials.length
  end

  def self.average_age
    self.all
    .average(:age)
    .round
  end

  def self.list_uniq_cities
    self.all
    .select(:city)
    .distinct
    .pluck(:city)
  end

  def self.count_group_tvspecials
    self.all
    .joins(:tvspecials)
    .count
  end

  def self.average_run_length_of_tv_special
    if all.count_group_tvspecials == 0
      "No TV Specials for this group"
    else
      self.all
      .joins(:tvspecials)
      .average(:runtime).round
    end
  end
end
