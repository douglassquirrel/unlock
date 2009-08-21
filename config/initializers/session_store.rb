# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_unlock_session',
  :secret      => 'ddfa5286ace9cd5418999bdc2e4719e3c4adf0728d3ee10d4a5d8a802c5c180f91fdde350608d0c82c368ca63a8773d9f2c169e75fc28d2e61a0933b7ac56f1c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
