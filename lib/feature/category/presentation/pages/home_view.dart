import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/base_app_bar.dart';
import '../../../../main.dart';
import '../manager/category_cubit.dart';
import '../widget/category_card.dart';
import '../widget/empty_cat_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = context.read<CategoryCubit>();

    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          context: context,
          title: "Categories",
          leading: false,
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        body: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Text(
                  "Our Categories",
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 22.spMin,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "There are",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14.spMin,
                          color: const Color(0xFF555558),
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: " our Categories",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14.spMin,
                          color: const Color(0xFF555558),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: TextFormField(
                    controller: cubit.searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onChanged: (value) {
                      cubit.catSearch(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",

                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/cat2.png",
                            scale: 16.0,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ).setHorizontalPadding(context, 0.03),

                      suffixIcon: cubit.searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                cubit.searchController.text = "";
                                cubit.catSearch("");
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 20,
                              ),
                            ).setHorizontalPadding(context, 0.035)
                          : Image.asset(
                              "assets/icons/search_icn.png",
                              scale: 2.5,
                            ).setHorizontalPadding(context, 0.035),

                      labelStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF777777),
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 56),

                      suffixIconConstraints: const BoxConstraints(minWidth: 20),

                      hintStyle: theme.textTheme.bodySmall
                          ?.copyWith(color: const Color(0xFF555558)),
                      counterText: "",
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      // suffix: isPass widget.suffixWidget,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ).setVerticalPadding(context, 0.04),
                ),
                if (cubit.searchedCategories.isEmpty && cubit.searchFlag)
                  const EmptyCatWidget(),
                SizedBox(height: 24.h),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is GetCategoriesLoadingState) {
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
                              child: Skeletonizer(
                                enabled: true,
                                child: CategoryCard(
                                  catName: "------------------------",
                                  index: index,
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                        ),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: cubit.searchedCategories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            catName: cubit.searchedCategories[index],
                            index: index,
                          );
                        },
                      );
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
