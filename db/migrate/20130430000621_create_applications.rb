class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :job
      t.references :user

      t.timestamps
    end
    add_index :applications, :job_id
    add_index :applications, :user_id
  end
end
