require 'rails_helper'

RSpec.describe 'Can search for Comedians by params' do
  it "searchs by age" do
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
      age: 35,
      city: "Jamica",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    get '/api/v1/comedians?age=35'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include(com1.name)
    expect(response.body).to include(com1.city)
    expect(response.body).to include(com3.name)
    expect(response.body).to include(com3.city)
    expect(response.body).not_to include(com2.name)
    expect(response.body).not_to include(com2.city)
  end

  it "searchs by city" do
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
      age: 35,
      city: "Jamica",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    get '/api/v1/comedians?city=Jamica'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).not_to include(com1.name)
    expect(response.body).not_to include(com1.city)
    expect(response.body).to include(com3.name)
    expect(response.body).to include(com3.city)
    expect(response.body).not_to include(com2.name)
    expect(response.body).not_to include(com2.city)
  end

  it "searchs by name" do
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
      age: 35,
      city: "Jamica",
      image_url: "https://i.ytimg.com/vi/zF1T9-6J4Hg/maxresdefault.jpg"
      })

    get '/api/v1/comedians?name=Rufio'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).not_to include(com1.name)
    expect(response.body).not_to include(com1.city)
    expect(response.body).to include(com3.name)
    expect(response.body).to include(com3.city)
    expect(response.body).not_to include(com2.name)
    expect(response.body).not_to include(com2.city)
  end
end
