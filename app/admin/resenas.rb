ActiveAdmin.register Resena do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :calificacion, :contenido, :usuario_id, :autor_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:calificacion, :contenido, :usuario_id, :autor_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
