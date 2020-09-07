require 'rails_helper'

RSpec.describe "Comeadians Index Page" do
  it "recieves a get request for all comedians" do
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

    get '/api/v1/comedians'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include(com1.name)
    expect(response.body).to include(com1.city)
    expect(response.body).to include(com2.name)
    expect(response.body).to include(com2.city)
  end

  it "catches an empty database" do

    get '/api/v1/comedians'

    expect(response.body).to eq('Sorry, no comedians avaiable.')
    expect(response.status).to eq(404)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "recieves sees the tvspecials a comedian has" do
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
    tvspecial3 = com2.tvspecials.create(name: 'Comedian2 Special', runtime: 90)
    tvspecial4 = com2.tvspecials.create(name: 'Really, Kitty?', runtime: 80)

    get '/api/v1/comedians'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include(tvspecial1.name)
    expect(response.body).to include(tvspecial1.runtime.to_s)
    expect(response.body).to include(tvspecial3.runtime.to_s)
    expect(response.body).to include(tvspecial3.name)
  end
  it 'displays counted tv specials' do

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
    tvspecial3 = com2.tvspecials.create(name: 'Comedian2 Special', runtime: 90)
    tvspecial4 = com2.tvspecials.create(name: 'Really, Kitty?', runtime: 80)

    get '/api/v1/comedians'

    expect(response.body).to include(com1.count_tv_specials.to_s)
  end

  it "responds with statistics on get request" do
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

      get '/api/v1/comedians'

      expect(response).to be_successful
      expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
      expect(response.body).to include("[{\"group_statistics\":[{\"average_age\":33},{\"unique_cities\":[\"Arvada\",\"Denver\"]}]}")
  end
end
