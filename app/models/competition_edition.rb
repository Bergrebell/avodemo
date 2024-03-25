class CompetitionEdition < ApplicationRecord
  has_many :competition_participations
  has_many :competition_incomes, through: :competition_participations
end
