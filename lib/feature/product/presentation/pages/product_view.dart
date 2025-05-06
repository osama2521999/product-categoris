import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/base_app_bar.dart';
import '../../../../main.dart';
import '../manager/product_cubit.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = context.read<ProductCubit>();
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          context: context,
          title: cubit.selectedProduct?.title ?? "",
          leading: true,
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              BlocBuilder<ProductCubit, ProductStates>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounceable(
                        onTap: cubit.imageIndex == 0
                            ? null
                            : () {
                                cubit.changeProductImage(right: false);
                              },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.sp,
                          color: cubit.imageIndex == 0
                              ? const Color(0xFFCCCCCC)
                              : Colors.black,
                        ),
                      ),
                      Center(
                        child: Image.network(
                          cubit.selectedProduct?.images?[cubit.imageIndex] ??
                              "",
                          width: 250.w,
                          height: 250.h,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                  width: 75.w,
                                  height: 75.h,
                                  "assets/images/cat1.png"),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 250.w,
                              height: 250.h,
                              child: Center(
                                child: SizedBox(
                                  width: 85.w,
                                  height: 85.h,
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Bounceable(
                        onTap: cubit.imageIndex ==
                                (cubit.selectedProduct?.images?.length ?? 0) - 1
                            ? null
                            : () {
                                cubit.changeProductImage(right: true);
                              },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 30.sp,
                          color: cubit.imageIndex ==
                                  (cubit.selectedProduct?.images?.length ?? 0) -
                                      1
                              ? const Color(0xFFCCCCCC)
                              : Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 35.h),
              Text(
                cubit.selectedProduct?.title ?? "-----------",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: const Color(0xff171212),
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "\$ ${cubit.selectedProduct?.price?.toString()}",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                cubit.selectedProduct?.description ?? "",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ).setHorizontalPadding(context, 0.064),
        ));
  }
}
