import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/base_app_bar.dart';
import '../../../../main.dart';
import '../manager/category_cubit.dart';
import '../widget/category_product_card.dart';

class CatProductsView extends StatelessWidget {
  final String catName;

  const CatProductsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          context: context,
          title: catName,
          leading: true,
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        body: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is GetCatProductsLoadingState ||
                          state is ErrorGetCatProductsState) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                          ),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return ZoomIn(
                              child: const Skeletonizer(
                                enabled: true,
                                child: CategoryProductCard(
                                  product: null,
                                ),
                              ),
                            );
                          },
                        );
                      }
                      if (state is SuccessGetCatProductsState) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.h,
                                  crossAxisSpacing: 10.w,
                                  mainAxisExtent: 180.h),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.catProducts.length,
                          itemBuilder: (context, index) {
                            return CategoryProductCard(
                              product: state.catProducts[index],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ).setHorizontalPadding(context, 0.064);
          },
        ));
  }
}
