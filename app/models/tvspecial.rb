class Tvspecial < ApplicationRecord
  validates_presence_of :name, :runtime
  belongs_to :comedian
end
