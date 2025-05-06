import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../.././../feature/product/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routing/page_routes_name.dart';

class CategoryProductCard extends StatelessWidget {
  final ProductEntity? product;

  const CategoryProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Bounceable(
      onTap: () {
        Future.delayed(
          const Duration(milliseconds: 350),
          () {
            Navigator.of(context).pushNamed(PageRoutesName.productDetails,
                arguments: {"product": product});
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton.shade(
              child: Center(
                child: Image.network(
                  product?.thumbnail ?? "",
                  width: 90.w,
                  height: 90.h,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                      width: 75.w, height: 75.h, "assets/images/cat1.png"),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: Text(
                product?.title ?? "-----------",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: const Color(0xff171212),
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "\$ ${product?.price?.toString() ?? "--------------"}",
              style: theme.textTheme.labelMedium?.copyWith(
                color: Colors.black,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
