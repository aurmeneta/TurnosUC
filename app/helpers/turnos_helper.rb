# frozen_string_literal: true

module TurnosHelper
  def campuses_is_string(campus)
    campus_class = campus.class
    campus_class == String
  end

  def dia_is_string(dia)
    dia_class = dia.class
    dia_class == String
  end

  def tipos_is_string(tipo)
    tipo_class = tipo.class
    tipo_class == String
  end

  def cupos_is_integer(cupo)
    cupo_class = cupo.class
    cupo_class == Integer
  end
end
