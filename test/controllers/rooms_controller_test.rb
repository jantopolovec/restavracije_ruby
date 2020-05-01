require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post rooms_url, params: { room: { 24recepcija: @room.24recepcija, bar: @room.bar, bazen: @room.bazen, building_id: @room.building_id, cena: @room.cena, dvigalo: @room.dvigalo, fitnes: @room.fitnes, invalidi: @room.invalidi, kajenje: @room.kajenje, klima: @room.klima, postrezba: @room.postrezba, restavracija: @room.restavracija, stevilka: @room.stevilka, tip: @room.tip, wifi: @room.wifi, zivali: @room.zivali } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: { 24recepcija: @room.24recepcija, bar: @room.bar, bazen: @room.bazen, building_id: @room.building_id, cena: @room.cena, dvigalo: @room.dvigalo, fitnes: @room.fitnes, invalidi: @room.invalidi, kajenje: @room.kajenje, klima: @room.klima, postrezba: @room.postrezba, restavracija: @room.restavracija, stevilka: @room.stevilka, tip: @room.tip, wifi: @room.wifi, zivali: @room.zivali } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
