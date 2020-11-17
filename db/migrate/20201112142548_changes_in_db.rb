class ChangesInDb < ActiveRecord::Migration[6.0]
  def change

  	rename_column :projects ,:user_id, :user_project_id
  	change_column :projects ,:user_project_id, :integer

  	add_column :users, :user_project_id,:integer

  end
end
