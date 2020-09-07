class ComedianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :city, :image_url, :count_tv_specials
  has_many :tvspecials
end
