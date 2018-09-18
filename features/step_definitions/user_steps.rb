When(/^I have list of users:$/) do |users_table|
  users_hash = users_table.hashes
  users_hash.each do |user_hash|
    User.create(user_hash)
  end
  User.count.should == users_hash.size
end