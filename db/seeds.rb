# ruby encoding: utf-8
user1 = User.create!(username: "Alice", email: 'alice@alice.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user2 = User.create!(username: "Bob", email: 'bob@bob.com', :password => 'topsecret', :password_confirmation => 'topsecret')
user1.products.create(title: "Bluse",	category: "Oberteil",	target_group: "Weiblich",	size: "34",	color: "weis",	price: "5",	duration: "Woche",	description: "schöne Bluse"	)
user1.products.create(title: "Hemd",	category: "Oberteil",	target_group: "Männlich",	size: "s",	color: "blau",	price: "1",	duration: "Tag",	description: "slim fit"	)
user2.products.create(title: "Jeans",	category: "Hose",	target_group: "Männlich",	size: "32/34",	color: "dunkel blau",	price: "10",	duration: "Woche",	description: "mega"	)
user2.products.create(title: "Baby Kleid",	category: "Kleid",	target_group: "Baby",	size: "92",	color: "rosa",	price: "15",	duration: "Monat",	description: "super süß"	)	