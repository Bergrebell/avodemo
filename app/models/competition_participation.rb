class CompetitionParticipation < ApplicationRecord
  belongs_to :athlete
  belongs_to :competition_edition
  has_many :competition_incomes
end
