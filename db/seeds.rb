# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Image.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('images')
Image.create([

               {name: 'cat1', file: '1.jpeg', theme_id: 2},
               {name: 'cat2', file: '2.jpeg', theme_id: 2},
               {name: 'cat3', file: '3.jpeg', theme_id: 3},
               {name: 'cat4', file: '4.jpeg', theme_id: 4},
               {name: 'cat4', file: '5.jpeg', theme_id: 4},
               {name: 'cat4', file: '6.jpeg', theme_id: 4},
               {name: 'cat4', file: '7.jpeg', theme_id: 4},
               {name: 'cat4', file: '8.jpeg', theme_id: 4},
               {name: 'cat4', file: '9.jpeg', theme_id: 4},
               {name: 'cat4', file: '10.jpeg', theme_id: 4},


             ])

Theme.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('themes')
Theme.create([

               {name: "-----"},      # 1 Нет темы
               {name: "Какое из произведений художника О.Ренуара наилучшим образом характеризует его творчество?"},      # 2
               {name: "Какое из произведений художника П.Пикассо наилучшим образом характеризует его творчество?"},      # 3
               {name: "Какое из произведений художника А.Матисса наилучшим образом характеризует его творчество?"},      # 4
             ])

User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
User.create([

              {name: "Example User", email: "example@railstutorial.org"},
            ])