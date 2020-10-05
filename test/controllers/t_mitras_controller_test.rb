require 'test_helper'

class TMitrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_mitra = t_mitras(:one)
  end

  test "should get index" do
    get t_mitras_url
    assert_response :success
  end

  test "should get new" do
    get new_t_mitra_url
    assert_response :success
  end

  test "should create t_mitra" do
    assert_difference('TMitra.count') do
      post t_mitras_url, params: { t_mitra: { alamat: @t_mitra.alamat, nama_mitra: @t_mitra.nama_mitra, telp: @t_mitra.telp, user_id: @t_mitra.user_id } }
    end

    assert_redirected_to t_mitra_url(TMitra.last)
  end

  test "should show t_mitra" do
    get t_mitra_url(@t_mitra)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_mitra_url(@t_mitra)
    assert_response :success
  end

  test "should update t_mitra" do
    patch t_mitra_url(@t_mitra), params: { t_mitra: { alamat: @t_mitra.alamat, nama_mitra: @t_mitra.nama_mitra, telp: @t_mitra.telp, user_id: @t_mitra.user_id } }
    assert_redirected_to t_mitra_url(@t_mitra)
  end

  test "should destroy t_mitra" do
    assert_difference('TMitra.count', -1) do
      delete t_mitra_url(@t_mitra)
    end

    assert_redirected_to t_mitras_url
  end
end
