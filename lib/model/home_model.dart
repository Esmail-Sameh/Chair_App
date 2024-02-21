class ProductsModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  int countOneCartItem;
  bool inFavorites;
  bool inCart;

  ProductsModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.countOneCartItem,
    required this.inFavorites,
    required this.inCart,
  });

}