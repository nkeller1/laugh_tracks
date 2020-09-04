class TvspecialSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :runtime
  belongs_to :comedian
end
