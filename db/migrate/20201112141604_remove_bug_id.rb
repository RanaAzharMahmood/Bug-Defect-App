class RemoveBugId < ActiveRecord::Migration[6.0]
  def change
  remove_column :projects, :bug_id
  end
end
