# Setup Script for Cloud9

**Do the following after creating your workspace for the day, but before cloning challenges**

- Clone this repo
- cd into it
- run `ruby setup.rb`

This does the following:

- Starts Postgres
- Sets the ubuntu user's password for cloud9
- exports DATABASE_URL for cloud9 to ~/.bashrc
- exports TEST_DATABASE_URL for cloud9 to ~/.bashrc
- exports APP_NAME for cloud9 to ~/.bashrc
- sets up the alias 'bespo' for `bundle exec shotgun -p $PORT -o $IP` for cloud9 in ~/.bashrc
- sources the file ~/.bashrc so that all ENV vars are immediately available in the terminal running the script
