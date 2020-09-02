require 'rails_helper'

RSpec.describe "Comeadians Index Page" do
  it "shows information for each comedian" do
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

    visit '/comedians'

    expect(page).to have_content(com1.name)
    expect(page).to have_content(com1.age)
    expect(page).to have_content(com1.city)
    expect(page).to have_content(com2.name)
    expect(page).to have_content(com1.age)
    expect(page).to have_content(com1.city)
  end
end
