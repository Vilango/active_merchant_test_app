# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_xxx_session',
  :secret      => '512ccee5a5fb6ede5ada83a04f47204547979911a0265a1ec6df71f4287749b2aa833789a3c3929aacc1386f6f9e3ce8ddb818fee91d97ba4831c8591b1da7f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
