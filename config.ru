require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# Here is where I will mount other contoller "use"

# I need this in order to send PATCH and DELETE requests
#use Rack::MethodOveride

#all controllers go in here in between 

use UsersController
use PostsController

run ApplicationController
