module Refinery
  module TwitterAccounts
    class TwitterAccountsController < ::ApplicationController

      before_filter :find_all_twitter_accounts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @twitter_account in the line below:
        present(@page)
      end

      def show
        @twitter_account = TwitterAccount.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @twitter_account in the line below:
        present(@page)
      end

    protected

      def find_all_twitter_accounts
        @twitter_accounts = TwitterAccount.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/twitter_accounts").first
      end

    end
  end
end
