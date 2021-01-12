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
-show route - /posts/:id (showing more info about one post)
-new route - /posts/new (displaing form for new book post)
-edit route - /posts/:id/edit (displaying form to edit a book post)

POST Routes
-create route - /posts (creating a new book)

PATCH Routes
- update route - /posts/:id (updating a previous book post)

DELETE Routes
- delete route - /posts/:id (deleting a previous book post)




Gemfile and environment.rb
This project is supported by Bundler and includes a Gemfile.

Run bundle install before getting started on the project.

As this project has quite a few files, an environment.rb is included that loads all the code in your project along with Bundler. You do not ever need to edit this file. When you see require_relative ../config/environment, that is how your environment and code are loaded.

Models
There are two models in app/models, one User model and one Post model. Both classes should inherit from ActiveRecord::Base.

Migrations
There are two migrations to create the users and posts tables.

Users should have a name, email, and password, and have many posts.

Posts should have a title, author, copyright_date, image_url, description, created_by, and belong to a user with a user_id.

Associations
Users have many posts and posts belong to a user.

Home Page
Controller loads the home page. Links to both a login page and signup page. The homepage responds to a GET request to /.

My color scheme includes:
    #563f46 a dark maroon
    #484f4f a dark green/grey
    #8ca3a3 a light eucalyptus green
    #c8c3cc a light purple/grey