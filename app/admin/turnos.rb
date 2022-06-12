# frozen_string_literal: true

ActiveAdmin.register Turno do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :dia, :direccion_salida, :hora_salida, :tipo, :cupos, :campus, :usuario_id, :comuna, :fecha
  #
  # or
  #
  # permit_params do
  #   permitted = [:dia, :direccion_salida, :hora_salida, :tipo, :cupos, :campus, :usuario_id, :comuna, :fecha]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
