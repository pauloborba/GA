class Clausula < ActiveRecord::Base
  has_many :partes
  has_many :contratos, through: :partes
end
