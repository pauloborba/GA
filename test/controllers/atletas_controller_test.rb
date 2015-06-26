require 'test_helper'

class AtletasControllerTest < ActionController::TestCase
  setup do
    @atleta = atletas(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:atletas)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create atleta' do
    assert_difference('Atleta.count') do
      post :create, atleta: { alojamento_clube: @atleta.alojamento_clube, altura: @atleta.altura, categoria: @atleta.categoria, cpf: @atleta.cpf, data_nascimento: @atleta.data_nascimento, email: @atleta.email, nome: @atleta.nome, peso: @atleta.peso, posicao_joga: @atleta.posicao_joga, rg: @atleta.rg, telefone: @atleta.telefone }
    end

    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test 'should show atleta' do
    get :show, id: @atleta
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @atleta
    assert_response :success
  end

  test 'should update atleta' do
    patch :update, id: @atleta, atleta: { alojamento_clube: @atleta.alojamento_clube, altura: @atleta.altura, categoria: @atleta.categoria, cpf: @atleta.cpf, data_nascimento: @atleta.data_nascimento, email: @atleta.email, nome: @atleta.nome, peso: @atleta.peso, posicao_joga: @atleta.posicao_joga, rg: @atleta.rg, telefone: @atleta.telefone }
    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test 'should destroy atleta' do
    assert_difference('Atleta.count', -1) do
      delete :destroy, id: @atleta
    end

    assert_redirected_to atletas_path
  end
end
