class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レッド' },
    { id: 2, name: 'オレンジ' },
    { id: 3, name: 'イエロー' },
    { id: 4, name: 'ベージュ' },
    { id: 5, name: 'ブラウン' },
    { id: 6, name: 'グリーン' },
    { id: 7, name: 'カーキ' },
    { id: 8, name: 'ブルー' },
    { id: 9, name: 'ネイビー' },
    { id: 10, name: 'パープル' },
    { id: 11, name: 'ホワイト' },
    { id: 12, name: 'ブラック' },
    { id: 13, name: 'シルバー' },
    { id: 14, name: 'ゴールド' }
  ]

  include ActiveHash::Associations
  has_many :items
end