class Avo::Resources::CompetitionIncome < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :amount, as: :number
    field :competition_participation, as: :belongs_to
  end
end
