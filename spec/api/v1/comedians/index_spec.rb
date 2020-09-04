require 'rails_helper'

RSpec.describe "Comeadians Index Page" do
  it "recieves a get request for all comedians" do
    com1 = Comedian.create({ name: "Nate", age: 35, city: "Denver" })

    com2 = Comedian.create(
      name: "J Dog",
      age: 30,
      city: "Arvada"
    )

    get '/api/v1/comedians'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  it "catches an empty database" do

    get '/api/v1/comedians'

    expect(response.body).to eq('Sorry, no comedians avaiable.')
    expect(response.status).to eq(404)
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end
end
