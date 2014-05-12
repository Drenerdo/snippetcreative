class CreateCollaborates < ActiveRecord::Migration
  def change
    create_table :collaborates do |t|

      t.timestamps
    end
  end
end
