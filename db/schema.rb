# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081021220938) do

# Could not dump table "open_id_authentication_associations" because of following StandardError
#   Unknown type 'bytea' for column 'server_url' /Users/ajturner/Projects/customers/pcode/bort/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:44:in `table'/Users/ajturner/Projects/customers/pcode/bort/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `each'/Users/ajturner/Projects/customers/pcode/bort/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `table'/Library/Ruby/Gems/1.8/gems/activerecord-2.1.1/lib/active_record/schema_dumper.rb:70:in `tables'/Library/Ruby/Gems/1.8/gems/activerecord-2.1.1/lib/active_record/schema_dumper.rb:61:in `each'/Library/Ruby/Gems/1.8/gems/activerecord-2.1.1/lib/active_record/schema_dumper.rb:61:in `tables'/Library/Ruby/Gems/1.8/gems/activerecord-2.1.1/lib/active_record/schema_dumper.rb:23:in `dump'/Library/Ruby/Gems/1.8/gems/activerecord-2.1.1/lib/active_record/schema_dumper.rb:17:in `dump'/Library/Ruby/Gems/1.8/gems/rails-2.1.1/lib/tasks/databases.rake:219/Library/Ruby/Gems/1.8/gems/rails-2.1.1/lib/tasks/databases.rake:218:in `open'/Library/Ruby/Gems/1.8/gems/rails-2.1.1/lib/tasks/databases.rake:218/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/Library/Ruby/Gems/1.8/gems/rails-2.1.1/lib/tasks/databases.rake:100/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:2019:in `invoke_task'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `each'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1991:in `top_level'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1970:in `run'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/lib/rake.rb:1967:in `run'/Library/Ruby/Gems/1.8/gems/rake-0.8.3/bin/rake:31/usr/bin/rake:19:in `load'/usr/bin/rake:19

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.column "timestamp", :integer, :null => false
    t.column "server_url", :string
    t.column "salt", :string, :null => false
  end

  create_table "passwords", :force => true do |t|
    t.column "user_id", :integer
    t.column "reset_code", :string
    t.column "expiration_date", :timestamp
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

  create_table "places", :force => true do |t|
    t.column "name", :string
    t.column "pcode", :integer
    t.column "country", :string
    t.column "region", :string
    t.column "city", :string
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
    t.column "geometry", :geometry, :srid => 4326
  end

  create_table "roles", :force => true do |t|
    t.column "name", :string
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.column "role_id", :integer
    t.column "user_id", :integer
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string, :null => false
    t.column "data", :text
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "login", :string, :limit => 40
    t.column "identity_url", :string
    t.column "name", :string, :limit => 100, :default => ""
    t.column "email", :string, :limit => 100
    t.column "crypted_password", :string, :limit => 40
    t.column "salt", :string, :limit => 40
    t.column "remember_token", :string, :limit => 40
    t.column "activation_code", :string, :limit => 40
    t.column "state", :string, :default => "passive", :null => false
    t.column "remember_token_expires_at", :timestamp
    t.column "activated_at", :timestamp
    t.column "deleted_at", :timestamp
    t.column "created_at", :timestamp
    t.column "updated_at", :timestamp
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
