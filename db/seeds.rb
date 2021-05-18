# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
Artist.destroy_all
csv_text = File.read(Rails.root.join('lib', 'seeds', 'am-artists-seed.csv'))
csv = CSV.parse(csv_text, :headers => true, header_converters: :symbol)
csv.each do |row|
    t = Artist.new
    t.first_name = row[:first_name]
    t.last_name = row[:last_name]
    t.art_type = row[:art_type]
    t.url_artists_photo = row[:url_artists_photo]
    t.save
    puts "#{t.first_name} #{t.last_name} saved"
  end
  

csv_text = File.read(Rails.root.join('lib', 'seeds', 'am-art-seed.csv'))
csv = CSV.parse(csv_text, :headers => true, header_converters: :symbol)
csv.each do |row|
    t = Art.new
    t.title = row[:title]
    t.description = row[:description]
    t.category = row[:category]
    t.img_url = row[:img_url]
    t.artist = Artist.all.sample
    t.save
    #--creating corrosponding art_item for art
    ArtItem.create(art: t, format: "digital", price: rand(100.00..10000.00) , quantity: rand(1..10))
    #--created corrosponding art_item for art
    puts "#{t.title} saved"
  end
  
  puts "There are now #{Artist.count} rows in the artists table"
  puts "There are now #{Art.count} rows in the arts table"

