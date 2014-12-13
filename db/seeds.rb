# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Based on the Trello comments
hagan = User.new(username: 'hagan', password: 'password', email: 'weston@durhamlabs.com', name: 'Weston Hagan', company: 'Durham Labs', is_employer: true)
hagan.skip_confirmation!
hagan.save!

hagan_job = Job.new(user: hagan, title: 'Engineer', description: 'Doing some engineering.' ,url: 'http://insiderlouisville.com/startups/cool-stuff/fred-durham-wants-play-food-robots-part-two-robots/')
hagan_job.save!


completeset = User.new(username: 'garydarna', password: 'PassworD', email: 'gary@completeset.com', name: 'Gary Darna', company: 'CompleteSet', is_employer: true)
completeset.skip_confirmation!
completeset.save!

completeset_job = Job.new(user: completeset, title: 'Software Engineer, iOS at CompleteSet', description: "RESPONSIBILITIES\n
- Collaborate around the creation of new and existing features\n
- Implement beautiful user interfaces\n
\n
REQUIREMENTS\n
- Expert knowledge of Objective-C and iOS frameworks\n
- Experience developing, releasing, and supporting iOS applications\n
- Ability to get things done quickly on a small team\n
\n
BONUS\n
- Knowledge of Swift and other emerging technologies \n
- Experience using Git for source control \n
- Interest in collectibles or antiques \n
- Previous startup experience as a founder or employee\n
\n
PERKS \n
- Building a product based on your favorite brands, movies, and characters \n
- Ground floor opportunity with a fast-growing startup \n
- Smart, motivated co-workers in a fun office environment\n
\n
COMPENSATION \n
Full-time salary negotiable based on experience, benefits, and equity compensation plan. We’re building the treasure map for collectors and need a killer team to make it happen.", url: 'https://angel.co/completeset/jobs/45470-ios-engineer')
completeset_job.save!


earthineer = User.new(username: 'danadams', password: 'PasSwoRd', email: 'dan@earthineer.com', name: 'Dan Adams', company: 'Earthineer', is_employer: true)
earthineer.skip_confirmation!
earthineer.save!

earthineer_job = Job.new(user: earthineer, title: 'PHP Developer', description: "PHP developer to work with on an equity basis. Slim micro framework, eloquent ORM, handlebars, twig", url: 'http://earthineer.com/market')
earthineer_job.save!


leancor = User.new(username: 'bengreen', password: 'PasSWorD', email: 'bgreen@leancor.com', name: 'Ben Green', company: 'Leancor', is_employer: true)
leancor.skip_confirmation!
leancor.save!

leancor_job = Job.new(user: leancor, title: 'Web Developer', description: "PHP 5.0 or later, Cake PHP/MVC framework, HTML/XHTML, CSS, Ajax, JQuery and Javascript", url: 'http://www.leancor.com/careers/')
leancor_job.save!


rector = User.new(username: 'davidrector', password: 'PasSWOrD', email: 'davidarector@gmail.com', name: 'David Rector', is_employer: false)
rector.skip_confirmation!
rector.save!


lagrone = User.new(username: 'jameslagrone', password: 'pASsWord', email: 'jlagrone86@gmail.com', name: 'James LaGrone', is_employer: false)
lagrone.skip_confirmation!
lagrone.save!


jacoby = User.new(username: 'benjacoby', password: 'PASSWORD', email: 'ben.jacoby@reverlylabs.com', name: 'Ben Jacoby', is_employer: true)
jacoby.skip_confirmation!
jacoby.save!

jacoby_job = Job.new(user: jacoby, title: 'Web Software Engineer (Full-Stack)', description: 'We are currently seeking an engineer for full-stack web development.', url: 'https://worknola.com/revelry-labs-llc/web-software-engineer-full-stack')
jacoby_job.save!


pridemore = User.new(username: 'jamiepridemore', password: 'PASSword', email: 'jamiepridemore@pokemon.com', name: 'Jamie Pridemore', is_employer: true)
pridemore.skip_confirmation!
pridemore.save!

pridemore_job = Job.new(user: pridemore, title: 'PHP Developer', description: 'Must be able to write clean, well-documented code.  Must be willing to show up on time every day.  Must be an expert in CSS, HTML5, Javascript & libraries, SQL, and not be boring.', url: 'https://www.facebook.com/burritosonyourfeet/posts/10154856813705246')
pridemore_job.save!


howard = User.new(username: 'shanehoward', password: 'PAssWOrd', email: 'shanehoward@somethingawesomeyo.org', name: 'Shane Howard', is_employer: true)
howard.skip_confirmation!
howard.save!

howard_job = Job.new(user: howard, title: 'Web Developer', description: '.NET/ColdFusion')
howard_job.save!






