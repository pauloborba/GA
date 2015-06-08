class Contrato < ActiveRecord::Base
  belongs_to :atleta
  has_many :clausulas
end
