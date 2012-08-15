Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :social_networks do
    resources :social_networks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :social_networks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :social_networks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
