require 'rails_helper'

RSpec.describe "Comeadian Show Page" do
  it "recieves a get request for a single comedian" do
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

    get "/api/v1/comedians/#{com1.id}"

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include(com1.name)
    expect(response.body).to include(com1.city)
    expect(response.body).not_to include(com2.name)
    expect(response.body).not_to include(com2.city)
  end

  it "catches an invalid id" do

    get '/api/v1/comedians/2'

    expect(response.body).to eq('Sorry, this comedian does not exist.')
    expect(response.status).to eq(404)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end
end
