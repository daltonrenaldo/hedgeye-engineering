module Refinery
  module Perks
    class PerksController < ::ApplicationController

      before_filter :find_all_perks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @perk in the line below:
        present(@page)
      end

      def show
        @perk = Perk.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @perk in the line below:
        present(@page)
      end

    protected

      def find_all_perks
        @perks = Perk.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/perks").first
      end

    end
  end
end
