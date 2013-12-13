class User < ActiveRecord::Base
  include Lobby::AuthUser
  include Accountly::UpdateEmailUser
end
