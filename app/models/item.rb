class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,          presence: true
  validates :explain,       presence: true
  validates :price,         presence: true
  validates :user,          presence: true

  # ActiveHashに関連するファイル
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,   :integer, presence: true
  belongs_to :condition,  :integer, presence: true
  belongs_to :delivery,   :integer, presence: true
  belongs_to :prefecture, :integer, presence: true
  belongs_to :schedule,   :integer, presence: true

  #「---」の時は保存できないようにする
  validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_id,   numericality: { other_than: 1 , message: "can't be blank"}

end
