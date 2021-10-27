# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Cart.destroy_all
# Product.destroy_all

Cart.create!(total:0, isCheckout:false)
Product.create!([{name:"chocolate bar", price: 0.85, hasBasicTax: false, isImported: false}, {name:'small imported box of chocolates', price:10.00, hasBasicTax:false, isImported:true},
    {name:'book', price:12.49, hasBasicTax:false, isImported:false}, {name:'music CD', price:14.99, hasBasicTax:true, isImported:false}, {name:'imported bottle of perfume', price:47.50, hasBasicTax:true, isImported:true}, {name:'small imported bottle of perfume', price:27.99, hasBasicTax:true, isImported:true},
    {name:'bottle of perfume', price:18.99, hasBasicTax:true, isImported:false}, {name:'packet of headache pills', price:9.75, hasBasicTax:false, isImported:false}, {name:'box of imported chocolates', price:11.25, hasBasicTax:false, isImported:true}])
