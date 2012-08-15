Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :teammates do
    resources :teammates, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :teammates, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :teammates, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
