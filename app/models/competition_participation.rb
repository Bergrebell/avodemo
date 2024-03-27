class CompetitionParticipation < ApplicationRecord
  belongs_to :competition_edition, inverse_of: :competition_participations
  has_many :competition_incomes
end
