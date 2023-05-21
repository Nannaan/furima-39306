class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,          presence: true
  validates :explain,       presence: true
  validates :price,         presence: true
  validates :user,          presence: true

  # ActiveHashに関連するファイル
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :schedule

  #「---」の時は保存できないようにする
  validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_id,   numericality: { other_than: 1 , message: "can't be blank"}

end
