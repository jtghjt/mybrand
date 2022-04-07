product_1 = Product.new(
  name: "カットソー",
  description: "生地選び",
  )
product_1.image.attach(io: File.open(Rails.root.join("./app/assets/images/product_sample1.jpg")), filename: 'product_sample1.jpg')
product_1.save

product_2 = Product.new(
  name: "ジーンズ",
  description: "形の選定中",
  )
product_2.image.attach(io: File.open(Rails.root.join("./app/assets/images/product_sample2.jpg")), filename: 'product_sample2.jpg')
product_2.save