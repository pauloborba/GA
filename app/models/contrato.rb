class Contrato < ActiveRecord::Base
  belongs_to :atleta
  has_many :clausulas
  validate :end_date_must_be_greater_than_start_date
  validates :valor, numericality: { :greater_than_or_equal_to => 0 }

  def end_date_must_be_greater_than_start_date
  	errors.add(:data_Termino, "The end date must be greater than the start date") if self.data_Termino <= self.data_Inicio
  end
end
