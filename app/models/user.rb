require 'open-uri'
require 'json'

class User < ActiveRecord::Base
  attr_accessible :display_name, :remote_id, :token
  has_many :orders

  def self.fetch_user_details(access_token)
    url = [
      Taskrabbit.base_uri,
      Taskrabbit.endpoint,
      "account?access_token=#{access_token}"
    ].join('/')

    JSON.parse(open(url).read)
  end
end