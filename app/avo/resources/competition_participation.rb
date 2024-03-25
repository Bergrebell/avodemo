class Avo::Resources::CompetitionParticipation < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :athlete, as: :belongs_to
    field :competition_edition, as: :belongs_to
    field :competition_incomes, as: :has_many
  end
end
