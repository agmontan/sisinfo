json.extract! voucher, :id, :user_id, :salary, :description, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
