require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "creating a Building" do
    visit buildings_url
    click_on "New Building"

    fill_in "Ime", with: @building.ime
    fill_in "Kraj", with: @building.kraj
    fill_in "Naslov", with: @building.naslov
    fill_in "Opis", with: @building.opis
    fill_in "Tip", with: @building.tip
    fill_in "Zvezdice", with: @building.zvezdice
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Ime", with: @building.ime
    fill_in "Kraj", with: @building.kraj
    fill_in "Naslov", with: @building.naslov
    fill_in "Opis", with: @building.opis
    fill_in "Tip", with: @building.tip
    fill_in "Zvezdice", with: @building.zvezdice
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "destroying a Building" do
    visit buildings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Building was successfully destroyed"
  end
end
