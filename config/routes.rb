Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "session#login"
    post "/login", to: "session#create"
    get "/logout", to: "session#destroy"
    get "/static_pages/rooms", to: "static_pages#show_rooms"
    get "static_pages/about"
    get "static_pages/gallery"
    get "/user/booked", to: "bookings#index"
    delete "/booked", to: "bookings#cancel_booked"
    resources :rooms do
        resources :bookings
    end
    get "/user/profile", to: "users#show"
    post "/user/booked", to: "bookings#cancel_booked"
    get "/user/profile/edit", to: "users#edit"
    patch "/user/profile/edit", to: "users#update"
    namespace :admin do
       root to: "rooms#show"
       get "/rooms", to: "rooms#index"
       get "/rooms/new", to: "rooms#new"
       post "/rooms/new", to: "rooms#create"
       get "/rooms/edit", to: "rooms#edit"
       post "/rooms/edit", to: "rooms#update"
       get "/rooms/delete", to: "rooms#destroy"
       get "/users", to: "users#show"
       get "/users/edit", to: "users#edit"
       post "/users/update", to: "users#update"
       get "/users/permission", to: "users#change"
    end
end
end
