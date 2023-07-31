class Products {
  final String title;
  final String image;
  final double price;
  final String description;
  int quantity;
  bool isLiked;
  final String brand;

  Products({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 1,
    this.isLiked = false,
    required this.brand,
  });
}

List<Products> products = [
  Products(
      title: 'Monitor LG 22"inch 4k',
      image: 'assets/tv.png',
      price: 409.59,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: 'assets/lg.png'),
  Products(
      title: 'Xbox Series S',
      image: 'assets/xbox.jpg',
      price: 15.23,
      description:
          'Experience gaming like never before with the XBOX. Dive into a world of immersive gameplay, stunning graphics, and endless entertainment. Discover a vast library of thrilling games and embark on epic adventures. With its sleek design and powerful performance, the PS4 delivers an unparalleled gaming experience. Get ready to elevate your gaming to new heights with the ultimate gaming console – the XBOX.',
      brand: 'assets/xboxlogo.jpg'),
  Products(
      title: 'Aesthetic-White Mug',
      image: 'assets/mugg.jpg',
      price: 5.76,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: ''),
  Products(
      title: 'Apple Airpods Max',
      image: 'assets/maxx.png',
      price: 420.99,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: 'assets/applelogo.png'),
  Products(
      title: 'Beats by Dre ',
      image: 'assets/beats.jpg',
      price: 256.78,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: ''),
  Products(
      title: 'Apple iPhone 11 Pro Max',
      image: 'assets/iphone.jpg',
      price: 112.19,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: 'assets/applelogo.png'),
  Products(
      title: 'Earphones',
      image: 'assets/earphones.jpg',
      price: 59.78,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: ''),
  Products(
      title: 'Beats Headset',
      image: 'assets/headset.png',
      price: 256.78,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: ''),
  Products(
      title: 'PS4 Pro',
      image: 'assets/play4.jpg',
      price: 256.78,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: 'assets/pslogo.jpg'),
  Products(
      title: 'MacBook M2',
      image: 'assets/macbook.jpg',
      price: 1649.99,
      description:
          'Introducing our 4K TV: Immerse yourself in stunning visuals with our cutting-edge 4K TV. Experience lifelike clarity and vibrant colors that bring your favorite movies, shows, and games to life. With its sleek design and advanced features, our 4K TV is the perfect addition to elevate your home entertainment. Enjoy the ultimate viewing experience with exceptional picture quality and enhanced contrast. Get ready to indulge in a cinematic journey right from the comfort of your living room. Upgrade to our 4K TV and embrace the future of television technology.',
      brand: 'assets/applelogo.png'),
];
