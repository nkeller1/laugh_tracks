require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :city }
    it { should validate_presence_of :image_url }
  end

  describe 'relationships' do
    it { should have_many :tvspecials}
  end

  it ".count_tv_specials" do
    com1 = Comedian.create({
      name: "Nate",
      age: 35,
      city: "Denver",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    com2 = Comedian.create(
      name: "J Dog",
      age: 30,
      city: "Arvada",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_6JOIep3YiTWHQ4LyD0OcQoR5XJV7u31tgg&usqp=CAU"
    )

    tvspecial1 = com1.tvspecials.create(name: 'All About Me', runtime: 70)
    tvspecial2 = com1.tvspecials.create(name: 'Not My Special', runtime: 100)

    expect(com1.count_tv_specials).to eq(2)
    expect(com2.count_tv_specials).to eq(0)
  end

  it "#average_age" do
    com1 = Comedian.create({
      name: "Nate",
      age: 35,
      city: "Denver",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    com2 = Comedian.create(
      name: "J Dog",
      age: 30,
      city: "Arvada",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_6JOIep3YiTWHQ4LyD0OcQoR5XJV7u31tgg&usqp=CAU"
    )

    com3 = Comedian.create({
      name: "Rufio",
      age: 20,
      city: "Denver",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    com4 = Comedian.create(
      name: "Sage",
      age: 30,
      city: "Arvada",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_6JOIep3YiTWHQ4LyD0OcQoR5XJV7u31tgg&usqp=CAU"
    )

    expect(Comedian.all.average_age).to eq(29)
  end

  it "#lists_uniq_cities" do
    com1 = Comedian.create({
      name: "Nate",
      age: 35,
      city: "Denver",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    com2 = Comedian.create(
      name: "J Dog",
      age: 30,
      city: "Arvada",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_6JOIep3YiTWHQ4LyD0OcQoR5XJV7u31tgg&usqp=CAU"
    )

    com3 = Comedian.create({
      name: "Rufio",
      age: 20,
      city: "Denver",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    com4 = Comedian.create(
      name: "Sage",
      age: 30,
      city: "Arvada",
      image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS_6JOIep3YiTWHQ4LyD0OcQoR5XJV7u31tgg&usqp=CAU"
    )

    expect(Comedian.all.lists_uniq_cities).to eq(["Arvada", "Denver"])
  end
end
