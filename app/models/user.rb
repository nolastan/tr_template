require 'open-uri'
require 'json'

class User < ActiveRecord::Base
  has_many :orders

  def self.find_or_create_from_auth_hash(auth_hash)
    user              = find_or_initialize_by_remote_id(auth_hash.uid)
    user.display_name = auth_hash.extra.raw_info.display_name
    user.save
    user
  end
end