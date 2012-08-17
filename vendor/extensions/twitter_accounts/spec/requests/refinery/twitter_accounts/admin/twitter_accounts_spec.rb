# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "TwitterAccounts" do
    describe "Admin" do
      describe "twitter_accounts" do
        login_refinery_user

        describe "twitter_accounts list" do
          before do
            FactoryGirl.create(:twitter_account, :username => "UniqueTitleOne")
            FactoryGirl.create(:twitter_account, :username => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.twitter_accounts_admin_twitter_accounts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.twitter_accounts_admin_twitter_accounts_path

            click_link "Add New Twitter Account"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Username", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::TwitterAccounts::TwitterAccount.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Username can't be blank")
              Refinery::TwitterAccounts::TwitterAccount.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:twitter_account, :username => "UniqueTitle") }

            it "should fail" do
              visit refinery.twitter_accounts_admin_twitter_accounts_path

              click_link "Add New Twitter Account"

              fill_in "Username", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::TwitterAccounts::TwitterAccount.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:twitter_account, :username => "A username") }

          it "should succeed" do
            visit refinery.twitter_accounts_admin_twitter_accounts_path

            within ".actions" do
              click_link "Edit this twitter account"
            end

            fill_in "Username", :with => "A different username"
            click_button "Save"

            page.should have_content("'A different username' was successfully updated.")
            page.should have_no_content("A username")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:twitter_account, :username => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.twitter_accounts_admin_twitter_accounts_path

            click_link "Remove this twitter account forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::TwitterAccounts::TwitterAccount.count.should == 0
          end
        end

      end
    end
  end
end
