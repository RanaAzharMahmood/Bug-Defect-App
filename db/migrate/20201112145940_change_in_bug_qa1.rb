class ChangeInBugQa1 < ActiveRecord::Migration[6.0]
  def change
	add_column :bugs,:qa_id,:integer
  	remove_column :projects,:qa_id,:integer

  end
end
