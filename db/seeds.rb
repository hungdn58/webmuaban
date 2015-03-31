# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# ...
Product.create(title: 'Laptop Asus',
	description:
		%{<p>
			Laptop này tuy đã dùng rồi nhưng đảm bảo nguyên đai nguyên kiện,
			mới đến 95%, dùng vẫn mượt như lúc mới mua.
		</p>},
		image_url: 'Asus F550DP.jpg',
		price: 125)
Product.create(title: 'Xe Dream Thái',
	description:
		%{<p>
			Xe này đã đi được 1 vạn cây số nhưng động cơ, hộp số vẫn trơn tru,
			xe đi vẫn êm và không bị ì.
		</p>},
		image_url: 'dream1.jpg',
		price: 330)
Product.create(title: 'Giày Nike',
	description:
		%{<p>
			Giày Nike chính hãng đảm bảo mới 100%, giá cả phải chăng.
		</p>},
		image_url: 'giayNike.jpg',
		price: 50)
Product.create(title: 'Dầu ăn Neptune',
	description:
		%{<p>
			Dầu ăn Neptune với tỉ lệ vàng 1:1:1 tốt cho sức khỏe và tim mạch.
		</p>},
		image_url: 'Neptune.jpg',
		price: 12)
Product.create(title: 'Quần áo thể thao',
	description:
		%{<p>
			Bộ quần áo thể thao đầy nam tính và mạnh mẽ dành cho các bạn nam chơi thể thao.
		</p>},
		image_url: 'dongphucthethaonam.jpg',
		price: 20)
Product.create(title: 'Nước rửa bát',
	description:
		%{<p>
			Nước rửa bát Sunlight đánh bật mọi vết bẩn bám trên bề mặt bát đĩa, kể cả vết dầu mỡ và trên đồ nhựa
		</p>},
		image_url: 'Sunlight.jpg',
		price: 10)
#...