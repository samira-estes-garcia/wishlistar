#create seed data to test association

#Create 2 users

samira = User.create(name: "Samira", email: "samira.estes.garcia@gmail.com", password: "titansgo")
brittany = User.create(name: "Brittany", email: "brittany.estes.garcia@gmail.com", password: "Titansgo")

#Create 2 wishlists

Wishlist.create(title: "Birthday Wishlist", user_id: samira.id)
brittany.wishlists.create(title: "Christmas Wishlist")