// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pp_750/core/app_export.dart';
// import 'package:pp_750/data/models/models/models.dart';
//
// class TrainingWidget extends StatelessWidget {
//   final TrainingPlan trainingPlan;
//   final Function()? onEdit;
//   final Function()? onDelete;
//
//   const TrainingWidget(
//       {super.key, required this.trainingPlan, this.onEdit, this.onDelete});
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       padding:  EdgeInsets.zero,
//       onPressed: () {
//
//         context.pushRoute(ViewTrainingRoute(trainingPlan: trainingPlan));
//       },
//       child: Container(
//         decoration: AppDecoration.surface.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder30,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomImageView(
//                   imagePath: trainingPlan.type.icon,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         trainingPlan.name,
//                         overflow: TextOverflow.ellipsis,
//                         style: CustomTextStyles.displaySmall.copyWith(
//                           color: appTheme.gray300,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           CustomImageView(
//                             height: 20.h,
//                             width: 20.h,
//                             imagePath: trainingPlan.level.icon,
//                           ),
//                           SizedBox(width: 8.h),
//                           Text(
//                             trainingPlan.level.name,
//                             style: CustomTextStyles.bodyLarge.copyWith(
//                               color: appTheme.gray300,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 trainingPlan.exerciseCount.toString(),
//                                 style: CustomTextStyles.bodyLarge,
//                               ),
//                               SizedBox(width: 8.h),
//                               Text(
//                                 'Exercises',
//                                 style: CustomTextStyles.labelLarge,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 trainingPlan.getActualTotalTime().toString(),
//                                 style: CustomTextStyles.bodyLarge,
//                               ),
//                               SizedBox(width: 8.h),
//                               Text(
//                                 'Min',
//                                 style: CustomTextStyles.labelLarge,
//                               ),
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     ...trainingPlan.exercises
//                         .expand((exercise) => exercise.requiredEquipment)
//                         .toSet()
//                         .map((equipment) => Padding(
//                               padding: EdgeInsets.only(right: 2.h),
//                               child: CustomImageView(
//                                 imagePath: equipment.icon,
//                                 width: 24.h,
//                                 height: 24.h,
//                                 fit: BoxFit.contain,
//                               ),
//                             ))
//                         .toList()
//                   ],
//                 ),
//                 SizedBox(width: 8.h),
//                 PopupMenuButton(
//                   icon: Icon(
//                     Icons.menu,
//                     color: theme.colorScheme.primary,
//                   ),
//                   itemBuilder: (context) {
//                     return [
//                       PopupMenuItem(
//                         onTap: onEdit,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Edit'),
//                             CustomImageView(
//                               imagePath: Assets.images.edit,
//                               width: 24.h,
//                               height: 24.h,
//                               fit: BoxFit.contain,
//                             ),
//                           ],
//                         ),
//                       ),
//                       PopupMenuItem(
//                         onTap: () {
//                           onDelete?.call();
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Delete'),
//                             CustomImageView(
//                               imagePath: Assets.images.delete,
//                               width: 24.h,
//                               height: 24.h,
//                               fit: BoxFit.contain,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
