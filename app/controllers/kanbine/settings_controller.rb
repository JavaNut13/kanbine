class Kanbine::SettingsController < ApplicationController
  before_filter :find_project, :authorize

  def settings
    @project.kanban_status_ids = params[:kanban_status_ids]
    @project.kanban_tracker_ids = params[:kanban_tracker_ids]

    settings = params[:kanbine_settings]
    if settings
      @project.kanbine_settings.update_attribute(:color_tag_group_id, settings[:color_tag_group_id])
    end
    flash[:notice] = 'Settings updated'
    redirect_to "/projects/#{@project.identifier}/settings/kanbine"
  end
end
