class Avo::Resources::CompetitionEdition < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :competition_participations, as: :has_many
    field :competition_incomes, as: :has_many, through: :competition_participations
  end
end
