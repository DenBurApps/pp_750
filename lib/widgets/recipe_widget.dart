// import 'package:flutter/material.dart';
// import 'package:pp_750/core/app_export.dart';
// import 'package:pp_750/core/helpers/image_helper.dart';
//
// import '../data/models/models/models.dart';
//
// class RecipeWidget extends StatefulWidget {
//   final Recipe recipe;
//
//   const RecipeWidget({super.key, required this.recipe});
//
//   @override
//   State<RecipeWidget> createState() => _RecipeWidgetState();
// }
//
// class _RecipeWidgetState extends State<RecipeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppDecoration.surface.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder14,
//       ),
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       child: ListTile(
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 if (widget.recipe.imageUrl != null)
//                   ClipRRect(
//                     borderRadius: BorderRadiusStyle.roundedBorder30,
//                     child: Image.memory(
//                       ImageHelper.convertBase64ToFile(widget.recipe.imageUrl!),
//                       height: 80.h,
//                       width: 80.h,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 SizedBox(width: 10.h),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CustomImageView(
//                             height: 15.h,
//                             width: 15.h,
//                             imagePath: Assets.images.flame.path,
//                           ),
//                           Text(
//                             '${widget.recipe.totalCalories.toString()} kcal',
//                             style: CustomTextStyles.labelSmall,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         widget.recipe.name,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: CustomTextStyles.bodyLarge,
//                       ),
//                       SizedBox(height: 5.h),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         subtitle: Row(
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
//                       '${widget.recipe.totalProtein.toString()} g',
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
//                       ' ${widget.recipe.totalFats.toString()} g',
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
//                       '${widget.recipe.totalCarbohydrates.toString()} g',
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
