class Contrato < ActiveRecord::Base
  belongs_to :atleta
  has_many :clausulas
  validate :end_date_must_be_greater_than_start_date
  validates :valor, numericality: { :greater_than_or_equal_to => 0 }
  validates :atleta, presence: true
  validates :data_Inicio, presence: true
  validates :data_Termino, presence: true

  def end_date_must_be_greater_than_start_date
  	errors.add(:data_Termino, "The end date must be greater than the start date") if self.data_Inicio != nil and self.data_Termino != nil and self.data_Termino <= self.data_Inicio
  end
end
