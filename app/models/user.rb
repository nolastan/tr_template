class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    user              = find_or_initialize_by_remote_id(auth_hash.uid)
    user.display_name = auth_hash.extra.raw_info.display_name
    user.token        = auth_hash.credentials.token
    user.save
    user
  end

  def api_session
    @api_session ||= Taskrabbit::Api.new(token)
  end
end