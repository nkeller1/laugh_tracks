com1 = Comedian.create({
  name: "Nate",
  age: 35,
  city: "Irving",
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

com1.tvspecials.create(name: 'All About Me', runtime: 70)
com1.tvspecials.create(name: 'Not My Special', runtime: 100)
com2.tvspecials.create(name: 'Comedian2 Special', runtime: 90)
com2.tvspecials.create(name: 'Really, Kitty?', runtime: 80)
com3.tvspecials.create(name: 'Yes, I am a Cat', runtime: 200)
