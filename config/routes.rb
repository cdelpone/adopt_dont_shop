Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/veterinary_offices', to: 'veterinary_offices#index'
  get '/veterinary_offices/new', to: 'veterinary_offices#new'
  get '/veterinary_offices/:id', to: 'veterinary_offices#show'
  post '/veterinary_offices', to: 'veterinary_offices#create'
  get '/veterinary_offices/:id/edit', to: 'veterinary_offices#edit'
  patch '/veterinary_offices/:id', to: 'veterinary_offices#update'
  delete '/veterinary_offices/:id', to: 'veterinary_offices#destroy'

  get '/veterinarians', to: 'veterinarians#index'
  get '/veterinarians/:id', to: 'veterinarians#show'
  get '/veterinarians/:id/edit', to: 'veterinarians#edit'
  patch '/veterinarians/:id', to: 'veterinarians#update'
  delete '/veterinarians/:id', to: 'veterinarians#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinary_offices#veterinarians'
  get '/veterinary_offices/:veterinary_office_id/veterinarians/new', to: 'veterinarians#new'
  post '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinarians#create'

  resources :applications
  resources :application_pets, only: [:create, :update, :destroy]
end
# Prefix Verb   URI Pattern                                                                              Controller#Action
#                        GET    /                                                                                        application#welcome
#               shelters GET    /shelters(.:format)                                                                      shelters#index
#           shelters_new GET    /shelters/new(.:format)                                                                  shelters#new
#                        GET    /shelters/:id(.:format)                                                                  shelters#show
#                        POST   /shelters(.:format)                                                                      shelters#create
#                        GET    /shelters/:id/edit(.:format)                                                             shelters#edit
#                        PATCH  /shelters/:id(.:format)                                                                  shelters#update
#                        DELETE /shelters/:id(.:format)                                                                  shelters#destroy
#                   pets GET    /pets(.:format)                                                                          pets#index
#                        GET    /pets/:id(.:format)                                                                      pets#show
#                        GET    /pets/:id/edit(.:format)                                                                 pets#edit
#                        PATCH  /pets/:id(.:format)                                                                      pets#update
#                        DELETE /pets/:id(.:format)                                                                      pets#destroy
#     veterinary_offices GET    /veterinary_offices(.:format)                                                            veterinary_offices#index
# veterinary_offices_new GET    /veterinary_offices/new(.:format)                                                        veterinary_offices#new
#                        GET    /veterinary_offices/:id(.:format)                                                        veterinary_offices#show
#                        POST   /veterinary_offices(.:format)                                                            veterinary_offices#create
#                        GET    /veterinary_offices/:id/edit(.:format)                                                   veterinary_offices#edit
#                        PATCH  /veterinary_offices/:id(.:format)                                                        veterinary_offices#update
#                        DELETE /veterinary_offices/:id(.:format)                                                        veterinary_offices#destroy
#          veterinarians GET    /veterinarians(.:format)                                                                 veterinarians#index
#                        GET    /veterinarians/:id(.:format)                                                             veterinarians#show
#                        GET    /veterinarians/:id/edit(.:format)                                                        veterinarians#edit
#                        PATCH  /veterinarians/:id(.:format)                                                             veterinarians#update
#                        DELETE /veterinarians/:id(.:format)                                                             veterinarians#destroy
#                        GET    /shelters/:shelter_id/pets(.:format)                                                     shelters#pets
#                        GET    /shelters/:shelter_id/pets/new(.:format)                                                 pets#new
#                        POST   /shelters/:shelter_id/pets(.:format)                                                     pets#create
#                        GET    /veterinary_offices/:veterinary_office_id/veterinarians(.:format)                        veterinary_offices#veterinarians
#                        GET    /veterinary_offices/:veterinary_office_id/veterinarians/new(.:format)                    veterinarians#new
#                        POST   /veterinary_offices/:veterinary_office_id/veterinarians(.:format)                        veterinarians#create
#           applications GET    /applications(.:format)                                                                  applications#index
#                        POST   /applications(.:format)                                                                  applications#create
#        new_application GET    /applications/new(.:format)                                                              applications#new
#       edit_application GET    /applications/:id/edit(.:format)                                                         applications#edit
#            application GET    /applications/:id(.:format)                                                              applications#show
#                        PATCH  /applications/:id(.:format)                                                              applications#update
#                        PUT    /applications/:id(.:format)                                                              applications#update
#                        DELETE /applications/:id(.:format)                                                              applications#destroy
#       application_pets POST   /application_pets(.:format)                                                              application_pets#create
#        application_pet PATCH  /application_pets/:id(.:format)                                                          application_pets#update
#                        PUT    /application_pets/:id(.:format)                                                          application_pets#update
#                        DELETE /application_pets/:id(.:format)                                                          application_pets#destroy
