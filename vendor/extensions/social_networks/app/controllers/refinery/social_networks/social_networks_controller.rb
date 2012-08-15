module Refinery
  module SocialNetworks
    class SocialNetworksController < ::ApplicationController

      before_filter :find_all_social_networks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @social_network in the line below:
        present(@page)
      end

      def show
        @social_network = SocialNetwork.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @social_network in the line below:
        present(@page)
      end

    protected

      def find_all_social_networks
        @social_networks = SocialNetwork.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/social_networks").first
      end

    end
  end
end
