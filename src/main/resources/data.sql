DROP TABLE IF EXISTS CUSTOMER_PREFERENCE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS Product_Seller;
DROP TABLE IF EXISTS SELLER;
DROP TABLE IF EXISTS PRODUCT;

CREATE TABLE PRODUCT(
    id varchar(16) primary key,
    name varchar(128),
    category varchar(128),
    description varchar(2048),
    imageUrl varchar(256),
    averageRating int,
    reviewSummary varchar(2048),
    barcode varchar(128),
    numberOfReviews int
);


CREATE TABLE SELLER(
    id varchar(16) primary key,
    name varchar(128),
    type varchar(32),
    baseUrl varchar(128),
    latitude decimal(20,10),
    longitude decimal(20,10),
    rating int
);

CREATE TABLE Product_Seller(
    productid varchar(16) ,
    sellerid varchar(16) ,
    price double,
    deliveryCost double,
    deliveryDuration double,
    foreign key(productid) references PRODUCT(id),
    foreign key(sellerid) references SELLER(id)

);


CREATE TABLE CUSTOMER(
    id varchar(64) primary key,
    name varchar(64)
);


CREATE TABLE CUSTOMER_PREFERENCE(
    customerId varchar(64) ,
        category varchar(128),
        speed_sensitivity int,
        price_sensitivity int,
        review_sensitivity int,
        foreign key(customerId) references CUSTOMER(id)
);


insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('12345678','Fossil Black Dial Smart watch','Classic design with modern technology, this Fossil touchscreen smartwatch features a brown leather strap, and lets you track your heart rate, receive notifications, customize your dial and more. Smartwatches powered with Wear OS by Google are compatible with iPhone and Android phones. Stay in the know with messages and notifications delivered directly to your watch and stay in style with a customizable watch face that can be changed to match your look.','Smart Watches','https://images-na.ssl-images-amazon.com/images/I/81oFNtgsHvL._UL1500_.jpg',3.7,49,'User friendly, Good build quality, Heart rate monitor');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('23456789','Sony Extra Bass Wireless Headphones','MDR-XB650BT headphones combine powerful EXTRA BASS sound quality with the freedom of wireless connectivity and long-listen comfort.','Headphones','https://images-na.ssl-images-amazon.com/images/I/41jBwdEvx7L.jpg',3.9,948,'Brilliant headphone, Best in class bass and sound clarify, Battery life is insane');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('34567890','Sennheiser Headphones (Black)','The HD 206 is a pair of closed, dynamic stereo headphones for the budget-conscious music lover, featuring powerful sound reproduction, good attenuation of ambient noise and outstanding wearing comfort.','Headphones','https://images-na.ssl-images-amazon.com/images/I/61G2JTFDQnL._SL1500_.jpg',3.8,459,'Light weight, Sound quality great for vocals');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('45678901','Canon EOS 1500D Digital SLR Camera (Black) with Lens/Camera Case','All camera users, even beginners, will be able to capture amazing images and movies with this DSLR camera, which is equipped with a 24.1-megapixel APS-C-size CMOS sensor and an optical viewfinder for an authentic DSLR shooting experience. Capturing sharp images is easy thanks to the fast, accurate AF and the large grip that provides a firm, steady hold on the camera. Built-in Wi-Fi / NFC connectivity enables the seamless upload of photos and videos to social media.','DSLR Camera','https://images-na.ssl-images-amazon.com/images/I/914hFeTU2-L._SL1500_.jpg',4.5,925,'Easy to use, Decent battery backup');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('73737322','Sony PS4 Pro 1TB Console (Black)','Take play to the next level with PS4 Pro: See every detail explode into life with 4K gaming and entertainment, experience faster, smoother frame rates and more powerful gaming performance and enjoy richer, more vibrant colours with HDR technology.','Gaming Console','https://images-na.ssl-images-amazon.com/images/I/71pFB-gWFdL._SL1500_.jpg',4.4,176,'Breath taking clarity, Worth every penny');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('54263679','Philips Hue (White Ambiance), Compatible with Amazon Alexa, Apple HomeKit, and The Google Assistant','Choose between millions of colors and shades of white light to light your home with the Philips Hue Smart Light bulb, wirelessly controlled with your smartphone or tablet. It requires the hue bridge (sold separately) for the full hue experience. Install the LED smart bulb as you would install ordinary bulbs, then pair them with the hue bridge, which allows you to control smart-bulb-equipped lights via the Philips hue app. Easily expand your lighting system with accessories (sold separately), such as a hue dimmer switch. You can control your Philips Hue lights with your voice using Alexa, Apple HomeKit, or Google Assistant. Pair it for automation with your existing Nest or smartphone system. With Hue sync you can have an immersive experience by syncing your lights with music, games, and movies.','Smart Bulbs','https://images-na.ssl-images-amazon.com/images/I/51LVX01HGNL._SL1500_.jpg',3.6,151,'Price seems very high');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('99998888','boAt Stone 200 Portable Bluetooth Speakers (Black)','boAt Stone 200 Bluetooth speaker can be wirelessly connected to Bluetooth devices such as smartphones, tablets and computers to playback any music collection stored on them. Thanks to its powerful battery, the system delivers powerful sound, separated from any mains supply, for up to 8-10 hours and is the perfect companion for you in the park, whilst camping or on the beach. Process control, can get rid of complicated connections and wiring distance constraints, users can enjoy high-quality music. Plug it in plug into Nirvana. Frequency Response: 180Hz-20KHz','Speakers','https://images-na.ssl-images-amazon.com/images/I/71JElLHuosL._SL1500_.jpg',4.5,13106,'Better bass and mids, Sound quality is good');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('44445555','Bose Solo 5 Soundbar Speakers (Black)','The Bose Solo 5 TV sound system is a one-piece soundbar that brings noticeably better sound to all your favorite TV programs. Its engineered to help clearly reproduce everything from dialogue to details. And for even more clarity, its dialogue mode makes every word easier to hear. This soundbar is so versatile you can place it almost anywhere. And with Bluetooth connectivity, you can play your favorite wireless music through the speaker, too. The sleek design of your flat-screen TV is beautiful to look at. Unfortunately, there''s little room left for speakers. That''s why dialogue and quiet passages can be so hard to hear. The Solo 5 TV sound system is an easy solution, with advanced technologies that deliver the clear audio your TV can''t. And dialogue mode makes every word even easier to understand without having to adjust the volume from scene to scene.','Speakers','https://images-na.ssl-images-amazon.com/images/I/61n4tQLcWNL._SL1462_.jpg',3.9,162,'Superior sound quality');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('33334444','HP DeskJet 3835 All-in-One Ink Advantage Wireless Colour Printer','It features easy mobile printing- start printing and get connected quickly with an easy setup from your smartphone, tablet, or PC. Connect your smartphone or tablet directly to your printer and easily print without accessing a network. Manage printing tasks and scan on the go with the free HP all-in-one Printer Remote mobile app. Your pages come out great even if you''re not there. Get high-quality prints, time after time with this state-of-the-art printer. Take charge of your tasks and finish in less time with the easy-to-use 2.2-inch (5.5 cm) display. Quickly copy, scan, and fax multipage documents with the 35-page automatic document feeder. Access coloring pages, recipes, coupons, and more with free HP Printable-delivered on your schedule. No need to wait-start printing right away with easy setup. Automatically connect to your wireless network. Designed to fit your life Save your space with a compact all-in-one designed to fit on your desk, on a shelf, or anywhere you need it. Print in any room you choose-without causing disruptions. Optional quiet mode helps keep noise to a minimum.','Printers','https://images-na.ssl-images-amazon.com/images/I/61pQjxytKML._SL1500_.jpg',4,613,'Cartridge performace is poor, Print quality is good ');
insert into product(id, name, description, category,imageurl, averageRating, numberOfReviews,reviewsummary) values ('55557777','HP 15 Intel Core i5 (8GB DDR4/1TB HDD/Win 10/MS Office/Integrated Graphics/2.04 kg)','Designed for long-lasting performance, this stylishly designed HP laptop has a long-lasting battery that keeps you connected, entertained, and productive all day. Speed through tasks, or sit back and socialize - with the latest processors and a rich Full HD display. Do it all, all day.','Laptops','https://images-na.ssl-images-amazon.com/images/I/71t-J3VJtEL._SL1500_.jpg',3.6,277,'GREAT CONFIGURATION, REASONABLE PRICE');


insert into seller (id, name, type, rating) values ('1',	'Amazon',	'ONLINE', 3);
insert into seller (id, name, type, rating) values ('2',	'Flipkart',	'ONLINE', 2);
insert into seller (id, name, type,  latitude, longitude, rating) values ('3',	'Croma',	'BRICK_AND_MORTAR', 12.9299791,	77.6759496, 4);
insert into seller (id, name, type,  latitude, longitude, rating) values ('4',	'Reliance Digital',	'BRICK_AND_MORTAR', 13.0636252,	77.5891653, 3);


insert into CUSTOMER (id, name) values ('ponmani.palanisamy@gmail.com','Ponmani Palanisamy');
insert into CUSTOMER (id, name) values ('krishnan.ramaswami@gmail.com','Krishnan Ramaswami');
insert into CUSTOMER (id, name) values ('vinay.avasthi@gmail.com','Vinay Avasthi');
insert into CUSTOMER (id, name) values ('kunal.ramkumar@gmail.com','Kunal Ramkumar');
insert into CUSTOMER (id, name) values ('hemanth.kota@gmail.com','Hemanth Kota');


insert into CUSTOMER_PREFERENCE (customerId, category,  speed_sensitivity, price_sensitivity, review_sensitivity ) values ('ponmani.palanisamy@gmail.com',	'Smart Watches',	3,	1,	3);
insert into CUSTOMER_PREFERENCE (customerId, category,  speed_sensitivity, price_sensitivity, review_sensitivity ) values ('krishnan.ramaswami@gmail.com',	'Headphones',	1,	2,	3);
insert into CUSTOMER_PREFERENCE (customerId, category,  speed_sensitivity, price_sensitivity, review_sensitivity ) values ('vinay.avasthi@gmail.com',	'Headphones',	2,	2,	2);
insert into CUSTOMER_PREFERENCE (customerId, category,  speed_sensitivity, price_sensitivity, review_sensitivity ) values ('kunal.ramkumar@gmail.com',	'Gaming Consoles',	1,	3,	1);
insert into CUSTOMER_PREFERENCE (customerId, category,  speed_sensitivity, price_sensitivity, review_sensitivity ) values ('hemanth.kota@gmail.com',	'Gaming Consoles',	3,	1,	1);


insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('23456789',	'1',	5300,	50,	48);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('23456789',	'2',	5300,	100,	24);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('23456789',	'3',	5999,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('23456789',	'4',	5699,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('12345678',	'1',	12000,	50,	24);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('12345678',	'2',	14999,	100,	48);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('12345678',	'3',	16999,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('12345678',	'4',	16999,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('34567890',	'1',	2999,	50,	24);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('34567890',	'2',	2999,	100,	48);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('34567890',	'3',	1599,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('34567890',	'4',	3299,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('55557777',	'1',	43990,	500,	48);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('55557777',	'2',	41990,	250,	72);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('55557777',	'3',	45990,	0,	0);
insert into Product_Seller (productid,	sellerid,	price,	deliveryCost,	deliveryDuration) values ('55557777',	'4',	46990,	0,	0);