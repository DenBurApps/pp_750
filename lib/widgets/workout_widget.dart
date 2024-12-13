// import 'package:flutter/material.dart';
// import 'package:pp_750/data/models/models/models.dart';
//
// import '../core/app_export.dart';
//
// class WorkoutWidget extends StatelessWidget {
//  final  Workout workout;
//   const WorkoutWidget({super.key, required this.workout});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.h),
//       decoration: AppDecoration.fillGray.copyWith(
//         borderRadius: BorderRadius.circular(8.h),
//       ),
//       child: ListTile(
//         leading: Container(
//           width: 40.h,
//           height: 40.h,
//           decoration: BoxDecoration(
//             color: theme.colorScheme.primary,
//             borderRadius: BorderRadius.circular(8.h),
//           ),
//           child: Center(
//             child: Text(
//               '${workout.name[0]}',
//               style: CustomTextStyles.displayLarge,
//             ),
//           ),
//         ),
//         title: Text('${workout.name}'),
//         subtitle: Text('${workout.category.displayName}'),
//         // trailing: Icon(Icons.arrow_forward_ios),
//       ),
//     );
//   }
// }
