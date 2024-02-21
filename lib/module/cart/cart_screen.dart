import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/model/home_model.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/const/integers.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';

class CartScreen extends StatelessWidget {
  static String routName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            actions: [
              cartItem(context, null),
            ],
            title: Text('Cart'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3 items In The Cart',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildCartItem( index: index,count: cubit.productsModel[index].countOneCartItem,

                          context: context, model: cubit.productsModel[index]),
                      separatorBuilder: (context, index) => SizedBox(height: Integers.paddingHeight,),
                      itemCount: cubit.carts.length,
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCartItem({
    required BuildContext context,
    required ProductsModel model,
    required int? count,
    required int index,
  }) =>
      Dismissible(
        key: Key('${model.id}'),
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          print('deleted');
        },
        child: Container(
          height: 110,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 110,
                width: 95,
                //color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(model.image, fit: BoxFit.contain),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.name}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('\$ ${model.price}',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// icon +
                  buildMinAndMaxCountItem(
                      icon: Icons.add,
                      backGroundColor: Colors.green,
                      iconColor: Colors.white,
                      onTap: (){
                        AppCubit.get(context).increaseCountOneCart(AppCubit.get(context).productsModel[index].countOneCartItem);
                      },
                  ),
                  Spacer(),
                  Text(
                    '${count}',
                    style: TextStyle(fontSize: 20),
                  ),

                  /// icon -
                  Spacer(),
                  buildMinAndMaxCountItem(
                      icon: Icons.remove,
                      iconColor: Colors.grey,
                      backGroundColor: Colors.white,
                      onTap: (){
                        AppCubit.get(context).decreaseCountOneCart(AppCubit.get(context).productsModel[index].countOneCartItem);
                      }),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMinAndMaxCountItem({
    required IconData icon,
    required Color iconColor,
    required Color backGroundColor,
    required Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
              color: backGroundColor),
          child: Icon(
            icon,
            color: iconColor,
            size: 18,
          ),
        ),
      );
}
