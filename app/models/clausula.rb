class Clausula < ActiveRecord::Base
  has_many :partes
  has_many :contratos, through: :partes

  # Validações #
  validates :titulo, presence: true
  validates :descricao, presence: true

  validates :titulo, uniqueness: {message: 'Já existe clausula com mesmo título!'}
end
