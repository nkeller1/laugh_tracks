require 'rails_helper'

RSpec.describe "Comeadians Post EndPoint" do
  it "can create a new comedian" do

    post '/api/v1/comedians?name=Rufio&age=27&city=Jamica&image_url=https://image.shutterstock.com/image-photo/funny-cat-ophthalmologist-appointmet-squinting-260nw-598805597.jpg'

    expect(response).to be_successful
    expect(response.headers["Content-Type"]).to eq("application/json; charset=utf-8")
    expect(response.body).to include('Rufio')
  end

  it "Sends a 404 if Comedian is missing attributes" do

    post '/api/v1/comedians?name=Rufio&age=27&city=Jamica'
    
    expect(response.status).to eq(404)
    expect(response.body).to include('Unable to create comedian, missing attributes.')
  end
end
