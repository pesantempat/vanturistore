require "application_system_test_case"

class TTasksTest < ApplicationSystemTestCase
  setup do
    @t_task = t_tasks(:one)
  end

  test "visiting the index" do
    visit t_tasks_url
    assert_selector "h1", text: "T Tasks"
  end

  test "creating a T task" do
    visit t_tasks_url
    click_on "New T Task"

    fill_in "Description", with: @t_task.description
    fill_in "Frekuensi", with: @t_task.frekuensi
    fill_in "Nama task", with: @t_task.nama_task
    fill_in "Presentase", with: @t_task.presentase
    fill_in "Rupiah", with: @t_task.rupiah
    fill_in "Tingkat kesulitan", with: @t_task.tingkat_kesulitan
    fill_in "User", with: @t_task.user_id
    fill_in "Waktu", with: @t_task.waktu
    click_on "Create T task"

    assert_text "T task was successfully created"
    click_on "Back"
  end

  test "updating a T task" do
    visit t_tasks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @t_task.description
    fill_in "Frekuensi", with: @t_task.frekuensi
    fill_in "Nama task", with: @t_task.nama_task
    fill_in "Presentase", with: @t_task.presentase
    fill_in "Rupiah", with: @t_task.rupiah
    fill_in "Tingkat kesulitan", with: @t_task.tingkat_kesulitan
    fill_in "User", with: @t_task.user_id
    fill_in "Waktu", with: @t_task.waktu
    click_on "Update T task"

    assert_text "T task was successfully updated"
    click_on "Back"
  end

  test "destroying a T task" do
    visit t_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "T task was successfully destroyed"
  end
end
