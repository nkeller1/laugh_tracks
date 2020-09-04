require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :city }
  end

  describe 'relationships' do
    it { should have_many :tvspecials}
  end
end
