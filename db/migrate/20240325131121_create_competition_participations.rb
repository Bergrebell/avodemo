class CreateCompetitionParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :competition_participations do |t|
      t.references :athlete, null: false, foreign_key: true
      t.references :competition_edition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
