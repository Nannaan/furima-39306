class RecordOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :record

  # ここにバリデーションの処理を書く
  with_options presence: true do
    
    validates :user_id
    validates :item_id

    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :building
    validates :phone_number
    validates :record

    # ActiveHashに関連するファイル(都道府県)
    # extend ActiveHash::Associations::ActiveRecordExtensions
    # belongs_to :prefecture

    # 「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  end

  def save
    # 購入履歴を保存し、変数recordに代入する
    record = Record.create(user_id: user_id, item_id: item_id)
    # 発送先情報を保存する
    # record_idには、変数recordのidと指定する
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, record_id: record.id)
  end
end
