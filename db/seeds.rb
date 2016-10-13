Whistle.destroy_all
w1 = Whistle.create :post => 'setting up twettir'
w2 = Whistle.create :post => 'updating the seeds'
w3 = Whistle.create :post => 'last test whistle seed'


User.destroy_all
u1 = User.create :email => 'jan@gmail.com', username: 'rock', :name => 'Jan', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :email => 'ken@gmail.com', username: 'paper', :name => 'Ken', :password => 'chicken', :password_confirmation => 'chicken'
u3 = User.create :email => 'pon@gmail.com', username: 'scissors', :name => 'Pon', :password => 'chicken', :password_confirmation => 'chicken'
u4 = User.create :email => 'admin@gmail.com', username: 'twettir_admin', :name => 'Admin', :password => 'chicken', :password_confirmation => 'chicken', :admin => true


Relationship.destroy_all
r1 = Relationship.create :follower_id => User.all[0].id, :followed_id => User.all[2].id
r2 = Relationship.create :follower_id => User.all[1].id, :followed_id => User.all[2].id
r3 = Relationship.create :follower_id => User.all[2].id, :followed_id => User.all[1].id


u1.whistles << w1
u2.whistles << w2
u3.whistles << w3
