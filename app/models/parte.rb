class Parte < ActiveRecord::Base
  belongs_to :clausula
  belongs_to :contrato
end
