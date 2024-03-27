# This controller has been generated to enable Rails' resource routes.
# More information on https://docs.avohq.io/3.0/controllers.html
class Avo::CompetitionIncomesController < Avo::ResourcesController
  def after_create_path
    params[:referrer] || "/avo/resources/competition_editions"
  end
end
