class CreateCompetitionIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :competition_incomes do |t|
      t.integer :amount
      t.references :competition_participation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
