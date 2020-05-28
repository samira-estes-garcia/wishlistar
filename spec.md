# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app
  - used sinatra
- [x] Use ActiveRecord for storing information in a database
  - used ActiveRecord to store my info
- [x] Include more than one model class (e.g. User, Post, Category)
  - user.rb and wishlist.rb (eventually item.rb)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - my user has_many wishlists
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - wishlists belong_to my users
- [x] Include user accounts with unique login attribute (username or email)
  - user accounts need to log in with their emails
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - I have routes to create(add), read, update(edit), and destory my wishlists
- [x] Ensure that users can't modify content created by other users
  - users will always be booted back to their own page when trying to access other user's content
- [x] Include user input validations
  - I have included front end and back end validations for my users when they sign up and log in
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  - I used sinatra-flash to display validation failures
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  - my README.md includes a description of my app, install instructions, and a guide and link to a license for my code.

Confirm

- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
