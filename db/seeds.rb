# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([
  { 
    name: "Luong Nhat Minh", 
    email: "minhluong96@gmail.com" ,
    password: "1234567", 
    password_confirmation: "1234567" 
  },
  { 
    name: "Le Quoc Minh", 
    email: "quocminh97@gmail.com" ,
    password: "1234567", 
    password_confirmation: "1234567" 
  },{ 
    name: "Nguyen Thi Bao Ngoc", 
    email: "ngoc120742@gmail.com" ,
    password: "1234567", 
    password_confirmation: "1234567" 
  }
])