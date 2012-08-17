class CreateTwitterAccountsTwitterAccounts < ActiveRecord::Migration

  def up
    create_table :refinery_twitter_accounts do |t|
      t.string :username
      t.integer :tweet_count
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-twitter_accounts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/twitter_accounts/twitter_accounts"})
    end

    drop_table :refinery_twitter_accounts

  end

end
