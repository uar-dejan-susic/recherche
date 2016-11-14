# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prospects = Person.create([
    {
        first_name: 'Philip',
        last_name: 'Parkinson',
        email: 'philip_p@example.com'
    },
    {
        first_name:'Travis',
        last_name: 'Pastrana',
        email: 'travis_p@example.com'
    }
                          ])


option = Option.create([
    {
        title: 'John Doe portfolio is ready',
        template: 'Education Portfolio',
        available_slots: 3
    },
    {
        title: 'Terence Hill portfolio is ready for review',
        template: 'Education Portfolio',
        available_slots: 2
    }
                       ])
