require 'test_helper'

class TTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_task = t_tasks(:one)
  end

  test "should get index" do
    get t_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_t_task_url
    assert_response :success
  end

  test "should create t_task" do
    assert_difference('TTask.count') do
      post t_tasks_url, params: { t_task: { description: @t_task.description, frekuensi: @t_task.frekuensi, nama_task: @t_task.nama_task, presentase: @t_task.presentase, rupiah: @t_task.rupiah, tingkat_kesulitan: @t_task.tingkat_kesulitan, user_id: @t_task.user_id, waktu: @t_task.waktu } }
    end

    assert_redirected_to t_task_url(TTask.last)
  end

  test "should show t_task" do
    get t_task_url(@t_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_task_url(@t_task)
    assert_response :success
  end

  test "should update t_task" do
    patch t_task_url(@t_task), params: { t_task: { description: @t_task.description, frekuensi: @t_task.frekuensi, nama_task: @t_task.nama_task, presentase: @t_task.presentase, rupiah: @t_task.rupiah, tingkat_kesulitan: @t_task.tingkat_kesulitan, user_id: @t_task.user_id, waktu: @t_task.waktu } }
    assert_redirected_to t_task_url(@t_task)
  end

  test "should destroy t_task" do
    assert_difference('TTask.count', -1) do
      delete t_task_url(@t_task)
    end

    assert_redirected_to t_tasks_url
  end
end
