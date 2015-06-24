require 'test_helper'

class ContratoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a contract with an end date prior to the status date should not be valid" do
  	contract = Contrato.new
  	contract.data_Inicio = DateTime.new(2015, 06, 24)
  	contract.data_Termino = DateTime.new(2014, 05, 25)

  	assert not(contract.valid?) and contract.errors[:data_Termino].length > 0
  end

  test "a contract with a negative value not be valid" do
  	contract = Contrato.new
  	contract.valor = -10

  	assert not(contract.valid?) and contract.errors[:valor].length > 0
  end

  test "a contract with a non existing athlete not be valid" do
  	contract = Contrato.new
  	contract.atleta = nil

  	assert not(contract.valid?) and contract.errors[:atleta].length > 0
  end
end
