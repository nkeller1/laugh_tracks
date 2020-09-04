class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :city
  has_many :tvspecials, dependent: :destroy
end
