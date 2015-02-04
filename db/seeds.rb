# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# ...
Product.create(title: 'Programming Ruby 1.9',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.hom nay em mo gap bac ho , bac cam trong tay chiec banh mi to
			ngoi ben em thay buon qua di thoi
		</p>},
		image_url: '1.jpg',
		price: 49.95)
Product.create(title: 'Ngọc Hùng',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
		image_url: '11.jpg',
		price: 49.95)
Product.create(title: 'Hoàng Nhật',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
		image_url: 'hoangnhat.jpg',
		price: 49.95)
Product.create(title: 'Thiện Nhân',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
		image_url: '17.jpg',
		price: 49.95)
Product.create(title: 'Chị xinh xinh G2',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
		image_url: '17.jpg',
		price: 49.95)
Product.create(title: 'Ví Dụ',
	description:
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
		image_url: '15.jpg',
		price: 49.95)
#...