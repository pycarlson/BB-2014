# encoding: utf-8

User.create!(:email => 'pyluftig@gmail.com', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'ajob@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'p@me.com', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'jlove@me.com', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'j@me.com', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'cfong@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'kpatterson-hall@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'ccesena@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'iferrey@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')
User.create!(:email => 'bvillafuerte@brighter-beginnings.org', :password => 'password', :password_confirmation => 'password')

SuperAdmin.create!(email: 'bvillafuerte@brighter-beginnings.org')
SuperAdmin.create!(email: 'pyluftig@gmail.com')
SuperAdmin.create!(email: 'ajob@brighter-beginnings.org')

Admin.create!(email: 'kpatterson-hall@brighter-beginnings.org')
Admin.create!(email: 'ccesena@brighter-beginnings.org')
Admin.create!(email: 'iferrey@brighter-beginnings.org')
Admin.create!(email: 'cfong@brighter-beginnings.org')

Drive.create!(year: 2014, blurb: "Thanks to an overwhelming response, Adopt-a-Family 2013 is now closed. Please contact us at adopt-a-family@brighter-beginnings.org for other ways to support our families this holiday season. Years ago, we realized that many of our client families were struggling during the holiday season. To address this need, we launched our Adopt-A-Family program, inviting community members and local companies to 'adopt' one or more families and purchase 'gifts from the heart'. How It Works - Through this 'adoption' process, low-income families are matched with a donor who purchases seasonal gifts and drops them off at one of our centers in Alameda or Contra Costa County. Last year, 250 families, and nearly 1,000 family members had their wish lists fulfilled. Donors contributed time and funds gathering holiday gifts, while others came to our two volunteer wrapping events to add sparkle and holiday magic to the gift bundles before our Staff delivered them to families in need.", start_date: "November 30th, 2014", end_date: "December 25th, 2014", fundraising_url: "http://giftdriver.herokuapp.com")

DropLocation.create!(:drive_id => Drive.last.id, :drop_location_name => 'Richmond', :street => ' 2727 Macdonald Ave', :city => 'Richmond', :state => 'CA', :zipcode => '94804')
DropLocation.create!(:drive_id => Drive.last.id, :drop_location_name => 'Oakland', :street => '2648 International Blvd', :city => 'Oakland', :state => 'CA', :zipcode => '94601')
DropLocation.create!(:drive_id => Drive.last.id, :drop_location_name => 'Antioch', :street => '512 W 5th St', :city => 'Antioch', :state => 'CA', :zipcode => '94509')

Organization.create!(name: "Brighter Beginnings", email: "adopt-a-family@brighter-beginnings.org", phone: "(877) 427-7134", address: "2648 International Blvd, Oakland CA", zip: "94601", website_url: "http://www.brighter-beginnings.org/", blurb: "Thanks to an overwhelming response, Adopt-a-Family 2013 is now closed. Please contact us at adopt-a-family@brighter-beginnings.org for other ways to support our families this holiday season. Years ago, we realized that many of our client families were struggling during the holiday season. To address this need, we launched our Adopt-A-Family program, inviting community members and local companies to 'adopt' one or more families and purchase 'gifts from the heart'. How It Works - Through this 'adoption' process, low-income families are matched with a donor who purchases seasonal gifts and drops them off at one of our centers in Alameda or Contra Costa County. Last year, 250 families, and nearly 1,000 family members had their wish lists fulfilled. Donors contributed time and funds gathering holiday gifts, while others came to our two volunteer wrapping events to add sparkle and holiday magic to the gift bundles before our Staff delivered them to families in need.")

# Family.create!(code: 'famBam', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.first.id)
# 1.upto(1+rand(7)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'numna', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.first.id)
# 1.upto(1+rand(6)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'blada', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.first.id)
# 1.upto(1+rand(5)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'hurra', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.last.id)
# 1.upto(1+rand(7)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'lala', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.last.id)
# 1.upto(1+rand(5)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'stata', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.last.id)
# 1.upto(1+rand(7)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'stata', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.first.id)
# 1.upto(1+rand(7)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'testy', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.last.id)
# 1.upto(1+rand(5)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'busty', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.last.id)
# 1.upto(1+rand(5)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end

# Family.create!(code: 'lusty', drive_id: Drive.last.id, :is_live => true, drop_location_id: Drive.last.drop_locations.first.id)
# 1.upto(1+rand(8)) do |i|
#   FamilyMember.create!(:family_id => Family.last.id, first_name: "name#{i}", :gender => 'f', :size_pants => '4', :size_shirt => '5', :size_dress => 'm', :size_shoes => '2', :bio => 'this is a family member', :age => (1 + rand(30)))
# end
