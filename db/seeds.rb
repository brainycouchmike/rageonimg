# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActionLinks = ActionLink.create([{
  url: '/',
  params: '',
  anchor_text: 'Image Database'
},{
  url: '/fetch',
  params: '',
  anchor_text: 'Database Update: Fetch'
},{
  url:'/push',
  params: '',
  anchor_text: 'Database Update: Push'
}])