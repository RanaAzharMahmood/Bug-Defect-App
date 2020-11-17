class AddColumnIntoProjects < ActiveRecord::Migration[6.0]
  def change
  	add_column :projects,:projectname , :string
  	add_column :projects,:bug_id, :integer
  	add_column :projects,:user_id, :integer
  	add_column :projects,:manager_id, :integer
	  	
  end
end
