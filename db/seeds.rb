# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# note{
#     insted of create some data thats need to exit on the server whenever you start 
#     you rails application in production or development
# }

user = User.where(email:"shubham75@gmail.com").first_or_initialize
user.update!(
    password: "password",
    password_confirmation: "password"
)
# first or initialize to grab the vary first record with the matching email and that runs sucessfully noe
# we used update instant using of create because it does not give us error
# it create new account if its not present in database or it find match one in database its update the password