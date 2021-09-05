# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
p1r = Review.create(star_rating: 4, comment: "Works well but is scary to use.", product_id: product1.id, user_id: user1.id)
p2r = Review.create(star_rating: 5, comment: "Super easy to use.", product_id: product2.id, user_id: user1.id)


puts "Seeding done!"

puts
puts "Review#user for product1"
puts p1r.user.name
puts
puts "Review#product for product1"
puts p1r.product.name
puts
puts "Product#reviews/users for product1"
puts product1.reviews.map(&:star_rating)
puts product1.reviews.map(&:comment)
puts product1.users.map(&:name)
puts
puts "User#reviews/products for product1"
puts user1.reviews.map(&:star_rating)
puts user1.reviews.map(&:comment)
puts user1.products.map(&:name)
puts 
puts "Review#print_review"
puts p1r.print_review
puts
puts "Product#leave_review"
p1r2 = product1.leave_review(user2, 3, "Hard to push down on.")
puts p1r2.print_review
puts
pro1 = Product.find_by_name("Stapler")
puts pro1.reviews.map(&:star_rating)
puts pro1.reviews.map(&:comment)
puts pro1.users.map(&:name)
puts
puts "Print all reviews"
puts pro1.print_all_reviews
puts
puts "Average rating"
puts pro1.average_rating
puts
# puts "Fav Product"
# puts user1.favorite_product.map(&:name)
puts
puts "remove review"
puts user1.remove_reviews(product1)
# u1 = User.find_by_variable()
# puts u1.print_all_reviews


puts
