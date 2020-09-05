class ComedianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :city, :image_url
  has_many :tvspecials
end
