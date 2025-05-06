import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routing/page_routes_name.dart';
import '../manager/category_cubit.dart';

class CategoryCard extends StatelessWidget {
  final String catName;
  final int index;

  const CategoryCard({super.key, required this.catName, required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = context.read<CategoryCubit>();

    return Bounceable(
      onTap: () {
        Future.delayed(
          const Duration(milliseconds: 350),
          () {
            cubit.getCatProducts(catName: catName);
            Navigator.of(context).pushNamed(PageRoutesName.catProducts,
                arguments: {"catName": catName});
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton.shade(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                      color: Colors.yellowAccent,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 6.w),
                      child: Image.asset(index % 2 == 0
                          ? "assets/images/cat1.png"
                          : "assets/images/cat2.png"),
                    ),
                  ),
                  Container(
                    height: 80.h,
                    width: 80.h,
                    // padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2.w),
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            FittedBox(
              child: Text(
                catName,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
