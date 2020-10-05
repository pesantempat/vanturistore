require "application_system_test_case"

class TMitrasTest < ApplicationSystemTestCase
  setup do
    @t_mitra = t_mitras(:one)
  end

  test "visiting the index" do
    visit t_mitras_url
    assert_selector "h1", text: "T Mitras"
  end

  test "creating a T mitra" do
    visit t_mitras_url
    click_on "New T Mitra"

    fill_in "Alamat", with: @t_mitra.alamat
    fill_in "Nama mitra", with: @t_mitra.nama_mitra
    fill_in "Telp", with: @t_mitra.telp
    fill_in "User", with: @t_mitra.user_id
    click_on "Create T mitra"

    assert_text "T mitra was successfully created"
    click_on "Back"
  end

  test "updating a T mitra" do
    visit t_mitras_url
    click_on "Edit", match: :first

    fill_in "Alamat", with: @t_mitra.alamat
    fill_in "Nama mitra", with: @t_mitra.nama_mitra
    fill_in "Telp", with: @t_mitra.telp
    fill_in "User", with: @t_mitra.user_id
    click_on "Update T mitra"

    assert_text "T mitra was successfully updated"
    click_on "Back"
  end

  test "destroying a T mitra" do
    visit t_mitras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "T mitra was successfully destroyed"
  end
end
