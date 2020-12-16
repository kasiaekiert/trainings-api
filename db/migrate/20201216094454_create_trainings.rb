class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :trainer

      t.timestamps
    end
  end
end
