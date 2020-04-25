require "faker"
50.times do
  User.create(
    fname: Faker::Name.first_name,
    lname: Faker::Name.last_name,
    addr_1: Faker::Address.street_address,
    addr_2: nil,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip_code,
    email: Faker::Internet.safe_email,
    phone_1: Faker::PhoneNumber.cell_phone,
    phone_2: Faker::PhoneNumber.cell_phone,
    is_missing: 1,
    account_verified: 1,
    account_suspended: 0,
    suspension_reason: "Actount Active",
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
  )
end
2.times do
  Pet.create(
    breed: "dalmation",
    weight: 35,
    temperament: "Mellow. A little nippy around men.",
    chipped: 1,
    chip_id: "837239902817",
    collared: 1,
    color: "white with black spots",
    went_missing: "2020-04-10 13:25:20",
    date_found: "2020-04-15 15:00:00",
    user_id: 20,
  )
  Pet.create(
    breed: "Irish Setter",
    weight: 40,
    temperament: "Very Friendly. Will get in anyones car.",
    chipped: 1,
    chip_id: "9338477739",
    collared: 1,
    color: "rust",
    went_missing: "2019-9-23 18:00.00",
    date_found: "2019-9-25 20:00:00",
    user_id: 15,
  )
end
