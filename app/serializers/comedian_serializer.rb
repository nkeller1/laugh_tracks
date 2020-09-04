class ComedianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :city
  has_many :tvspecials
end
