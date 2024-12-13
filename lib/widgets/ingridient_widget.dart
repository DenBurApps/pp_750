// import 'package:flutter/material.dart';
//
// import '../core/app_export.dart';
// import '../data/models/models/models.dart';
//
// class IngredientWidget extends StatelessWidget {
//   final Ingredient ingredient;
//   const IngredientWidget({super.key, required this.ingredient});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppDecoration.surface.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder14,
//       ),
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       child: ListTile(
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: Text(
//                   ingredient.name,
//                   style: CustomTextStyles.bodyMedium,
//                 )),
//             Column(
//               children: [
//                 CustomImageView(
//                   height: 20.h,
//                   width: 20.h,
//                   imagePath: Assets.images.flame.path,
//                 ),
//                 Text(
//                   '${ingredient.calories
//                       .toString()} kcal',
//                   style: CustomTextStyles.bodySmallBlack900_1,
//                 ),
//               ],
//             )
//           ],
//         ),
//         subtitle:  Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   height: 40.h,
//                   width: 5.h,
//                   decoration: AppDecoration.fillBlack.copyWith(
//                       color: appTheme.deepOrange300,
//                       borderRadius: BorderRadiusStyle.roundedBorder30),
//                 ),
//                 SizedBox(width: 5.h),
//                 Column(
//                   children: [
//                     Text(
//                       '${ingredient.protein.toString()} g',
//                       style: CustomTextStyles.bodyLarge,
//                     ),
//                     Text(
//                       'Protein',
//                       style: CustomTextStyles.bodyLargeBlack900_1,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 40.h,
//                   width: 5.h,
//                   decoration: AppDecoration.fillBlack.copyWith(
//                       color: appTheme.pink300,
//                       borderRadius: BorderRadiusStyle.roundedBorder30),
//                 ),
//                 SizedBox(width: 5.h),
//                 Column(
//                   children: [
//                     Text(
//                       ' ${ingredient.fats.toString()} g',
//                       style: CustomTextStyles.bodyLarge,
//                     ),
//                     Text(
//                       'Fats',
//                       style: CustomTextStyles.bodyLargeBlack900_1,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 40.h,
//                   width: 5.h,
//                   decoration: AppDecoration.fillBlack.copyWith(
//                       color: appTheme.yellow600,
//                       borderRadius: BorderRadiusStyle.roundedBorder30),
//                 ),
//                 SizedBox(width: 5.h),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${ingredient.carbohydrates.toString()} g',
//                       style: CustomTextStyles.bodyLarge,
//                     ),
//                     Text(
//                       'Carbohydrates',
//                       style: CustomTextStyles.bodyLargeBlack900_1,
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
