#Here is where I will write the seed data for my program

elisa = User.create(email: "seesawsesa@yahoo.com", name: "Elisa", password: "hello")

Post.create(title: "“Harry Potter and the Deathly Hallows” (2007)", image_url: "https://upload.wikimedia.org/wikipedia/en/a/a9/Harry_Potter_and_the_Deathly_Hallows.jpg", description: "This is my favorite Harry Potter book. It was about time they got their shit together and started getting serious about fighting Voldemort. I mean seriously how many of you does he need to attack before you do something about it.", user_id: elisa.id)