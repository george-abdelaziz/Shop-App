import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shop_app/cubit/cubit.dart';
import '../../../shop_app/cubit/states.dart';
import '../../../shop_model/categories_model.dart';

class CategoriesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildCatItem(ShopCubit.get(context).categoriesModel!.data.data[index]);
          },
          separatorBuilder: (context, index) {
            return myDivider();
          },
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: NetworkImage(model.image),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
  }
}