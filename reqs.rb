# The IT manager also believes in testing so he has written the tests himself. You can find the tests here.

# You may alter a unit test only if you are adding more attributes to volunteers or projects.
# You may (and should) add more unit tests if you decide to add additional features or if there are any methods that arent covered by the included tests.
You may alter the names of buttons and fields in the Capybara tests. You may also add additional tests. However, your integration specs should otherwise use the current provided tests unaltered.
# If there is an error or bug in any of the tests, you may correct that error.

Volunteer Tracker
Create an application that tracks projects and the volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers).

The following user stories should be completed:

As a non-profit employee, I want to view, add, update and delete projects.
As a non-profit employee, I want to view and add volunteers.
As a non-profit employee, I want to add volunteers to a project.
Additional Requirements
Please do not specify a Ruby version in your Gemfile. It makes it more difficult to review projects.

# For this code review, please use the following names for your databases:

# Production Database: volunteer_tracker
# Development Database: volunteer_tracker_test
# Resource names will be projects and volunteers
When you are ready to submit your project, you must run the following bash command while you are in the root directory of your project:

$ pg_dump volunteer_tracker > my_database.sql

This will create a database dump called my_database.sql in your project's root directory. volunteer_tracker is the name of the database being dumped. Before you submit, confirm that the root directory of your repository contains my_database.sql. We will not review your code if this isn't properly set up.

Your README should also include any important instructions for setting up and using your project! You may want to review our lesson on READMEs.



# Your project should be set up so that a volunteer can only be created if a project already exists. (This makes it easier to assign the one to many relationship in Sinatra.) Focus on getting one integration spec passing at a time.

# The user should be able to visit the home page and fill out a form to add a new project. When that project is created, the application should direct them back to the homepage.

# # A user should be able to click on a project to see its detail. The detail page includes a form where the project can be updated. When the form is submitted, the user can be directed to either the home page or that project's detail page. (The test will work for either.)
