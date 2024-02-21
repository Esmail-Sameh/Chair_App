import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/home_model.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  List<ProductsModel> productsModel = [
    ProductsModel(
        id: 1,
        price: 2000,
        oldPrice: 2500,
        discount: 0,
        image: 'assets/images/beem_bag/baf_blue.jpg',
        name: 'Beem bag',
        description: ' Beanbag Chair Mint Plush Bean Refill 2 Pack Polystyrene Beans for Bean Bags or Crafts, 100 Liters per Bag',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 2,
        price: 7510,
        oldPrice:8000,
        discount: 10,
        image: 'assets/images/aldora/kanaba_bark_blue.jpg',
        name: 'Aldora',
        description: 'Reversible Sofa Slipcover Furniture Protector Water Resistant 2 Inch Wide Elastic Strap Sofa Cover Couch Cover Pets Kids Fit Sitting Width Up to 66" (Sofa: 75" x 110", Desert Sage/Beige)',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 3,
        price: 70,
        oldPrice:0,
        discount: 10,
        image: 'assets/images/chir_stopher/chir_stopher_gray.jpg',
        name: 'Chri stopher',
        description: 'Some Assembly Required.Enjoy this grand accent chair at your next dining party. Featuring gorgeous designs and colors, this chair is sure to delight. The sturdy build of the chair, plus the cushioning throughout is sure to have your guests conversing in comfort',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 4,
        price: 2000,
        oldPrice: 2500,
        discount: 0,
        image: 'assets/images/beem_bag/baf_blue.jpg',
        name: 'Beem bag',
        description: ' Beanbag Chair Mint Plush Bean Refill 2 Pack Polystyrene Beans for Bean Bags or Crafts, 100 Liters per Bag',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 5,
        price: 7510,
        oldPrice:8000,
        discount: 10,
        image: 'assets/images/aldora/kanaba_bark_blue.jpg',
        name: 'Aldora',
        description: 'Reversible Sofa Slipcover Furniture Protector Water Resistant 2 Inch Wide Elastic Strap Sofa Cover Couch Cover Pets Kids Fit Sitting Width Up to 66" (Sofa: 75" x 110", Desert Sage/Beige)',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 6,
        price: 70,
        oldPrice:0,
        discount: 0,
        image: 'assets/images/chir_stopher/chir_stopher_gray.jpg',
        name: 'Chri stopher',
        description: 'Some Assembly Required.Enjoy this grand accent chair at your next dining party. Featuring gorgeous designs and colors, this chair is sure to delight. The sturdy build of the chair, plus the cushioning throughout is sure to have your guests conversing in comfort',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 7,
        price: 2000,
        oldPrice: 2500,
        discount: 0,
        image: 'assets/images/beem_bag/baf_blue.jpg',
        name: 'Beem bag',
        description: ' Beanbag Chair Mint Plush Bean Refill 2 Pack Polystyrene Beans for Bean Bags or Crafts, 100 Liters per Bag',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 8,
        price: 7510,
        oldPrice:8000,
        discount: 10,
        image: 'assets/images/aldora/kanaba_bark_blue.jpg',
        name: 'Aldora',
        description: 'Reversible Sofa Slipcover Furniture Protector Water Resistant 2 Inch Wide Elastic Strap Sofa Cover Couch Cover Pets Kids Fit Sitting Width Up to 66" (Sofa: 75" x 110", Desert Sage/Beige)',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
    ProductsModel(
        id: 9,
        price: 70,
        oldPrice:0,
        discount: 0,
        image: 'assets/images/chir_stopher/chir_stopher_gray.jpg',
        name: 'Chri stopher',
        description: 'Some Assembly Required.Enjoy this grand accent chair at your next dining party. Featuring gorgeous designs and colors, this chair is sure to delight. The sturdy build of the chair, plus the cushioning throughout is sure to have your guests conversing in comfort',
        countOneCartItem: 0,
        inFavorites: false,
        inCart: false
    ),
  ];

  List<ProductsModel> favorites = [];

  List<ProductsModel> carts = [];

  bool isFavoritProduct (int productId){
    if(favorites.any((product) => product.id == productId)){
      return true;
    }
    return false;
  }

  void setFavoriteProducts(int productId){
    final existingIndex = favorites.indexWhere((product) => product.id == productId);
    if(existingIndex >= 0){
      favorites.removeAt(existingIndex);
    }else{
      favorites.add(productsModel.firstWhere((element) => element.id== productId));
    }
    emit(AppAddToFavoritSuccessStates());
  }

  bool isCartProduct (int productId){
    if(carts.any((product) => product.id == productId)){
      return true;
    }
    return false;
  }

  void setCartProducts(int productId){
    final existingIndex = carts.indexWhere((product) => product.id == productId);
    if(existingIndex >= 0){
      carts.removeAt(existingIndex);
    }else{
      carts.add(productsModel.firstWhere((element) => element.id== productId));
    }
    emit(AppAddToCartStates());
  }

  void increaseCountOneCart(int productId){
    carts.firstWhere((element) => element.id == productId);
    productsModel[productId].countOneCartItem ++;
    emit(AppIncreaseCartItemCountStates());
  }

  void decreaseCountOneCart(int productId){
    productsModel[productId].countOneCartItem --;
    emit(AppDecreaseCartItemCountStates());
  }

}