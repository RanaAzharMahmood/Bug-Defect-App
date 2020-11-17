class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
    	t.string:title
    	t.text:description
    	t.datetime:deadline
    	



    end
  end
end
