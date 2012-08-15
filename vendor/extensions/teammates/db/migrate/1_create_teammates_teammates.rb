class CreateTeammatesTeammates < ActiveRecord::Migration

  def up
    create_table :refinery_teammates do |t|
      t.string :title
      t.string :name
      t.string :email
      t.integer :picture_id
      t.text :bio
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-teammates"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/teammates/teammates"})
    end

    drop_table :refinery_teammates

  end

end
