item_1 = Item.new(
  name: "カットソー",
  description: "ベーシックなアイテムで幅広いスタイルでお使いいただけます。",
  category_id: 2,
  color_id: 12,
  size_id: 3,
  price: 6990
  )
item_1.image.attach(io: File.open(Rails.root.join("./app/assets/images/sample1.jpg")), filename: 'sample1.jpg')
item_1.save

item_2 = Item.new(
  name: "ジーンズ",
  description: "ストレッチ抜群の履き心地にこだわったジーンズ。",
  category_id: 2,
  color_id: 8,
  size_id: 3,
  price: 12900
  )
item_2.image.attach(io: File.open(Rails.root.join("./app/assets/images/sample2.jpg")), filename: 'sample2.jpg')
item_2.save

item_3 = Item.new(
  name: "リング",
  description: "スタイリングのプラス1として最適",
  category_id: 5,
  color_id: 13,
  size_id: 5,
  price: 8900
  )
item_3.image.attach(io: File.open(Rails.root.join("./app/assets/images/sample3.jpg")), filename: 'sample3.jpg')
item_3.save