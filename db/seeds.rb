# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'

# Searched.destroy_all
# Sale.destroy_all
# Productimage.destroy_all
# Product.destroy_all
# Producttype.destroy_all
User.destroy_all
Type.destroy_all
Rate.destroy_all




puts 'creating users'

user1   =User.create!(email: 'k.elmajdouby@gmail.com', password: '123456789',username: '54425',role: 'Admin')

type1   =Type.create(label: 'Profile',    value: 'Admin', user_id: 1 )
ype2    =Type.create(label: 'Profile',    value: 'Manager', user_id: 1)
ype3    =Type.create(label: 'Profile',    value: 'User', user_id: 1)

type4   =Type.create(label: 'Catégorie',  value: 'HC Actif(ve)', user_id: 1)
type5   =Type.create(label: 'Catégorie',  value: 'TAMCA Actif(ve)', user_id: 1)
type6   =Type.create(label: 'Catégorie',  value: 'OE Actif(ve)', user_id: 1)
type7   =Type.create(label: 'Catégorie',  value: 'HC Retraité(e)', user_id: 1)
type8   =Type.create(label: 'Catégorie',  value: 'TAMCA Retraité(e)', user_id: 1)
type9   =Type.create(label: 'Catégorie',  value: 'OE Retraité(e)', user_id: 1)
type10  =Type.create(label: 'Catégorie',  value: 'EXTRA', user_id: 1)

type11  =Type.create(label: 'Lien',       value: 'Collaborateur(rice)', user_id: 1)
type12  =Type.create(label: 'Lien',       value: 'Conjoint(e)', user_id: 1)
type13  =Type.create(label: 'Lien',       value: 'Enfant', user_id: 1)
type14  =Type.create(label: 'Lien',       value: 'Accompagnateur(rice)', user_id: 1)

type15  =Type.create(label: 'Sexe',        value: 'Masculin', user_id: 1)
type16  =Type.create(label: 'Sexe',        value: 'Féminin', user_id: 1)

type17   =Type.create(label: 'Filiale',  value: 'O.C.P', user_id: 1)
type18   =Type.create(label: 'Filiale',  value: 'O.C.P Solutions', user_id: 1)
type19   =Type.create(label: 'Filiale',  value: 'O.C.P Africa', user_id: 1)
type20   =Type.create(label: 'Filiale',  value: 'Fondation O.C.P', user_id: 1)
type21   =Type.create(label: 'Filiale',  value: 'Fondation PB', user_id: 1)
type22   =Type.create(label: 'Filiale',  value: 'S.A.D.V', user_id: 1)
type23   =Type.create(label: 'Filiale',  value: 'S.A.E.D.M', user_id: 1)
type24   =Type.create(label: 'Filiale',  value: 'Policy Center For the New South', user_id: 1)

type25   =Type.create(label: 'Paiment',  value: 'Carte', user_id: 1)
type26   =Type.create(label: 'Paiment',  value: 'Chèque', user_id: 1)
type27   =Type.create(label: 'Paiment',  value: 'Espèce', user_id: 1)

rate1   =Rate.create(description: 'O.C.P Tarif = HC Actif(ve)',           value: 400   , user_id: 1)
rate2   =Rate.create(description: 'O.C.P Tarif = TAMCA Actif(ve)',        value: 250   , user_id: 1)
rate3   =Rate.create(description: 'O.C.P Tarif = OE Actif(ve)',           value: 150   , user_id: 1)
rate4   =Rate.create(description: 'O.C.P Tarif = HC Retraité(e)',         value: 400   , user_id: 1)
rate5   =Rate.create(description: 'O.C.P Tarif = TAMCA Retraité(e)',      value: 250   , user_id: 1)
rate6   =Rate.create(description: 'O.C.P Tarif = OE Retraité(e)',         value: 150   , user_id: 1)
rate7   =Rate.create(description: 'O.C.P Tarif = Suplement enfant',       value: 50    , user_id: 1)
rate8   =Rate.create(description: 'O.C.P Tarif = Tennis',                 value: 250   , user_id: 1)

rate9   =Rate.create(description: 'EXTRA O.C.P Tarif = 1',                value: 6500  , user_id: 1)
rate10  =Rate.create(description: 'EXTRA O.C.P Tarif = 2',                value: 3000  , user_id: 1)
rate11  =Rate.create(description: 'EXTRA O.C.P Tarif = Suplement enfant', value: 1000  , user_id: 1)
rate11  =Rate.create(description: 'EXTRA O.C.P Tarif = Tennis',           value: 1000  , user_id: 1)

puts "finished!"




