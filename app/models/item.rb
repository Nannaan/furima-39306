class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # ActiveHashに関連するファイル
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :schedule

  validates :name,          presence: true
  validates :explain,       presence: true
  validates :category_id,   presence: true
  validates :condition_id,  presence: true
  validates :delivery_id,   presence: true
  validates :prefecture_id, presence: true
  validates :schedule_id,   presence: true
  validates :price,         presence: true
  validates :user,          presence: true
end
