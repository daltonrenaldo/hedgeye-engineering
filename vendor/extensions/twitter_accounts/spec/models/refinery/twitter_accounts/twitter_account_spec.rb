require 'spec_helper'

module Refinery
  module TwitterAccounts
    describe TwitterAccount do
      describe "validations" do
        subject do
          FactoryGirl.create(:twitter_account,
          :username => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:username) { should == "Refinery CMS" }
      end
    end
  end
end
