Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :perks do
    resources :perks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :perks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :perks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
