# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# encoding: utf-8

User.create(:name => 'escott')

# Org.delete_all
# #
# Org.create(:name => 'Audit Committee',
#   :summary => 'Conducts an internal audit of the parish finances once a year.',
#   :description => 'Conducts an internal audit of the parish finances once a year. All members are appointed.',
#   :chair => 'Open')
# # . . .
# Org.create(:name => 'Cemetery Committee',
#   :summary => 'Manages and maintains the grounds and appearance of the St. Francis Xavier Catholic Cemetery.',
#   :description => 'Manages and maintains the grounds and appearance of the St. Francis Xavier Catholic Cemetery.',
#   :chair => 'Jerry Mudd')
# # . . .
# Org.create(:name => 'Kroger Gift Cards / Value Market Gift Certificates',
#   :summary => 'Fund-raising project that supports the financial needs of the parish.',
#   :description => 
#   %{
#     Fund-raising project that supports the financial needs of the parish. 
#     Kroger and Valu Market shoppers can use re-chargeable Kroger gift cards or 
#     Valu Market gift certificates or cards purchased through the parish, with a 
#     4-5% rebate portion going back to the church. Parishioners can obtain gift 
#     cards or gift certificates from the Parish Office or in the back of church 
#     after all Masses the first weekend of every month.
#   },
#   :chair => 'Lisa Orr')
# # . . .
# Org.create(:name => 'Meijer Community Rewards',
#   :summary => 'Fund raising project that supports the financial needs of the parish.',
#   :description => 
#   %{
#     Fund raising project that supports the financial needs of the parish. 
#     People who shop at Meijer and are willing to use a Meijer 1 card in order 
#     to rebate a portion of their purchases to the church can obtain an application 
#     in the back of church, in the Parish Office, or by going on-line at 
#     www.meijer.com/rewards. Be sure to use the St. Francis Xavier code number - 406062.
#   },
#   :chair => 'Helen Hagen')
# # . . .
