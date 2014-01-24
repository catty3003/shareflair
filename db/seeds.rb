# ruby encoding: utf-8
type1 = Category.create(name: "Kleider")
type2 = Category.create(name: "Jacke")
type3 = Category.create(name: "Oberbekleidung")
type4 = Category.create(name: "Hosen")
type5 = Category.create(name: "Jacken")
type6 = Category.create(name: "Overall")
type7 = Category.create(name: "Kostüme")


user1 = User.create!(username: "Alice", email: 'alice@alice.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user2 = User.create!(username: "Bob", email: 'bob@bob.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user1.products.create(title: "Bluse",	category_id: type3.id,	target_group: "Ladies",	size: "34",	color: "weis",	price: "5",	duration: "Woche",	description: "schöne Bluse"	)
user1.products.create(title: "Hemd",	category_id: type3.id,	target_group: "Gentlemen",	size: "s",	color: "blau",	price: "1",	duration: "Tag",	description: "slim fit"	)
user2.products.create(title: "Jeans",	category_id: type4.id,	target_group: "Boys",	size: "32/34",	color: "dunkel blau",	price: "10",	duration: "Woche",	description: "mega"	)
user2.products.create(title: "Baby Kleid",	category_id: type1.id,	target_group: "Babies",	size: "92",	color: "rosa",	price: "15",	duration: "Monat",	description: "super süß"	)
user2.products.create(title: "rosa Kleid",	category_id: type1.id,	target_group: "Girls",	size: "92",	color: "rosa",	price: "15",	duration: "Monat",	description: "super süß"	)	