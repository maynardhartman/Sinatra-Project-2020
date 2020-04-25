50.times do
  User.create(
    user_fname: Faker::Name.first_name,
    user_lname: Faker::Name.last_name,
    addr_1: Faker::Address.street_address,
    addr_2: nil,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    user_zipcode: Faker::Address.zip_code,
    user_email: Faker::Internet.safe_email,
    user_phone_1: Faker::PhoneNumber.cell_phone,
    user_phone_2: Faker::PhoneNumber.cell_phone,
    is_missing: 1,
    account_verified: 1,
    account_suspended: 0,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
  )
end
2.times do
  Pet.create(
    breed: "dalmation",
    weight: 35,
    pet_temperament: "Mellow. A little nippy around men.",
    pet_chipped: 1,
    pet_chip_id: "837239902817",
    pet_collared: 1,
    pet_color: "white with black spots",
    pet_went_missing: "2020-04-10 13:25:20",
    date_found: "2020-04-15 15:00:00",
    user_id: 20,
  )
  Pet.create(
    breed: "Irish Setter",
    weight: 40,
    pet_temperament: "Very Friendly. Will get in anyones car.",
    pet_chipped: 1,
    pet_chip_id: "9338477739",
    pet_collared: 1,
    pet_color: "rust",
    pet_went_missing: "2019-9-23 18:00.00",
    date_found: "2019-9-25 20:00:00",
    user_id: 20,
  )
end
