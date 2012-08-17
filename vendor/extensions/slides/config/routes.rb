Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :slides do
    resources :slides, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :slides, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :slides, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
