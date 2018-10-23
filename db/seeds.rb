# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

boss = FactoryBot.create(:user,
  first_name: 'Joe',
  last_name: 'Boss',
  email: 'boss@cloverpop.com',
  password: 'Password!',
  role: 'member',
)
boss.sessions.create(key: 'ba21c26ff0522ff1c5b437d35802651bc69e8930')

janitor =  FactoryBot.create(:user,
  first_name: 'Jim',
  last_name: 'Janitor',
  email: 'notboss@cloverpop.com',
  password: 'Password!',
  role: 'nobody'
)
janitor.sessions.create(key: '2c5c105ebd171b37daf8248ff2a1666b03560ac9')

# Create random comments, posts, and users
3.times do
  FactoryBot.create(:comment)
end