class Solicitud < ApplicationRecord
    belongs_to :turno

    belongs_to :usuario

end
