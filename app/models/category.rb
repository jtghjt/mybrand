class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'トップス'},
    { id: 3, name: 'アウター'},
    { id: 4, name: 'パンツ'},
    { id: 5, name: 'ワンピース'},
    { id: 6, name: 'シャツ・ブラウス'},
    { id: 7, name: 'コート'},
    { id: 8, name: 'シューズ'},
    { id: 9, name: 'アクセサリー'}
  ]

  include ActiveHash::Associations
  has_many :items
end