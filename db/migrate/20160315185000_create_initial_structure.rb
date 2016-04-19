class CreateInitialStructure < ActiveRecord::Migration
  def change
    create_table :model1 do |t|
      t.string :id, primary_key: true
      t.string :name, limit: 60, null: false
      t.string :id_model2, limit: 2, null: false
    end

    create_table :model2, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, limit: 60, null: false
    end

    add_foreign_key :model1, :model2

    add_index(:model2, :name)
    add_index(:model1, [:id_model2, :name])
  end
end
