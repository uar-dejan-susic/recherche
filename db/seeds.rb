# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prospects = Person.create(
    (0..30).map { |i| {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email} }
)
puts "Genrated #{prospects.count} people."

Option.create(
          (1..2).map do |i|
            {
                title: "#{Faker::Name.name} portfolio is ready",
                template: 'education_portfolio',
                available_slots: 2,
                people: prospects
            }
          end
)
puts "Created option with all #{prospects.count} assigned."

option = Option.create([
    {
        title:  "#{Faker::Name.name} portfolio is ready",
        template: 'education_portfolio',
        available_slots: 1,
        people: prospects,
        expire_date: 14.days.from_now
    },
    {
        title:  "#{Faker::Name.name} portfolio is ready",
        template: 'education_portfolio',
        available_slots: 2,
        people: prospects[1..10],
        expire_date: 14.days.from_now
    },
    {
        title:  "#{Faker::Name.name} portfolio is ready",
        template: 'education_portfolio',
        available_slots: 3,
        people: prospects[10..15],
        expire_date: 14.days.from_now
    },
    {
        title:  "#{Faker::Name.name} portfolio is ready",
        template: 'education_portfolio',
        available_slots: 2,
        people: prospects[1..10]
    }
                       ])

full_option = option.last
p1 = full_option.prospects[0]
p1.i_might!
p1.i_want!

p2 = full_option.prospects[1]
p2.i_might!
p2.i_want!

p3 = full_option.prospects[2]
p3.i_tried!

px = full_option.prospects[4..6]
px.each { |prospect| prospect.i_might! }

full_option.update({expire_date: 14.days.ago})