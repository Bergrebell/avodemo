class Avo::Resources::Team < Avo::BaseResource
  self.title = :name
  self.includes = [:admin, :team_members]
  self.search_query = -> do
    query.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end

  def fields
    field :id, as: :id
    field :name, as: :text, sortable: true
    field :logo, as: :external_image,hide_on: :show, as_avatar: :rounded do
      if record.url
        "//logo.clearbit.com/#{URI.parse(record.url).host}?size=180"
      end
    end
    field :description,
      as_description: true,
      as: :textarea,
      rows: 5,
      readonly: false,
      hide_on: :index,
      format_using: -> { value.to_s.truncate 30 },
      default: "This is a wonderful team!",
      nullable: true,
      null_values: ["0", "", "null", "nil"]

    field :members_count, as: :number do
      record.team_members.length
    end

    field :admin, as: :has_one
    field :team_members, as: :has_many, through: :memberships
    field :memberships,
      as: :has_many,
      searchable: true,
      attach_scope: -> do
        query.where.not(user_id: parent.id).or(query.where(user_id: nil))
      end
    field :reviews, as: :has_many

    sidebar do
      field :url, as: :text, translation_key: "avo.field_translations.team_url"
      field :created_at, as: :date_time, hide_on: :forms
      field :logo, as: :external_image, as_avatar: :rounded do
        if record.url
          "//logo.clearbit.com/#{URI.parse(record.url).host}?size=180"
        end
      end
    end
  end

  grid do
    cover :logo, as: :external_image, link_to_resource: true do
      if record.url.present?
        "//logo.clearbit.com/#{URI.parse(record.url).host}?size=180"
      end
    end
    title :name, as: :text, link_to_resource: true
    body :url, as: :text
  end

  filter Avo::Filters::Name

  action Avo::Actions::Dummy
end