require 'rails_helper'

RSpec.describe "Comeadians Index Page" do
  it "recieves a get request for all comedians", :vcr do
    com1 = Comedian.create(
      name: "Dizzle",
      age: 35,
      city: "Denver"
    )

    com2 = Comedian.create(
      name: "J Dog",
      age: 30,
      city: "Arvada"
    )

    get '/api/v1/comedians'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  end

  # it "catches an invalid location", :vcr do
  #
  #   get '/api/v1/forecast?location=rufio'
  #
  #   expect(response.body).to eq('Sorry, we can not locate a forecast for your search')
  #   expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
  # end
end
