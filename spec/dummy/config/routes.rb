Rails.application.routes.draw do

  mount Lobby::Engine => "/", :as => "lobby_engine"
  mount Accountly::Engine => "/account", :as => "accountly_engine"
end
