Rails.application.routes.draw do

  get "/doctors/:id", to: "doctors#show"

  get "/hospitals/:id", to: "hospitals#show"

  delete "/patients/:id", to: "patients#destroy"

  get "/patients", to: "patients#index"
end
