BASHRC = ENV['HOME'] + '/.bashrc'

def execute(message, command)
  puts message
  system(command)
  puts "EXECUTED: #{command}"
end

def append_to_bashrc(data)
  if File.readlines(BASHRC).grep(/#{data}/).size == 0
    File.open(BASHRC, 'a') { |f| f.puts data }
    puts "ADDED to .bashrc: #{data}"
  else
    puts "#{data} already exists"
  end
end

def start_postgres
  execute("Starting Postgres", "sudo service postgresql start")
end

def create_user
  execute("Creating user with password","sudo sudo -u postgres psql -c \"CREATE USER ubuntu WITH PASSWORD 'changeme' CREATEDB;\"")
end

def export_dev_db_url
  append_to_bashrc('DATABASE_URL="postgres://ubuntu:changeme@localhost/workspace_development"')
end

def export_test_db_url
  append_to_bashrc('TEST_DATABASE_URL="postgres://ubuntu:changeme@localhost/workspace_test"')
end

def export_app_name
  append_to_bashrc("APP_NAME=workspace")
end

def setup_aliases
  append_to_bashrc("alias bespo=\"bundle exec shotgun --port=#{ENV['PORT']} --host=#{ENV['IP']}\"")
  execute("Sourcing .bashrc", "source #{BASHRC}")
end

def setup
    start_postgres
    create_user
    export_dev_db_url
    export_test_db_url
    export_app_name
    setup_aliases
end

setup