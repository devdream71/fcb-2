// import 'package:fcb_global/utils/app_assets.dart';
// import 'package:fcb_global/utils/app_colors.dart';
// import 'package:fcb_global/view/team/member_switch.dart';
// import 'package:fcb_global/view/team/team_controller/team_controller.dart';
// import 'package:fcb_global/view/team/team_model/team_model.dart';
// import 'package:fcb_global/view/join/add_member_form.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TreeView extends StatefulWidget {
//   @override
//   State<TreeView> createState() => _TreeViewState();
// }

// class _TreeViewState extends State<TreeView> {
//   final TreeController controller = Get.put(TreeController());

//   bool isLeftActive = true;
//   var selectedData;
//   var rightSelectedData;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.appcolor,
//         body: Obx(() {
//           if (controller.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (controller.treeData.value == null) {
//             return const Center(
//               child: Text('No tree data available.'),
//             );
//           }

//           final data = controller.treeData.value!;

//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Tree View",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: const Icon(
//                           Icons.cancel,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 10),

//                   //root user ==>
//                   Center(
//                     child: InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           backgroundColor: Colors.white,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.vertical(top: Radius.circular(20)),
//                           ),
//                           builder: (BuildContext context) {
//                             return Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Center(
//                                     child: Text(
//                                       'Details',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   const Divider(color: Colors.black),
//                                   const SizedBox(height: 10),
//                                   const Center(
//                                     child: CircleAvatar(
//                                       radius: 30,
//                                       backgroundImage:
//                                           AssetImage(AppAssets.people),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Name: ${data.user.name}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Phone: ${data.user.phone}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Email: ${data.user.email}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Joining Date: ${data.joiningDate}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Left Member: ${data.lMember}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Left Carry Point: ${data.lCarryPoint}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Right Member: ${data.rMember}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Right Carry Point: ${data.rCarryPoint}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Placement: ${data.placement}',
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   Center(
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.pop(
//                                             context); // Close the modal sheet
//                                       },
//                                       child: const Text('Close'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           const CircleAvatar(
//                             radius: 30,
//                             backgroundImage: AssetImage(AppAssets.people),
//                           ),
//                           Text(data.user.name,
//                               style: const TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold)),
//                           Text(data.user.phone,
//                               style: const TextStyle(
//                                   fontSize: 14, color: Colors.white)),
//                           Text(data.user.email,
//                               style: const TextStyle(
//                                   fontSize: 14, color: Colors.white)),
//                           Text('Ref Name: ${data.referBy.name}',
//                               style: const TextStyle(
//                                   fontSize: 14, color: Colors.white)),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(' ${data.lMember}',
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               const Text(
//                                 ' || ',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               ),
//                               Text('${data.rMember}',
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 10,
//                   ),

//                   ///1st gen ====> container
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.blue,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               //Left Data // gen 1
//                               InkWell(
//                                 onDoubleTap: () {
//                                   setState(() {
//                                     isLeftActive = true;

//                                     selectedData =
//                                         data.downlinkLeft?.downlinkLeft2nd;
//                                     var id = data.downlinkLeft!.user.id;
//                                     print(id);
//                                     controller.fetchTreeData(id!.toInt());
//                                   });
//                                 },
//                                 onTap: () {
//                                   // Show left modal bottom sheet
//                                   showModalBottomSheet(
//                                     context: context,
//                                     backgroundColor: Colors.white,
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                           top: Radius.circular(20)),
//                                     ),
//                                     builder: (BuildContext context) {
//                                       return _buildBottomSheetContent(
//                                         name: data.downlinkLeft!.user.name,
//                                         phone: data.downlinkLeft!.user.phone,
//                                         email: data.downlinkLeft!.user.email,
//                                         placement: data.downlinkLeft!.placement,
//                                         joiningDate:
//                                             data.downlinkLeft!.joiningDate,
//                                         lMember: data.downlinkLeft!.lMember,
//                                         lCarryPoint:
//                                             data.downlinkLeft!.lCarryPoint,
//                                         rMember: data.downlinkLeft!.rMember,
//                                         rCarryPoint:
//                                             data.downlinkLeft!.rCarryPoint,
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Column(
//                                   children: [
//                                     data.downlinkLeft?.user?.name != null
//                                         ? Column(
//                                             children: [
//                                               const CircleAvatar(
//                                                 radius: 30,
//                                                 backgroundImage: AssetImage(
//                                                     AppAssets.people),
//                                               ),
//                                               Text(
//                                                 data.downlinkLeft!.user!.name,
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 data.downlinkLeft?.user
//                                                         ?.phone ??
//                                                     "Left User",
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 10),
//                                               if (isLeftActive)
//                                                 const Icon(
//                                                   Icons
//                                                       .keyboard_double_arrow_down,
//                                                   color: Colors.black,
//                                                   size: 35,
//                                                 ),
//                                             ],
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 builder: (context) => Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom:
//                                                           MediaQuery.of(context)
//                                                               .viewInsets
//                                                               .bottom),
//                                                   child: const JoinForm(),
//                                                 ),
//                                               );
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 40,
//                                                   child: Image.asset(
//                                                     AppAssets.addIcon,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 5),
//                                                 const Text(
//                                                   'Open',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                               ),

//                               // Right Data //gen 1
//                               InkWell(
//                                 onDoubleTap: () {
//                                   setState(() {
//                                     isLeftActive = false;
//                                     rightSelectedData =
//                                         data.downlinkRight?.downlinkRight2nd;
//                                     var id = data.downlinkRight!.user.id;
//                                     print(id);
//                                     controller.fetchTreeData(id!.toInt());
//                                   });
//                                 },
//                                 onTap: () {
//                                   // Show left modal bottom sheet
//                                   showModalBottomSheet(
//                                     context: context,
//                                     backgroundColor: Colors.white,
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                           top: Radius.circular(20)),
//                                     ),
//                                     builder: (BuildContext context) {
//                                       return _buildBottomSheetContent(
//                                         name: data.downlinkRight!.user.name,
//                                         phone: data.downlinkRight!.user.phone,
//                                         email: data.downlinkRight!.user.email,
//                                         joiningDate:
//                                             data.downlinkRight!.joiningDate,
//                                         placement:
//                                             data.downlinkRight!.placement,
//                                         lMember: data.downlinkRight!.lMember,
//                                         lCarryPoint:
//                                             data.downlinkRight!.lCarryPoint,
//                                         rMember: data.downlinkRight!.rMember,
//                                         rCarryPoint:
//                                             data.downlinkRight!.rCarryPoint,
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Column(
//                                   children: [
//                                     data.downlinkRight?.user?.name != null
//                                         ? Column(
//                                             children: [
//                                               const CircleAvatar(
//                                                 radius: 30,
//                                                 backgroundImage: AssetImage(
//                                                     AppAssets.people),
//                                               ),
//                                               Text(
//                                                 data.downlinkRight!.user!.name,
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 data.downlinkRight?.user
//                                                         ?.phone ??
//                                                     "Left User",
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 10),
//                                               if (!isLeftActive)
//                                                 const Icon(
//                                                   Icons
//                                                       .keyboard_double_arrow_down,
//                                                   color: Colors.black,
//                                                   size: 35,
//                                                 ),
//                                             ],
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 builder: (context) => Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom:
//                                                           MediaQuery.of(context)
//                                                               .viewInsets
//                                                               .bottom),
//                                                   child: const JoinForm(),
//                                                 ),
//                                               );
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 SizedBox(
//                                                   height: 40,
//                                                   width: 40,
//                                                   child: Image.asset(
//                                                     AppAssets.addIcon,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 5),
//                                                 const Text(
//                                                   'Open',
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   // 2nd Generation
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.blueGrey,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: data.downlinkLeft != null ||
//                               data.downlinkRight != null
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // Left Column in Gen 2
//                                 SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: InkWell(
//                                       onTap: () {
//                                         showModalBottomSheet(
//                                           context: context,
//                                           backgroundColor: Colors.white,
//                                           shape: const RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.vertical(
//                                                 top: Radius.circular(20)),
//                                           ),
//                                           builder: (BuildContext context) {
//                                             return Padding(
//                                               padding:
//                                                   const EdgeInsets.all(16.0),
//                                               child: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   const Center(
//                                                     child: Text(
//                                                       'Details',
//                                                       style: TextStyle(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const Divider(
//                                                       color: Colors.black),
//                                                   const SizedBox(height: 10),
//                                                   const Center(
//                                                     child: CircleAvatar(
//                                                       radius: 30,
//                                                       backgroundImage:
//                                                           AssetImage(
//                                                               AppAssets.people),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   Text(
//                                                     'Name: ${data.downlinkLeft!.downlinkLeft2nd!.user.name}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Phone: ${data.downlinkLeft!.downlinkLeft2nd!.user.phone}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Email: ${data.downlinkLeft!.downlinkLeft2nd!.user.email}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Joining Date: ${data.downlinkLeft!.downlinkLeft2nd!.joiningDate}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Left Member: ${data.downlinkLeft!.downlinkLeft2nd!.lMember}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Left Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.lCarryPoint}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Right Member: ${data.downlinkLeft!.downlinkLeft2nd!.rMember}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Right Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.rCarryPoint}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     'Placement: ${data.downlinkLeft!.downlinkLeft2nd!.placement}',
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.black),
//                                                   ),
//                                                   const SizedBox(height: 20),
//                                                   Center(
//                                                     child: ElevatedButton(
//                                                       onPressed: () {
//                                                         Navigator.pop(
//                                                             context); // Close the modal sheet
//                                                       },
//                                                       child:
//                                                           const Text('Close'),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       },
//                                       child: Column(children: [
//                                         data.downlinkLeft?.downlinkLeft2nd?.user
//                                                     ?.name !=
//                                                 null
//                                             ? Column(
//                                                 children: [
//                                                   const CircleAvatar(
//                                                     radius: 30,
//                                                     backgroundImage: AssetImage(
//                                                         AppAssets.people),
//                                                   ),
//                                                   Text(
//                                                     isLeftActive == true
//                                                         ? data
//                                                             .downlinkLeft!
//                                                             .downlinkLeft2nd!
//                                                             .user!
//                                                             .name
//                                                         : data.downlinkRight!
//                                                                     .downlinkLeft2nd ==
//                                                                 null
//                                                             ? ""
//                                                             : data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .user!
//                                                                 .name,
//                                                     style: const TextStyle(
//                                                       fontSize: 14,
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     data
//                                                             .downlinkLeft!
//                                                             .downlinkLeft2nd!
//                                                             .user!
//                                                             .phone ??
//                                                         "Left User",
//                                                     style: const TextStyle(
//                                                       fontSize: 14,
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 10),
//                                                 ],
//                                               )
//                                             : InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                     context: context,
//                                                     isScrollControlled: true,
//                                                     builder: (context) =>
//                                                         Padding(
//                                                       padding: EdgeInsets.only(
//                                                           bottom: MediaQuery.of(
//                                                                   context)
//                                                               .viewInsets
//                                                               .bottom),
//                                                       child: const JoinForm(),
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 40,
//                                                       width: 40,
//                                                       child: Image.asset(
//                                                         AppAssets.addIcon,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                     const SizedBox(height: 5),
//                                                     const Text(
//                                                       'Open',
//                                                       style: TextStyle(
//                                                           color: Colors.white),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                       ])),
//                                 ),

//                                 // ====> Right Column in Gen 2

//                                 data.downlinkLeft?.downlinkRight2nd != null ||
//                                         data.downlinkRight!.downlinkRight2nd !=
//                                             null
//                                     ? InkWell(
//                                         onTap: () {
//                                           showModalBottomSheet(
//                                             context: context,
//                                             backgroundColor: Colors.white,
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.vertical(
//                                                       top: Radius.circular(20)),
//                                             ),
//                                             builder: (BuildContext context) {
//                                               return Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(16.0),
//                                                 child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     const Center(
//                                                       child: Text(
//                                                         'Details',
//                                                         style: TextStyle(
//                                                           fontSize: 18,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const Divider(
//                                                         color: Colors.black),
//                                                     const SizedBox(height: 10),
//                                                     const Center(
//                                                       child: CircleAvatar(
//                                                         radius: 30,
//                                                         backgroundImage:
//                                                             AssetImage(AppAssets
//                                                                 .people),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Text(
//                                                       'Name: ${data.downlinkLeft!.downlinkRight2nd!.user.name}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Phone: ${data.downlinkLeft!.downlinkRight2nd!.user.phone}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Email: ${data.downlinkLeft!.downlinkRight2nd!.user.email}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Joining Date: ${data.downlinkLeft!.downlinkRight2nd!.user.phone}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Left Member: ${data.downlinkLeft!.downlinkRight2nd!.lMember}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Left Carry Point: ${data.downlinkLeft!.downlinkRight2nd!.lCarryPoint}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Right Member: ${data.downlinkLeft!.downlinkRight2nd!.rMember}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Right Carry Point: ${data.downlinkLeft!.downlinkRight2nd!.rCarryPoint}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     Text(
//                                                       'Placement: ${data.downlinkLeft!.downlinkRight2nd!.placement}',
//                                                       style: const TextStyle(
//                                                           fontSize: 16,
//                                                           color: Colors.black),
//                                                     ),
//                                                     const SizedBox(height: 20),
//                                                     Center(
//                                                       child: ElevatedButton(
//                                                         onPressed: () {
//                                                           Navigator.pop(
//                                                               context); // Close the modal sheet
//                                                         },
//                                                         child:
//                                                             const Text('Close'),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const CircleAvatar(
//                                               radius: 30,
//                                               backgroundImage:
//                                                   AssetImage(AppAssets.people),
//                                             ),
//                                             const SizedBox(height: 5),
//                                             Text(
//                                               isLeftActive == false
//                                                   ? data.downlinkRight!
//                                                               .downlinkRight2nd ==
//                                                           null
//                                                       ? ""
//                                                       : data
//                                                           .downlinkRight!
//                                                           .downlinkRight2nd!
//                                                           .user
//                                                           .name
//                                                   : data
//                                                       .downlinkLeft!
//                                                       .downlinkRight2nd!
//                                                       .user
//                                                       .name,
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 5),
//                                             Text(
//                                               data.downlinkLeft!
//                                                   .downlinkRight2nd!.user.phone,
//                                               style: const TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     : InkWell(
//                                         onDoubleTap: () {
//                                           print(data.downlinkLeft!
//                                               .downlinkRight2nd!.user.phone);
//                                         },
//                                         onTap: () {
//                                           print(
//                                               "Add button clicked for Downlink Right 2nd Level");
//                                         },
//                                         child: InkWell(
//                                           onTap: () {
//                                             showModalBottomSheet(
//                                               context: context,
//                                               isScrollControlled: true,
//                                               builder: (context) => Padding(
//                                                 padding: EdgeInsets.only(
//                                                     bottom:
//                                                         MediaQuery.of(context)
//                                                             .viewInsets
//                                                             .bottom),
//                                                 child: const JoinForm(),
//                                               ),
//                                             );
//                                           },
//                                           child: Column(
//                                             children: [
//                                               SizedBox(
//                                                 height: 40,
//                                                 width: 40,
//                                                 child: Image.asset(
//                                                   AppAssets.addIcon,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 5),
//                                               const Text(
//                                                 'Open',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                               ],
//                             )
//                           : const SizedBox(),
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildBottomSheetContent({
//     required String name,
//     required String phone,
//     required String email,
//     required int placement,
//     required String joiningDate,
//     required int lMember,
//     required int lCarryPoint,
//     required int rMember,
//     required int rCarryPoint,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Center(
//             child: Text(
//               'Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const Divider(color: Colors.black),
//           const SizedBox(height: 10),
//           const Center(
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(AppAssets.people),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text('Name: $name', style: const TextStyle(fontSize: 16)),
//           Text('Phone: $phone', style: const TextStyle(fontSize: 16)),
//           Text('Email: $email', style: const TextStyle(fontSize: 16)),
//           //Text('Joining Date: $joiningDate', style: const TextStyle(fontSize: 16)),
//           Text('placement: $placement', style: const TextStyle(fontSize: 16)),
//           Text('Left Member: $lMember', style: const TextStyle(fontSize: 16)),
//           Text('Left Carry Point: $lCarryPoint',
//               style: const TextStyle(fontSize: 16)),
//           Text('Right Member: $rMember', style: const TextStyle(fontSize: 16)),
//           Text('Right Carry Point: $rCarryPoint',
//               style: const TextStyle(fontSize: 16)),
//           //Text('Placement: $placement', style: const TextStyle(fontSize: 16)),
//           const SizedBox(height: 20),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Close'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/team/member_switch.dart';
import 'package:fcb_global/view/team/team_controller/team_controller.dart';
import 'package:fcb_global/view/team/team_model/team_model.dart';
import 'package:fcb_global/view/join/add_member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeView extends StatefulWidget {
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  final TreeController controller = Get.put(TreeController());

  bool isLeftActive = true;

  bool isRightActive = true;

  var selectedData;
  var rightSelectedData;

  var leftSelectedDateG2;
  var rightSelecteddateG2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.treeData.value == null) {
            return const Center(
              child: Text('No tree data available.'),
            );
          }

          final data = controller.treeData.value!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tree View",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //root user ==>
                  Center(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const Divider(color: Colors.black),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppAssets.people),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Name: ${data.user.name}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Phone: ${data.user.phone}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Email: ${data.user.email}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Joining Date: ${data.joiningDate}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Left Member: ${data.lMember}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Left Carry Point: ${data.lCarryPoint}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Right Member: ${data.rMember}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Right Carry Point: ${data.rCarryPoint}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    'Placement: ${data.placement}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                        label: const Text('Close'),
                                      ),
                                      ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.blue,
                                          ),
                                          label: const Text('Step Down'))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppAssets.people),
                          ),
                          Text(data.user.name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(data.user.phone,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          Text(data.user.email,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          Text('Ref Name: ${data.referBy.name}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(' ${data.lMember}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              const Text(
                                ' || ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text('${data.rMember}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  ///1st gen ====> container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      //color: Colors.blue.withOpacity(0.9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Left Data // gen 1
                              InkWell(
                                onTap: () {
                                  // Show left modal bottom sheet
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (BuildContext context) {
                                      return _buildBottomSheetContent(
                                        name: data.downlinkLeft!.user.name,
                                        phone: data.downlinkLeft!.user.phone,
                                        email: data.downlinkLeft!.user.email,
                                        placement: data.downlinkLeft!.placement,
                                        joiningDate:
                                            data.downlinkLeft!.joiningDate,
                                        lMember: data.downlinkLeft!.lMember,
                                        lCarryPoint:
                                            data.downlinkLeft!.lCarryPoint,
                                        rMember: data.downlinkLeft!.rMember,
                                        rCarryPoint:
                                            data.downlinkLeft!.rCarryPoint,
                                        onPressed: () {
                                          setState(() {
                                            isLeftActive = true;

                                            selectedData = data
                                                .downlinkLeft?.downlinkLeft2nd;
                                            var id = data.downlinkLeft!.user.id;
                                            print(id);
                                            controller
                                                .fetchTreeData(id!.toInt());
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    data.downlinkLeft?.user?.name != null
                                        ? Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 30,
                                                backgroundImage: AssetImage(
                                                    AppAssets.people),
                                              ),
                                              Text(
                                                data.downlinkLeft!.user!.name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                data.downlinkLeft?.user
                                                        ?.phone ??
                                                    "Left User",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          )
                                        : InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: const JoinForm(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    AppAssets.addIcon,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text(
                                                  'Open',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),

                              // Right Data //gen 1
                              InkWell(
                                onTap: () {
                                  // Show left modal bottom sheet
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (BuildContext context) {
                                      return _buildBottomSheetContent(
                                          name: data.downlinkRight!.user.name,
                                          phone: data.downlinkRight!.user.phone,
                                          email: data.downlinkRight!.user.email,
                                          joiningDate:
                                              data.downlinkRight!.joiningDate,
                                          placement:
                                              data.downlinkRight!.placement,
                                          lMember: data.downlinkRight!.lMember,
                                          lCarryPoint:
                                              data.downlinkRight!.lCarryPoint,
                                          rMember: data.downlinkRight!.rMember,
                                          rCarryPoint:
                                              data.downlinkRight!.rCarryPoint,
                                          onPressed: () {
                                            setState(() {
                                              isLeftActive = false;
                                              rightSelectedData = data
                                                  .downlinkRight
                                                  ?.downlinkRight2nd;
                                              var id =
                                                  data.downlinkRight!.user.id;
                                              print(id);
                                              controller
                                                  .fetchTreeData(id!.toInt());
                                              Navigator.pop(context);
                                            });
                                          });
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    data.downlinkRight?.user?.name != null
                                        ? Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 30,
                                                backgroundImage: AssetImage(
                                                    AppAssets.people),
                                              ),
                                              Text(
                                                data.downlinkRight!.user!.name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                data.downlinkRight?.user
                                                        ?.phone ??
                                                    "Left User",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          )
                                        : InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: const JoinForm(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    AppAssets.addIcon,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text(
                                                  'Open',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  ///2nd gen 2  ===> container
                  Container(
                    //height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: Colors.blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: data.downlinkLeft != null ||
                              data.downlinkRight != null
                          ? Container(
                              decoration: BoxDecoration(
                                  //color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  data.downlinkLeft?.downlinkLeft2nd?.user
                                              ?.name !=
                                          null
                                      ? SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //gen 2 //downlinkLeft!.downlinkLeft2nd!

                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return _buildBottomSheetContent(
                                                            name: data
                                                                .downlinkLeft!
                                                                .downlinkLeft2nd!
                                                                .user!
                                                                .name,
                                                            phone: data
                                                                .downlinkLeft!
                                                                .downlinkLeft2nd!
                                                                .user
                                                                .phone,
                                                            email: data
                                                                .downlinkLeft!
                                                                .downlinkLeft2nd!
                                                                .user
                                                                .email,
                                                            joiningDate: data
                                                                .downlinkLeft!
                                                                .downlinkLeft2nd!
                                                                .joiningDate,
                                                            placement: data
                                                                .downlinkLeft!
                                                                .placement,
                                                            lMember: data
                                                                .downlinkLeft!
                                                                .lMember,
                                                            lCarryPoint: data
                                                                .downlinkLeft!
                                                                .lCarryPoint,
                                                            rMember: data
                                                                .downlinkLeft!
                                                                .rMember,
                                                            rCarryPoint: data
                                                                .downlinkLeft!
                                                                .rCarryPoint,
                                                            onPressed: () {
                                                              setState(() {
                                                                isLeftActive =
                                                                    true;

                                                                selectedData = data
                                                                    .downlinkLeft
                                                                    ?.downlinkLeft2nd;
                                                                var id = data
                                                                    .downlinkLeft!
                                                                    .downlinkLeft2nd!
                                                                    .user
                                                                    .id;
                                                                print(id);
                                                                controller
                                                                    .fetchTreeData(
                                                                        id!.toInt());
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            });
                                                      });
                                                },
                                                child: data
                                                            .downlinkLeft
                                                            ?.downlinkLeft2nd
                                                            ?.user
                                                            ?.name !=
                                                        null
                                                    ?

                                                    //data.downlinkLeft?.downlinkLeft2nd?.name != null ?

                                                    Column(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    AppAssets
                                                                        .people),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            data
                                                                .downlinkLeft!
                                                                .downlinkLeft2nd!
                                                                .user!
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  const JoinForm(),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  Image.asset(
                                                                AppAssets
                                                                    .addIcon,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            const Text(
                                                              'Open',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),

                                              const SizedBox(
                                                width: 10,
                                              ),

                                              //gen 2 // downlinkLeft!.downlinkRight2nd
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return _buildBottomSheetContent(
                                                            name: data
                                                                .downlinkLeft!
                                                                .downlinkRight2nd!
                                                                .user!
                                                                .name,
                                                            phone: data
                                                                .downlinkLeft!
                                                                .downlinkRight2nd!
                                                                .user
                                                                .phone,
                                                            email: data
                                                                .downlinkLeft!
                                                                .downlinkRight2nd!
                                                                .user
                                                                .email,
                                                            joiningDate: data
                                                                .downlinkLeft!
                                                                .downlinkRight2nd!
                                                                .joiningDate,
                                                            placement: data
                                                                .downlinkLeft!
                                                                .placement,
                                                            lMember: data
                                                                .downlinkLeft!
                                                                .lMember,
                                                            lCarryPoint: data
                                                                .downlinkLeft!
                                                                .lCarryPoint,
                                                            rMember: data
                                                                .downlinkLeft!
                                                                .rMember,
                                                            rCarryPoint: data
                                                                .downlinkLeft!
                                                                .rCarryPoint,
                                                            onPressed: () {
                                                              setState(() {
                                                                isLeftActive =
                                                                    true;

                                                                selectedData = data
                                                                    .downlinkLeft
                                                                    ?.downlinkRight2nd;
                                                                var id = data
                                                                    .downlinkLeft!
                                                                    .downlinkRight2nd!
                                                                    .user
                                                                    .id;
                                                                print(id);
                                                                controller
                                                                    .fetchTreeData(
                                                                        id!.toInt());
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            });
                                                      });
                                                },
                                                child: data.downlinkLeft!
                                                            .downlinkRight2nd !=
                                                        null
                                                    ? Column(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    AppAssets
                                                                        .people),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            data
                                                                .downlinkLeft!
                                                                .downlinkRight2nd!
                                                                .user!
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  const JoinForm(),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  Image.asset(
                                                                AppAssets
                                                                    .addIcon,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            const Text(
                                                              'Open',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),

                                              const SizedBox(
                                                width: 40,
                                              ),

                                              const IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Text(''),
                                                    VerticalDivider(
                                                      color: Colors.black,
                                                      thickness: 2,
                                                    ),
                                                    Text(''),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                width: 40,
                                              ),

                                              //2nd gen //downlinkRight! .downlinkLeft2nd
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return _buildBottomSheetContent(
                                                            name: data
                                                                .downlinkRight!
                                                                .downlinkLeft2nd!
                                                                .user!
                                                                .name,
                                                            phone: data
                                                                .downlinkRight!
                                                                .downlinkLeft2nd!
                                                                .user
                                                                .phone,
                                                            email: data
                                                                .downlinkRight!
                                                                .downlinkLeft2nd!
                                                                .user
                                                                .email,
                                                            joiningDate: data
                                                                .downlinkRight!
                                                                .downlinkLeft2nd!
                                                                .joiningDate,
                                                            placement: data
                                                                .downlinkRight!
                                                                .placement,
                                                            lMember: data
                                                                .downlinkRight!
                                                                .lMember,
                                                            lCarryPoint: data
                                                                .downlinkRight!
                                                                .lCarryPoint,
                                                            rMember: data
                                                                .downlinkRight!
                                                                .rMember,
                                                            rCarryPoint: data
                                                                .downlinkRight!
                                                                .rCarryPoint,
                                                            onPressed: () {
                                                              setState(() {
                                                                isLeftActive =
                                                                    true;

                                                                selectedData = data
                                                                    .downlinkRight
                                                                    ?.downlinkLeft2nd;

                                                                ///=====not working
                                                                var id = data
                                                                    .downlinkRight!
                                                                    .downlinkLeft2nd!
                                                                    .user
                                                                    .id;
                                                                print(id);
                                                                controller
                                                                    .fetchTreeData(
                                                                        id!.toInt());
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            });
                                                      });
                                                },
                                                child: data.downlinkRight !=
                                                            null &&
                                                        data.downlinkRight!
                                                                .downlinkLeft2nd !=
                                                            null
                                                    ? Column(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    AppAssets
                                                                        .people),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            data
                                                                .downlinkRight!
                                                                .downlinkLeft2nd!
                                                                .user!
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  const JoinForm(),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  Image.asset(
                                                                AppAssets
                                                                    .addIcon,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            const Text(
                                                              'Open',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),

                                              const SizedBox(
                                                width: 10,
                                              ),

                                              // gen 2 // downlinkRight!.downlinkRight2nd
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return _buildBottomSheetContent(
                                                          name: data
                                                              .downlinkRight!
                                                              .downlinkRight2nd!
                                                              .user!
                                                              .name,
                                                          phone: data
                                                              .downlinkRight!
                                                              .downlinkRight2nd!
                                                              .user
                                                              .phone,
                                                          email: data
                                                              .downlinkRight!
                                                              .downlinkRight2nd!
                                                              .user
                                                              .email,
                                                          joiningDate: data
                                                              .downlinkRight!
                                                              .downlinkRight2nd!
                                                              .joiningDate,
                                                          placement: data
                                                              .downlinkRight!
                                                              .placement,
                                                          lMember: data
                                                              .downlinkRight!
                                                              .lMember,
                                                          lCarryPoint: data
                                                              .downlinkRight!
                                                              .lCarryPoint,
                                                          rMember: data
                                                              .downlinkRight!
                                                              .rMember,
                                                          rCarryPoint: data
                                                              .downlinkRight!
                                                              .rCarryPoint,
                                                          onPressed: () {
                                                            setState(() {
                                                              isLeftActive =
                                                                  true;

                                                              selectedData = data
                                                                  .downlinkRight
                                                                  ?.downlinkLeft2nd;
                                                              var id = data
                                                                  .downlinkRight!
                                                                  .downlinkRight2nd!
                                                                  .user
                                                                  .id;
                                                              print(id);
                                                              controller
                                                                  .fetchTreeData(
                                                                      id!.toInt());
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                        );
                                                      });
                                                },
                                                child: data.downlinkRight !=
                                                            null &&
                                                        data.downlinkRight!
                                                                .downlinkRight2nd !=
                                                            null
                                                    ? Column(
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 25,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    AppAssets
                                                                        .people),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            data
                                                                .downlinkRight!
                                                                .downlinkRight2nd!
                                                                .user!
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  const JoinForm(),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  Image.asset(
                                                                AppAssets
                                                                    .addIcon,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            const Text(
                                                              'Open',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (context) => Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: const JoinForm(),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset(
                                                  AppAssets.addIcon,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'Open',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomSheetContent(
      {required String name,
      required String phone,
      required String email,
      required int placement,
      required String joiningDate,
      required int lMember,
      required int lCarryPoint,
      required int rMember,
      required int rCarryPoint,
      required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(color: Colors.black),
          const SizedBox(height: 10),
          const Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppAssets.people),
            ),
          ),
          const SizedBox(height: 10),
          Text('Name: $name', style: const TextStyle(fontSize: 16)),
          Text('Phone: $phone', style: const TextStyle(fontSize: 16)),
          Text('Email: $email', style: const TextStyle(fontSize: 16)),
          Text('Joining Date: $joiningDate',
              style: const TextStyle(fontSize: 16)),
          Text('placement: $placement', style: const TextStyle(fontSize: 16)),
          Text('Left Member: $lMember', style: const TextStyle(fontSize: 16)),
          Text('Left Carry Point: $lCarryPoint',
              style: const TextStyle(fontSize: 16)),
          Text('Right Member: $rMember', style: const TextStyle(fontSize: 16)),
          Text('Right Carry Point: $rCarryPoint',
              style: const TextStyle(fontSize: 16)),
          //Text('Placement: $placement', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  label: const Text('Close'),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                  ),
                  label: const Text('Switch To Top'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
