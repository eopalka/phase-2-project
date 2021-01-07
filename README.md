#Book Review Platform

To be able to list books youve read along with personal review of them

User:
-Name
-Email
-Password
-Has many posts

Book Post:
-Book Title
-Book Author
-Publish Date
-Picture
-Review
-belongs to a user

GET Routes
-index route - /posts (list of books posted)
-show route - /posts/:id (showing more info about post)
-new route - /posts/new (displaing form for new book post)
-edit route - /posts/:id/edit (displaying form to edit a book post)

POST Routes
-create route - /posts