# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Teammates extension
Refinery::Teammates::Engine.load_seed

# Added by RefineryCMS Copywriting engine
Refinery::Copywriting::Engine.load_seed

# Added by Refinery CMS Events extension
Refinery::Events::Engine.load_seed

# Added by Refinery CMS Social Networks extension
Refinery::SocialNetworks::Engine.load_seed

# Added by Refinery CMS Perks extension
Refinery::Perks::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Twitter Accounts extension
Refinery::TwitterAccounts::Engine.load_seed
