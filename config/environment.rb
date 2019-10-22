
require 'yaml'
require 'active_record'
require 'bundler'
require 'faker'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bookings.db')
require_all './app'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DB = ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: 'db/bookings.db'
})

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end

