# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database. Use of mvc for the creation and use of objects that persist on the database]
- [x] Include more than one model class. I used  User, location, appointments
- [x] Include at least one has_many relationship on your User model (User has many appointments)
- [x] Include at least one belongs_to relationship on another model (Appointment belongs to a user)
- [x] Include user accounts with unique login attribute (username or email)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying(The user only can see his data during all the project, if someone wants to hack the url and add another appointment or data not beling to him, a message will be dispaly)
- [x] Ensure that users can't modify content created by other users. Same above
- [x] Include user input validations. Params cannot have empty elements for the 3 objects.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x ] You have a large number of small Git commits
- [x ] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
