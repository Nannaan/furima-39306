class RecordOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    # 購入履歴を保存し、変数recordに代入する
    record = Record.create(user_id: user_id, item_id: item_id)
    # 発送先情報を保存する
    # record_idには、変数recordのidと指定する
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                 phone_number: phone_number, record_id: record.id)
  end
end
