class Contrato < ActiveRecord::Base
  belongs_to :atleta

  has_many :partes
  has_many :clausulas, through: :partes
end
