json.extract! reservation, :id, :od, :do, :user_id, :room_id, :osebe, :cena, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
