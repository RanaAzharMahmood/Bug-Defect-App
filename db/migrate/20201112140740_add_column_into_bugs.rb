class AddColumnIntoBugs < ActiveRecord::Migration[6.0]
  def change
  add_column :bugs, :type, :string
  add_column :bugs, :status, :string
  end
end
