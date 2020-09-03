class ComedianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :city
end
