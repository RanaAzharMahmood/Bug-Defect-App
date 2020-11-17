class ChangeInBugQa2 < ActiveRecord::Migration[6.0]
  def change
  	rename_column :bugs,:type,:bug_type
  	change_column :bugs,:bug_type,:string
  end
end
