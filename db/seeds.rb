
User.create( email: "test@test.com", password_digest: "123", current_city: "London", first_name: "Bob", last_name: "Smith")
puts "users created"

City.create( name: "San Francisco", image: "sf.jpg" )
City.create( name: "London", image: "london.jpg")
City.create( name: "Gibraltar", image: "gib.jpg")
puts "Cities created"
