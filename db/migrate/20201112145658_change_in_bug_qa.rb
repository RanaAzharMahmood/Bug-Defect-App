class ChangeInBugQa < ActiveRecord::Migration[6.0]
  def change
  	add_column :projects,:qa_id,:integer
  end
end
