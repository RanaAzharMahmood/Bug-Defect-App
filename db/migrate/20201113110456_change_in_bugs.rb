class ChangeInBugs < ActiveRecord::Migration[6.0]
  def change
  	rename_column :bugs, :qa_id,:user_id
  	change_column :bugs, :user_id,:integer

  end
end
