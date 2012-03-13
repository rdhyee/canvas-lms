class AddMaterializedDiscussions < ActiveRecord::Migration
  tag :predeploy

  def self.up
    create_table :discussion_topic_materialized_views, :id => false do |t|
      t.integer :discussion_topic_id, :limit => 8
      t.text :json_structure
      t.text :participants_array
      t.text :entry_ids_array

      t.timestamps
    end
    add_index :discussion_topic_materialized_views, :discussion_topic_id, :unique => true, :name => "index_discussion_topic_materialized_views"
  end

  def self.down
    drop_table :discussion_topic_materialized_views
  end
end