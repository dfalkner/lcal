class CreateCommonsFeastsJoinTable < ActiveRecord::Migration
  def change
      create_table :commons_feasts, :id => false do |t|
        t.integer :common_id, :null => false
        t.integer :feast_id, :null => false
      end
      add_index :commons_feasts, :common_id
      add_index :commons_feasts, :feast_id
    end

end
