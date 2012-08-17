Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :twitter_accounts do
    resources :twitter_accounts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :twitter_accounts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :twitter_accounts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
