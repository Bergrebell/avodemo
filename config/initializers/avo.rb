Avo.configure do |config|
  config.root_path = '/avo'
  config.license_key = ENV['AVO_LICENSE_KEY']
  config.id_links_to_resource = true
  config.home_path = -> { "/avo/dashboards/dashy" }
  config.resource_controls_placement = :right
  # config.branding = {
  #   colors: {
  #     # BLUE
  #     100 => "#CEE7F8",
  #     400 => "#399EE5",
  #     500 => "#0886DE",
  #     600 => "#066BB2",
  #     # RED
  #     100 => "#FACDD4",
  #     400 => "#F06A7D",
  #     500 => "#EB3851",
  #     600 => "#E60626",
  #     # GREEN
  #     100 => "#C5F1D4",
  #     400 => "#3CD070",
  #     500 => "#30A65A",
  #     600 => "#247D43",
  #     # PURPLE
  #     100 => "#e9d5ff",
  #     400 => "#c084fc",
  #     500 => "#a855f7",
  #     600 => "#9333ea",
  #     # ORANGE
  #     100 => "#FFECCC",
  #     400 => "#FFB435",
  #     500 => "#FFA102",
  #     600 => "#CC8102",
  #   },
  #   logo: "/avo-assets/logo.png",
  #   logomark: "/avo-assets/logomark.png"
  # }

  config.set_context do
    {
      foo: 'bar',
      user: current_user,
      params: request.params,
      account: Current.account
    }
  end
  config.current_user_method = :current_user

  config.main_menu = -> {
    section "All resources", icon: "app/assets/images/demo-adjustments.svg" do
      resource :athletes
      resource :competition_editions
      resource :competition_participations
      resource :competition_incomes
    end
  }
  config.profile_menu = -> {
    link "Dashboard", path: "/avo/dashboards/dashy", icon: "user-circle"
  }
end

if defined?(AvoFilters)
  AvoFilters.configure do |config|
    config.button_label = "Advanced filters"
    config.always_expanded = true
  end
end
