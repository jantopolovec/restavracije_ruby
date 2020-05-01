require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "creating a Room" do
    visit rooms_url
    click_on "New Room"

    fill_in "24recepcija", with: @room.24recepcija
    fill_in "Bar", with: @room.bar
    fill_in "Bazen", with: @room.bazen
    fill_in "Building", with: @room.building_id
    fill_in "Cena", with: @room.cena
    fill_in "Dvigalo", with: @room.dvigalo
    fill_in "Fitnes", with: @room.fitnes
    fill_in "Invalidi", with: @room.invalidi
    fill_in "Kajenje", with: @room.kajenje
    fill_in "Klima", with: @room.klima
    fill_in "Postrezba", with: @room.postrezba
    fill_in "Restavracija", with: @room.restavracija
    fill_in "Stevilka", with: @room.stevilka
    fill_in "Tip", with: @room.tip
    fill_in "Wifi", with: @room.wifi
    fill_in "Zivali", with: @room.zivali
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "updating a Room" do
    visit rooms_url
    click_on "Edit", match: :first

    fill_in "24recepcija", with: @room.24recepcija
    fill_in "Bar", with: @room.bar
    fill_in "Bazen", with: @room.bazen
    fill_in "Building", with: @room.building_id
    fill_in "Cena", with: @room.cena
    fill_in "Dvigalo", with: @room.dvigalo
    fill_in "Fitnes", with: @room.fitnes
    fill_in "Invalidi", with: @room.invalidi
    fill_in "Kajenje", with: @room.kajenje
    fill_in "Klima", with: @room.klima
    fill_in "Postrezba", with: @room.postrezba
    fill_in "Restavracija", with: @room.restavracija
    fill_in "Stevilka", with: @room.stevilka
    fill_in "Tip", with: @room.tip
    fill_in "Wifi", with: @room.wifi
    fill_in "Zivali", with: @room.zivali
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Room" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
