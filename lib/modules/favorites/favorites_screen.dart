import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shop_app/cubit/cubit.dart';
import '../../../shop_app/cubit/states.dart';

class FavoritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Widget widget ;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is ShopLoadingGetFavoritesState||ShopCubit.get(context).favoritesModel==null){
          widget = Center(child: CircularProgressIndicator());
        }
        else{
          widget = ListView.separated(
            itemBuilder: (context, index) {
              return buildListProduct(ShopCubit.get(context).favoritesModel!.data!.data[index].product, context);
            },
            separatorBuilder: (context, index) {
              return myDivider();
            },
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data.length,
          );
        }
        return widget;
      },
    );
  }
}