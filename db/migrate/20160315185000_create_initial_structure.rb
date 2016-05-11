class CreateInitialStructure < ActiveRecord::Migration
  def change
    create_table :model1s do |t|
      t.string :name, limit: 60, null: false
      t.column :id_model2, :integer, null: false
    end

    create_table :model2s do |t|
      t.string :name, limit: 60, null: false
    end

    add_foreign_key :model1s, :model2s, column: :id_model2

    add_index(:model2s, :name)
    add_index(:model1s, [:id_model2, :name])
  end
end
