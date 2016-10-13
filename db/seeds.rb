Whistle.destroy_all
w1 = Whistle.create :post => 'setting up twettir'
w2 = Whistle.create :post => 'updating the seeds'
w3 = Whistle.create :post => 'last test whistle seed'


User.destroy_all
u1 = User.create :email => 'jan@gmail.com', username: 'rock', :name => 'Jan', :password => 'chicken', :password_confirmation => 'chicken', :profile_pic => 'http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-2.jpg'

u2 = User.create :email => 'ken@gmail.com', username: 'paper', :name => 'Ken', :password => 'chicken', :password_confirmation => 'chicken', :profile_pic => 'http://img10.deviantart.net/0d3f/i/2015/300/4/0/iron_man_facebook_profile_picture_by_c6h6kid-d9eltfv.jpg'

u3 = User.create :email => 'pon@gmail.com', username: 'scissors', :name => 'Pon', :password => 'chicken', :password_confirmation => 'chicken', :profile_pic => 'http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-6.jpg'

u4 = User.create :email => 'admin@gmail.com', username: 'twettir_admin', :name => 'Admin', :password => 'chicken', :password_confirmation => 'chicken', :profile_pic => 'http://orig13.deviantart.net/64d1/f/2013/116/6/f/facebook_profile___luffy_by_sashasteins-d6330ot.jpg' ,:admin => true



Relationship.destroy_all
r1 = Relationship.create :follower_id => User.all[0].id, :followed_id => User.all[2].id
r2 = Relationship.create :follower_id => User.all[1].id, :followed_id => User.all[2].id
r3 = Relationship.create :follower_id => User.all[2].id, :followed_id => User.all[1].id

u1.whistles << w1
u2.whistles << w2
u3.whistles << w3
