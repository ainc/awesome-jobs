# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Based on the Trello comments
hagan = User.new(username: 'hagan', password: 'password', email: 'weston@durhamlabs.com', name: 'Weston Hagan', company: 'Durham Labs')
hagan.skip_confirmation!
hagan.save!

hagan_job = Job.new(user: hagan, title: 'Engineer', description: 'Doing some engineering.' ,url: 'http://insiderlouisville.com/startups/cool-stuff/fred-durham-wants-play-food-robots-part-two-robots/')
hagan_job.save!



