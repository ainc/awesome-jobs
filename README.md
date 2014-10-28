Awesome Jobs
======

Welcome to the source code for the Awesome Jobs bulletin!

Getting Started
-----------

This project was written with Ruby on Rails, so if you're unfamiliar with terminology such as "MVC Architecture" or "Agile Web Development", then you may want to read about the basics of Rails (or any other kind of web development that resembles Rails), because there are so many directories in such kinds of projects like this one that it's quite easy to get lost at first.

You'll notice that most of the code here reads either like English or basic SQL statements (thanks to Ruby), so the comments here aren't too intensive.  This is to prevent littering the files with gobbledygook to make it read easier, but if there are any statements that aren't quite clear, alert me and I'll update the code accordingly.

Let's dive into the juicy part, shall we?

A Few Specifics
------------

When people create their accounts, they need to confirm their email addresses. Also, when an email address is to be changed, it also needs to be confirmed.

Because of this along with the reCAPTCHA that I decided to implement, you need to set certain environment variables in a file called *config/application.yml* (you will need to create this file) in order to get anything involving users up and running without interacting with the console. Those variables are as follows:

* **RECAPTCHA_PUBLIC_KEY**
* **RECAPTCHA_PRIVATE_KEY**
* **GMAIL_USERNAME**
* **GMAIL_PASSWORD**

Also, this application uses the Postgres database adapter, so in order to run this locally, you have to have Postgres installed on your machine.  Don't forget to create the databases defined in *config/database.yml*, otherwise none of this is going to work.

The easiest way to run this application is as follows:

* Start Postgres (should be via a native application).
* Change to the *jobs* directory.
* Run *bundle* in the command line if you haven't already.
* Apply the database schema to the Postgres database by running *rake db:migrate* in the command line.
* Start the Rails server by running *rails s* in the command line.
* Navigate to *localhost:3000* in a web browser.

One more thing: every single piece of English text in this application that is presented to the user can be found in one of the files in the *config/locales* directory.

Models (*app/models*)
------------
This project contains the following model objects as well as their (important) properties:

* **Job**: A job opening (creatable only by employers).
    * **Description**: A short description of the job opening.  Must be present and is limited to 1000 characters.
    * **Title**: The title of the opening.  Must be present and is limited to 50 characters.
    * **URL**: The URL of the work.  Is limited to 100 characters.
    * **User**: The user who created the opening.
* **User**: A site user.
    * **Address**: The address that the user decides to make public. Limited to 40 characters.
    * **Avatar**: The avatar of the user.
    * **Company**: The company that the user represents.  Limited to 40 characters.
    * **Description**: A short description of the user.  Limited to 500 characters.
    * **Email**: The email address of the user.
    * **Is Employer**: Whether or not the user is an employer.  If the user is not an employer, then the user is a programmer.
    * **Name**: The name of the user.  Must have length between or equal to one of 5 and 40 characters.
    * **Phone**: The contact phone number for the user.  Limited to 20 characters.
    * **Resume**: The resume of the user.  Can only be uploaded by programmers.
    * **Username**: The username chosen by the user.  Must have length between or equal to one of 3 and 15 characters.
    * **Website**: The user's website.  Limited to 100 characters.
* **Watching**: A relationship between a user and a job that signifies that a certain user is watching a certain job.
    * **Job**: The job in question.
    * **User**: The user in question.
* **Work**: A finished piece of work (creatable only by programmers).
    * **Description**: A short description of the work.  Must be present and is limited to 400 characters.
    * **Title**: The title of the work.  Must be present and is limited to 50 characters.
    * **URL**: The URL of the work.  Must be present and is limited to 100 characters.
    * **User**: The user who created the work.

In addition to these properties, all model objects contain **Created At** and **Updated At** properties, as well as any other ones provided by external gems.

All the validation specifications can be found in each model's respective file in the model directory.

Views (*app/views*)
------------
Every view template in this directory is of one of three extensions: ".html.haml", ".js.erb", and ".html.erb".

Every HAML file (".html.haml") is a standard HTML template written with the HAML preprocessor.

Every Ruby-Embedded Javascript file (".js.erb") is a Javascript file for an AJAX request.

Every Ruby-Embedded HTML file (".html.erb") is also a standard HTML template, but just one of the templates that didn't need much modification.

Each file is located in the corresponding controller's subdirectory.

Controllers (*app/controllers*)
------------
Here's a quick rundown of the various controllers for this project:

* **Browse**: Handles all views involving browsing.
* **Confirmations**: Overrides the default Devise implementation of confirmations.
* **Contact**: Handles one user communicating to another via a contact page.
* **Errors**: Provides custom 404, 422, and 500 error pages.
* **Jobs**: Handles everything involving jobs management.
* **Registrations**: Overrides the default Devise implementation of user registration.
* **Sessions**: Overrides the default Devise implementation of session management.
* **User Info**: Handles the display of user information.
* **Watchings**: Handles everything involving watchings management.
* **Works**: Handles everything involving works management.

Extra Possibly-Helpful Info
------------

* All of this application's routes can be found in *config/routes.rb*.
* Supporting stylesheets, javascripts, and images are found in *app/assets*.

~ Alek