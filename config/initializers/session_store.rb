# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_huieeblog_session',
  :secret      => '0869ea0c8508093703ae1289ad3add64c9c8f61b16117f1e7abfd4aed9b188b8d8efff8f4a7300ba98d5d25c342ae775d3a41fee7424dcb2a018c530dd7b7fba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
