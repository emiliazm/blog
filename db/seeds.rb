# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, 
        title: 'Hello1-1', 
        text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book. ')

second_post = Post.create(author: first_user, 
title: 'Hello1-2', 
text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
when an unknown printer took a galley of type and scrambled it to make a type specimen book. ')

first_comment = Comment.create(post: first_post, author: second_user, text: 'Hi Tom! - Lilly' )

first_post = Post.create(author: second_user, 
        title: 'Hello2-1', 
        text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book. ')

second_post = Post.create(author: second_user, 
title: 'Hello2-2', 
text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,
when an unknown printer took a galley of type and scrambled it to make a type specimen book. ')

first_comment = Comment.create(post: first_post, author: first_user, text: 'Hi Lilly! - Tom' )
