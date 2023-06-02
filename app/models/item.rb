class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :record

  validates :image,   presence: { message: "can't be blank" }
  validates :name,    presence: true
  validates :explain, presence: true
  validates :price,   presence: true,
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  # ActiveHashに関連するファイル
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,   :integer, presence: true
  belongs_to :condition,  :integer, presence: true
  belongs_to :delivery,   :integer, presence: true
  belongs_to :prefecture, :integer, presence: true
  belongs_to :schedule,   :integer, presence: true

  # 「---」の時は保存できないようにする
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_id,   numericality: { other_than: 1, message: "can't be blank" }
end
