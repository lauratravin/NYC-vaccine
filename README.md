# Fwitter Group Project

## Objectives

1.  Build a full scale Sinatra application that uses:

- A sqlite database
- MVC
- ActiveRecord
- Relationships
- RESTful routes
- Sessions
- Login/Logout

## Overview

The goal of this project is to build site that manage the vaccine appointments for users.


## Instructions

If you want to work with an empty database, the first user to be created is the Admin, for do this you must do this in the user_controller.rb file ( post '/signup' route):

- uncomment  # :level => "admin"
- comment     :level => "user"

This will let you to create the admin user, the next is restore the fiels as they were before.

In Github database exits the following users for testing:
lauratravin
johndow
admin
yuki

The password for them is 12345678

-----------------------------------------------------------------------------------------------------------------

The model has 3 classes:

For Users & Admin
For Appointments
For Locations

Each user can have at a maximun of 2 appointments (1 vaccine dose, 2 vaccine dose).
User cannot be greater that 65 year old, when is younger he/she can register but not generate appointments.
User cannot create an appointment where time/date/location have been taken by other user.
User cannot create two appointment for same vaccine dose.



Admin can:

Appointments: see/modify/delete
User: see/edit
Locations: create/see/modify

User can:

Appointments: see/modify/delete his own appointments
User: see/edit his own information
Locations: choose one when creating an appointment.

There is a logic that will guide Admin vs User views.






### File Structure

```
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   └── locations_controller.rb
│   │   └── appointments_controller.rb
│   ├── models
│   │   ├── appointment.rb
│   │   └── user.rb
│   │   └── location.rb
│   │   └── helper.rb
│   └── views
│       ├── index.erb
│       ├── admin.erb
│       ├── admin-app.erb
│       ├── layout.erb
│       ├── appointments
│       │   ├── appointments.erb
│       │   ├── create_appointment.erb
│       │   ├── edit_appointment.erb
│       │   ├── show_appointment.erb
│       ├── users
│       │   ├──create_user.erb
│       │   ├── edit_user.erb
│       │   ├── login.erb
│       │   └── show_user.erb
│       └── locations
│           ├── create_location.erb
│           └── edit_location.erb
│           └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   ├── schema.rb
│   └── test.sqlite
└── public
    ├── images
    │   
    ├── stylesheets
  
```

### Gemfile and environment.rb

This project is supported by Bundler and includes a `Gemfile`.

Run bundle install before getting started on the project.

As this project has quite a few files, an `environment.rb` is included that
loads all the code in your project along with Bundler. You do not ever need to
edit this file. When you see require_relative `../config/environment`, that is
how your environment and code are loaded.

### Models

The models are included in the github folder under /models

### Migrations

The github folder has database with the admin and rest of users created, the location list and some appointments



### Home Page

homepage should respond to a GET request to `/`.


