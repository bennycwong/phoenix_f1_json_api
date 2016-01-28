# PhoenixF1JsonApi
An application that serves F1 data in JSON api compatible format
### Special Thanks:
Special thanks to [ergast.com](http://ergast.com/mrd/) for the F1 Data in Mysql format.

## Requirements
1. Mysql installed on your machine
2. Import the F1 database into your mysql database


## Instructions for Mac
1. Install mysql if you have not done so already
	
	```
	brew update && brew install mysql
	```
	
	Follow the instructions to create a user with the name root with the password root.
2. Create a database in mysql named `phoenix_f1_json_api_dev` and `phoenix_f1_json_api_test`. 	Start a shell into mysql:

	```
	mysql -u root -proot
	```
	once you are in the database, run the following:

	```
	create database phoenix_f1_json_api_dev;
	create database phoenix_f1_json_api_test;
	\q
	```
	The above commands will open up a shell into mysql and create the two databases that we need. Finally, we exit the database.


3. Import data into the two databases:

	```
	mysql -u root -proot phoenix_f1_json_api_dev < db/f1db.sql
	mysql -u root -proot phoenix_f1_json_api_test < db/f1db.sql
	```

## Getting Started


To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more about Phoenix:

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
