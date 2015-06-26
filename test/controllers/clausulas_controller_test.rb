require 'test_helper'

class ClausulasControllerTest < ActionController::TestCase
  setup do
    @clausula = clausulas(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:clausulas)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create clausula' do
    assert_difference('Clausula.count') do
      post :create, clausula: { descricao: @clausula.descricao, titulo: @clausula.titulo }
    end

    assert_redirected_to clausula_path(assigns(:clausula))
  end

  test 'should show clausula' do
    get :show, id: @clausula
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @clausula
    assert_response :success
  end

  test 'should update clausula' do
    patch :update, id: @clausula, clausula: { descricao: @clausula.descricao, titulo: @clausula.titulo }
    assert_redirected_to clausula_path(assigns(:clausula))
  end

  test 'should destroy clausula' do
    assert_difference('Clausula.count', -1) do
      delete :destroy, id: @clausula
    end

    assert_redirected_to clausulas_path
  end
end
