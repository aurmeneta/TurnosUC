class OnlyAdminsAuthorization < ActiveAdmin::AuthorizationAdapter
    def authorized?(action, subject = nil)
        puts user.admin
        user.admin?
    end
end
