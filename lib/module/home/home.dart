import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/model/home_model.dart';
import 'package:project/module/cart/cart_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:project/shared/const/const.dart';
import 'package:project/shared/const/integers.dart';
import 'package:project/shared/const/strings.dart';

class HomeScreen extends StatelessWidget {
  static String routName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.backgroundColor[0],
          appBar: AppBar(
            title: Text(
              Strings.searchResultText[listIndex],
            ),
            actions: [
              cartItem(context , CartScreen.routName ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.titleHomeScreen[listIndex],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: Integers.paddingHeight,
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1 / 1.45,
                      children: List.generate(
                          cubit.productsModel.length,
                          (index) => buildGridProduct(
                            cubit.productsModel[index],
                            onFavIcon: () {
                                  cubit.isFavoritProduct(
                                      cubit.productsModel[index].id);
                                  cubit.setFavoriteProducts(
                                      cubit.productsModel[index].id);
                                  print(cubit.isFavoritProduct(
                                      cubit.productsModel[index].id));
                                  cubit.isFavoritProduct(
                                      cubit.productsModel[index].id) ? showToast(text: 'Added to favorites', state: ToastState.SUCCESS) :showToast(text: 'deleted in favorites', state: ToastState.SUCCESS);

                                },
                            favIcon: cubit.isFavoritProduct(cubit.productsModel[index].id) ? Icons.favorite : Icons.favorite_outline,
                            onCartIcon: () {
                              cubit.setCartProducts(cubit.productsModel[index].id);
                            },
                            cartIcon: cubit.isCartProduct(cubit.productsModel[index].id) ? Icons.done : Icons.add
                              ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget buildGridProduct(
      ProductsModel model,
          {
            required void Function()? onFavIcon,
            required IconData favIcon,
            required void Function()? onCartIcon,
            required IconData cartIcon,
          }) =>
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 180,
                      child: model.image == null
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image(
                                image: AssetImage(model.image),
                                height: 180,
                                width: double.infinity,
                              ),
                          ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: onFavIcon,
                        icon: Icon(
                          favIcon,
                          size: 18,
                          color: Colors.red,
                        )),
                  ),
                  if (model.discount == 0)
                    Positioned(
                      bottom: 10,
                      child: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'DISCOUNT',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// name
                      Text(
                        model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, height: 1.3),
                      ),

                      /// price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '\$ ${model.price}',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(width: 7),
                          if (model.discount != 0)

                            /// old price
                            Text(
                              //'${model['old_price']}',
                              '${model.oldPrice}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: onCartIcon,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: const Color.fromARGB(255, 2, 57, 4),
                        child: Icon(
                          cartIcon,
                          color: Colors.white,
                          size: 15,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
}
