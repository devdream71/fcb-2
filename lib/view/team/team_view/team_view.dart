import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/team/member_switch.dart';
import 'package:fcb_global/view/team/team_controller/team_controller.dart';
import 'package:fcb_global/view/team/team_model/team_model.dart';
import 'package:fcb_global/widget/add_member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeView extends StatefulWidget {
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  final TreeController controller = Get.put(TreeController());

  bool isLeftActive = true;
  var selectedData;

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
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the modal sheet
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ),
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

                  ///=== first genaration,
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(16),
                  //       color: Colors.blue),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(15.0),
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             InkWell(
                  //               //show left data
                  //               onDoubleTap: () {},
                  //               onTap: () {
                  //                 showModalBottomSheet(
                  //                   context: context,
                  //                   backgroundColor: Colors.white,
                  //                   shape: const RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.vertical(
                  //                         top: Radius.circular(20)),
                  //                   ),
                  //                   builder: (BuildContext context) {
                  //                     return Padding(
                  //                       padding: const EdgeInsets.all(16.0),
                  //                       child: Column(
                  //                         mainAxisSize: MainAxisSize.min,
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           const Center(
                  //                             child: Text(
                  //                               'Details',
                  //                               style: TextStyle(
                  //                                 fontSize: 18,
                  //                                 fontWeight: FontWeight.bold,
                  //                                 color: Colors.black,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const Divider(color: Colors.black),
                  //                           const SizedBox(height: 10),
                  //                           const Center(
                  //                             child: CircleAvatar(
                  //                               radius: 30,
                  //                               backgroundImage: AssetImage(
                  //                                   AppAssets.people),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(
                  //                             height: 10,
                  //                           ),
                  //                           Text(
                  //                             'Name: ${data.downlinkLeft!.user.name}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Phone: ${data.downlinkLeft!.user.phone}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Email: ${data.downlinkLeft!.user.email}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Joining Date: ${data.downlinkLeft!.joiningDate}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Left Member: ${data.downlinkLeft!.lMember}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Left Carry Point: ${data.downlinkLeft!.lCarryPoint}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Right Member: ${data.downlinkLeft!.rMember}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Right Carry Point: ${data.downlinkLeft!.rCarryPoint}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           Text(
                  //                             'Placement: ${data.downlinkLeft!.placement}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.black),
                  //                           ),
                  //                           const SizedBox(height: 20),
                  //                           Center(
                  //                             child: ElevatedButton(
                  //                               onPressed: () {
                  //                                 Navigator.pop(
                  //                                     context); // Close the modal sheet
                  //                               },
                  //                               child: const Text('Close'),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   },
                  //                 );
                  //               },
                  //               child: Column(
                  //                 children: [
                  //                   const CircleAvatar(
                  //                     radius: 30,
                  //                     backgroundImage:
                  //                         AssetImage(AppAssets.people),
                  //                   ),

                  //                   Text(
                  //                     data.downlinkLeft!.user.name,
                  //                     style: const TextStyle(
                  //                       fontSize: 14,
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     data.downlinkLeft!.user.phone,
                  //                     style: const TextStyle(
                  //                         fontSize: 14, color: Colors.white),
                  //                   ),
                  //                   Text(
                  //                     data.downlinkLeft!.user.email,
                  //                     style: const TextStyle(
                  //                         fontSize: 14, color: Colors.white),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 10,
                  //                   ),

                  //                   //icon
                  //                   const Icon(
                  //                     Icons.keyboard_double_arrow_down,
                  //                     color: Colors.black,
                  //                     size: 35,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),

                  //             //right
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(6)),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(16.0),
                  //                 child: InkWell(
                  //                   //show right data
                  //                   onDoubleTap: () {},
                  //                   onTap: () {
                  //                     showModalBottomSheet(
                  //                       context: context,
                  //                       backgroundColor: Colors.white,
                  //                       shape: const RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.vertical(
                  //                             top: Radius.circular(20)),
                  //                       ),
                  //                       builder: (BuildContext context) {
                  //                         return Padding(
                  //                           padding: const EdgeInsets.all(16.0),
                  //                           child: Column(
                  //                             mainAxisSize: MainAxisSize.min,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               const Center(
                  //                                 child: Text(
                  //                                   'Details',
                  //                                   style: TextStyle(
                  //                                     fontSize: 18,
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                     color: Colors.black,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               const Divider(
                  //                                   color: Colors.black),
                  //                               const SizedBox(height: 10),
                  //                               const Center(
                  //                                 child: CircleAvatar(
                  //                                   radius: 30,
                  //                                   backgroundImage: AssetImage(
                  //                                       AppAssets.people),
                  //                                 ),
                  //                               ),
                  //                               const SizedBox(
                  //                                 height: 10,
                  //                               ),
                  //                               Text(
                  //                                 'Name: ${data.downlinkRight!.user.name}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Phone: ${data.downlinkRight!.user.phone}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Email: ${data.downlinkRight!.user.email}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Joining Date: ${data.downlinkRight!.joiningDate}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Left Member: ${data.downlinkRight!.lMember}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Left Carry Point: ${data.downlinkRight!.lCarryPoint}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Right Member: ${data.downlinkRight!.rMember}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Right Carry Point: ${data.downlinkRight!.rCarryPoint}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               Text(
                  //                                 'Placement: ${data.downlinkRight!.placement}',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: Colors.black),
                  //                               ),
                  //                               const SizedBox(height: 20),
                  //                               Center(
                  //                                 child: ElevatedButton(
                  //                                   onPressed: () {
                  //                                     Navigator.pop(
                  //                                         context); // Close the modal sheet
                  //                                   },
                  //                                   child: const Text('Close'),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         );
                  //                       },
                  //                     );
                  //                   },
                  //                   child: Column(
                  //                     children: [
                  //                       const CircleAvatar(
                  //                         radius: 30,
                  //                         backgroundImage:
                  //                             AssetImage(AppAssets.people),
                  //                       ),

                  //                       Text(data.downlinkRight!.user.name,
                  //                           style: const TextStyle(
                  //                               fontSize: 14,
                  //                               color: Colors.white,
                  //                               fontWeight: FontWeight.bold)),
                  //                       Text(data.downlinkRight!.user.phone,
                  //                           style: const TextStyle(
                  //                               fontSize: 14,
                  //                               color: Colors.white)),
                  //                       Text(data.downlinkRight!.user.email,
                  //                           style: const TextStyle(
                  //                               fontSize: 14,
                  //                               color: Colors.white)),

                  //                       ///=== icons
                  //                       const SizedBox(
                  //                         height: 35,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 30,
                  ),

                  ////====> 2nd genaration ==>
                  //downlink left 2nd // G-2
                  // Container(
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: Colors.blueGrey),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(15.0),
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         Column(
                  //           children: [
                  //             Row(
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 //downlink left 2nd
                  // InkWell(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //       context: context,
                  //       backgroundColor: Colors.white,
                  //       shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.vertical(
                  //             top: Radius.circular(20)),
                  //       ),
                  //       builder: (BuildContext context) {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(16.0),
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               const Center(
                  //                 child: Text(
                  //                   'Details',
                  //                   style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight:
                  //                         FontWeight.bold,
                  //                     color: Colors.black,
                  //                   ),
                  //                 ),
                  //               ),
                  //               const Divider(
                  //                   color: Colors.black),
                  //               const SizedBox(height: 10),
                  //               const Center(
                  //                 child: CircleAvatar(
                  //                   radius: 30,
                  //                   backgroundImage: AssetImage(
                  //                       AppAssets.people),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 height: 10,
                  //               ),
                  //               Text(
                  //                 'Name: ${data.downlinkLeft!.downlinkLeft2nd!.user.name}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Phone: ${data.downlinkLeft!.downlinkLeft2nd!.user.phone}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Email: ${data.downlinkLeft!.downlinkLeft2nd!.user.email}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Joining Date: ${data.downlinkLeft!.downlinkLeft2nd!.joiningDate}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Left Member: ${data.downlinkLeft!.downlinkLeft2nd!.lMember}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Left Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.lCarryPoint}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Right Member: ${data.downlinkLeft!.downlinkLeft2nd!.rMember}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Right Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.rCarryPoint}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               Text(
                  //                 'Placement: ${data.downlinkLeft!.downlinkLeft2nd!.placement}',
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     color: Colors.black),
                  //               ),
                  //               const SizedBox(height: 20),
                  //               Center(
                  //                 child: ElevatedButton(
                  //                   onPressed: () {
                  //                     Navigator.pop(
                  //                         context); // Close the modal sheet
                  //                   },
                  //                   child: const Text('Close'),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  //                   child: Column(
                  //                     children: [
                  //                       const CircleAvatar(
                  //                         radius: 30,
                  //                         backgroundImage:
                  //                             AssetImage(AppAssets.people),
                  //                       ),
                  //                       if (data.downlinkLeft
                  //                               ?.downlinkLeft2nd !=
                  //                           null) ...[
                  //                         Text(
                  //                             '${data.downlinkLeft!.downlinkLeft2nd!.user.name}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 14,
                  //                                 color: Colors.white)),
                  //                         Text(
                  //                             '${data.downlinkLeft!.downlinkLeft2nd!.user.phone}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 14,
                  //                                 color: Colors.white)),
                  //                         Text(
                  //                             '${data.downlinkLeft!.downlinkLeft2nd!.user.email}',
                  //                             style: const TextStyle(
                  //                                 fontSize: 14,
                  //                                 color: Colors.white)),
                  //                         const SizedBox(height: 20),
                  //                       ] else ...[
                  //                         ElevatedButton(
                  //                           onPressed: () {
                  //                             // Add your action for adding a new downlink here.
                  //                             print(
                  //                                 "Add button clicked for Downlink Left 2nd Level");
                  //                             showModalBottomSheet(
                  //                               context: context,
                  //                               isScrollControlled: true,
                  //                               builder: (context) => Padding(
                  //                                 padding: EdgeInsets.only(
                  //                                     bottom:
                  //                                         MediaQuery.of(context)
                  //                                             .viewInsets
                  //                                             .bottom),
                  //                                 child: const JoinForm(),
                  //                               ),
                  //                             );
                  //                           },
                  //                           child: const Text('Add +'),
                  //                         ),
                  //                       ],
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 const SizedBox(
                  //                   width: 120,
                  //                 ),

                  //                 //2nd Downlink right

                  //                 if (data.downlinkRight?.downlinkRight2nd !=
                  //                     null) ...[
                  //                   const Text(
                  //                       'Downlink Right 2nd Level Information',
                  //                       style: TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.white)),
                  //                   Text(
                  //                       'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
                  //                       style: const TextStyle(
                  //                           fontSize: 14, color: Colors.white)),
                  //                   Text(
                  //                       'Phone: ${data.downlinkRight!.downlinkRight2nd!.user.phone}',
                  //                       style: const TextStyle(
                  //                           fontSize: 14, color: Colors.white)),
                  //                   Text(
                  //                       'Email: ${data.downlinkRight!.downlinkRight2nd!.user.email}',
                  //                       style: const TextStyle(
                  //                           fontSize: 14, color: Colors.white)),
                  //                   const SizedBox(height: 20),
                  //                 ] else ...[
                  //                   InkWell(
                  //                     onTap: () {
                  //                       // Add your action for adding a new downlink here.
                  //                       print(
                  //                           "Add button clicked for Downlink Right 2nd Level");
                  //                       showModalBottomSheet(
                  //                         context: context,
                  //                         isScrollControlled: true,
                  //                         builder: (context) => Padding(
                  //                           padding: EdgeInsets.only(
                  //                               bottom: MediaQuery.of(context)
                  //                                   .viewInsets
                  //                                   .bottom),
                  //                           child: const JoinForm(),
                  //                         ),
                  //                       );
                  //                     },
                  //                     child: Column(
                  //                       children: [
                  //                         SizedBox(
                  //                             height: 40,
                  //                             width: 40,
                  //                             child: Image.asset(
                  //                               AppAssets.addIcon,
                  //                               color: Colors.white,
                  //                             )),
                  //                         const Text(
                  //                           'Open',
                  //                           style:
                  //                               TextStyle(color: Colors.white),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],

                  //                 const SizedBox(
                  //                   width: 18,
                  //                 ),

                  //                 //downlink - left - 2nd // 2
                  //                 // InkWell(
                  //                 //   onTap: () {
                  //                 //     showModalBottomSheet(
                  //                 //       context: context,
                  //                 //       backgroundColor: Colors.white,
                  //                 //       shape: const RoundedRectangleBorder(
                  //                 //         borderRadius: BorderRadius.vertical(
                  //                 //             top: Radius.circular(20)),
                  //                 //       ),
                  //                 //       builder: (BuildContext context) {
                  //                 //         return Padding(
                  //                 //           padding:
                  //                 //               const EdgeInsets.all(16.0),
                  //                 //           child: Column(
                  //                 //             mainAxisSize: MainAxisSize.min,
                  //                 //             crossAxisAlignment:
                  //                 //                 CrossAxisAlignment.start,
                  //                 //             children: [
                  //                 //               const Center(
                  //                 //                 child: Text(
                  //                 //                   'Details',
                  //                 //                   style: TextStyle(
                  //                 //                     fontSize: 18,
                  //                 //                     fontWeight:
                  //                 //                         FontWeight.bold,
                  //                 //                     color: Colors.black,
                  //                 //                   ),
                  //                 //                 ),
                  //                 //               ),
                  //                 //               const Divider(
                  //                 //                   color: Colors.black),
                  //                 //               const SizedBox(height: 10),
                  //                 //               const Center(
                  //                 //                 child: CircleAvatar(
                  //                 //                   radius: 30,
                  //                 //                   backgroundImage:
                  //                 //                       AssetImage(
                  //                 //                           AppAssets.people),
                  //                 //                 ),
                  //                 //               ),
                  //                 //               const SizedBox(
                  //                 //                 height: 10,
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Name: ${data.downlinkRight!.downlinkLeft2nd!.user.name}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Phone: ${data.downlinkRight!.downlinkLeft2nd!.user.phone}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Email: ${data.downlinkRight!.downlinkLeft2nd!.user.email}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Joining Date: ${data.downlinkRight!.downlinkLeft2nd!.joiningDate}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Left Member: ${data.downlinkRight!.downlinkLeft2nd!.lMember}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Left Carry Point: ${data.downlinkRight!.downlinkLeft2nd!.lCarryPoint}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Right Member: ${data.downlinkRight!.downlinkLeft2nd!.rMember}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Right Carry Point: ${data.downlinkRight!.downlinkLeft2nd!.rCarryPoint}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),
                  //                 //               Text(
                  //                 //                 'Placement: ${data.downlinkRight!.downlinkLeft2nd!.placement}',
                  //                 //                 style: const TextStyle(
                  //                 //                     fontSize: 16,
                  //                 //                     color: Colors.black),
                  //                 //               ),

                  //                 //               //

                  //                 //               const SizedBox(height: 20),
                  //                 //               Center(
                  //                 //                 child: ElevatedButton(
                  //                 //                   onPressed: () {
                  //                 //                     Navigator.pop(
                  //                 //                         context); // Close the modal sheet
                  //                 //                   },
                  //                 //                   child:
                  //                 //                       const Text('Close'),
                  //                 //                 ),
                  //                 //               ),
                  //                 //             ],
                  //                 //           ),
                  //                 //         );
                  //                 //       },
                  //                 //     );
                  //                 //   },
                  //                 //   child: Column(
                  //                 //     children: [
                  //                 //       const CircleAvatar(
                  //                 //         radius: 30,
                  //                 //         backgroundImage:
                  //                 //             AssetImage(AppAssets.people),
                  //                 //       ),
                  //                 //       if (data.downlinkRight
                  //                 //               ?.downlinkLeft2nd !=
                  //                 //           null) ...[
                  //                 //         Text(
                  //                 //             data.downlinkRight!.downlinkLeft2nd!.user.name,
                  //                 //             style: const TextStyle(
                  //                 //                 fontSize: 14,
                  //                 //                 color: Colors.white)),
                  //                 //         Text(
                  //                 //             data.downlinkRight!.downlinkLeft2nd!.user.phone,
                  //                 //             style: const TextStyle(
                  //                 //                 fontSize: 14,
                  //                 //                 color: Colors.white)),
                  //                 //         Text(
                  //                 //             data.downlinkRight!.downlinkLeft2nd!.user.email,
                  //                 //             style: const TextStyle(
                  //                 //                 fontSize: 14,
                  //                 //                 color: Colors.white)),
                  //                 //         const SizedBox(height: 20),
                  //                 //       ] else ...[
                  //                 //         ElevatedButton(
                  //                 //           onPressed: () {
                  //                 //             // Add your action for adding a new downlink here.
                  //                 //             print(
                  //                 //                 "Add button clicked for Downlink Left 2nd Level");
                  //                 //             showModalBottomSheet(
                  //                 //               context: context,
                  //                 //               isScrollControlled: true,
                  //                 //               builder: (context) => Padding(
                  //                 //                 padding: EdgeInsets.only(
                  //                 //                     bottom: MediaQuery.of(
                  //                 //                             context)
                  //                 //                         .viewInsets
                  //                 //                         .bottom),
                  //                 //                 child: const JoinForm(),
                  //                 //               ),
                  //                 //             );
                  //                 //           },
                  //                 //           child: const Text('Add +'),
                  //                 //         ),
                  //                 //       ],
                  //                 //     ],
                  //                 //   ),
                  //                 // ),

                  //                 const SizedBox(
                  //                   width: 18,
                  //                 ),

                  //                 // downlink right 2nd

                  //                 // if (data.downlinkRight?.downlinkRight2nd !=
                  //                 //     null) ...[
                  //                 //   const Text(
                  //                 //       'Downlink Right 2nd Level Information',
                  //                 //       style: TextStyle(
                  //                 //           fontSize: 18,
                  //                 //           fontWeight: FontWeight.bold,
                  //                 //           color: Colors.white)),
                  //                 //   Text(
                  //                 //       'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
                  //                 //       style: const TextStyle(
                  //                 //           fontSize: 14,
                  //                 //           color: Colors.white)),
                  //                 //   Text(
                  //                 //       'Phone: ${data.downlinkRight!.downlinkRight2nd!.user.phone}',
                  //                 //       style: const TextStyle(
                  //                 //           fontSize: 14,
                  //                 //           color: Colors.white)),
                  //                 //   Text(
                  //                 //       'Email: ${data.downlinkRight!.downlinkRight2nd!.user.email}',
                  //                 //       style: const TextStyle(
                  //                 //           fontSize: 14,
                  //                 //           color: Colors.white)),
                  //                 //   const SizedBox(height: 20),
                  //                 // ] else ...[
                  //                 //   InkWell(
                  //                 //     onTap: () {
                  //                 //       // Add your action for adding a new downlink here.
                  //                 //       print(
                  //                 //           "Add button clicked for Downlink Right 2nd Level");
                  //                 //       showModalBottomSheet(
                  //                 //         context: context,
                  //                 //         isScrollControlled: true,
                  //                 //         builder: (context) => Padding(
                  //                 //           padding: EdgeInsets.only(
                  //                 //               bottom: MediaQuery.of(context)
                  //                 //                   .viewInsets
                  //                 //                   .bottom),
                  //                 //           child: const JoinForm(),
                  //                 //         ),
                  //                 //       );
                  //                 //     },
                  //                 //     child: Column(
                  //                 //       children: [
                  //                 //         SizedBox(
                  //                 //             height: 40,
                  //                 //             width: 40,
                  //                 //             child: Image.asset(
                  //                 //               AppAssets.addIcon,
                  //                 //               color: Colors.white,
                  //                 //             )),
                  //                 //         const Text(
                  //                 //           'Open',
                  //                 //           style: TextStyle(
                  //                 //               color: Colors.white),
                  //                 //         ),
                  //                 //       ],
                  //                 //     ),
                  //                 //   ),
                  //                 // ],
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  /////=========== home test
                  ///1st gen ====>
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Left Data
                              InkWell(
                                onDoubleTap: () {
                                  setState(() {
                                    isLeftActive = true;
                                    selectedData =
                                        data.downlinkLeft?.downlinkLeft2nd;
                                  });
                                },
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
                                        joiningDate:
                                            data.downlinkLeft!.joiningDate,
                                        lMember: data.downlinkLeft!.lMember,
                                        lCarryPoint:
                                            data.downlinkLeft!.lCarryPoint,
                                        rMember: data.downlinkLeft!.rMember,
                                        rCarryPoint:
                                            data.downlinkLeft!.rCarryPoint,
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppAssets.people),
                                    ),
                                    Text(
                                      data.downlinkLeft?.user?.name ??
                                          "Left User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.downlinkLeft?.user?.phone ??
                                          "Left User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.downlinkLeft?.user?.email ??
                                          "Left User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    if (isLeftActive)
                                      const Icon(
                                        Icons.keyboard_double_arrow_down,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                  ],
                                ),
                              ),

                              // Right Data
                              InkWell(
                                onDoubleTap: () {
                                  setState(() {
                                    isLeftActive = false;
                                    selectedData =
                                        data.downlinkRight?.downlinkRight2nd;
                                  });
                                },
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
                                        lMember: data.downlinkRight!.lMember,
                                        lCarryPoint:
                                            data.downlinkRight!.lCarryPoint,
                                        rMember: data.downlinkRight!.rMember,
                                        rCarryPoint:
                                            data.downlinkRight!.rCarryPoint,
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppAssets.people),
                                    ),
                                    Text(
                                      data.downlinkRight?.user?.name ??
                                          "Right User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.downlinkRight?.user?.phone ??
                                          "Right User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.downlinkRight?.user?.email ??
                                          "Right User",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    if (!isLeftActive)
                                      const Icon(
                                        Icons.keyboard_double_arrow_down,
                                        color: Colors.black,
                                        size: 35,
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

                  const SizedBox(height: 30),

                  // 2nd Generation
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: selectedData != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Left Column in Gen 2
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                              const Divider(
                                                  color: Colors.black),
                                              const SizedBox(height: 10),
                                              const Center(
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      AppAssets.people),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Name: ${data.downlinkLeft!.downlinkLeft2nd!.user.name}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Phone: ${data.downlinkLeft!.downlinkLeft2nd!.user.phone}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Email: ${data.downlinkLeft!.downlinkLeft2nd!.user.email}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Joining Date: ${data.downlinkLeft!.downlinkLeft2nd!.joiningDate}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Left Member: ${data.downlinkLeft!.downlinkLeft2nd!.lMember}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Left Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.lCarryPoint}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Right Member: ${data.downlinkLeft!.downlinkLeft2nd!.rMember}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Right Carry Point: ${data.downlinkLeft!.downlinkLeft2nd!.rCarryPoint}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                'Placement: ${data.downlinkLeft!.downlinkLeft2nd!.placement}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(height: 20),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close the modal sheet
                                                  },
                                                  child: const Text('Close'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                    ////===>
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            AssetImage(AppAssets.people),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        selectedData?.user?.name ?? "No Name",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        selectedData?.user?.phone ?? "No Phone",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        selectedData?.user?.email ?? "No Email",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Right Column in Gen 2
                                if (selectedData ==
                                    data.downlinkRight?.downlinkRight2nd)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Downlink Right 2nd Level Information',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  )
                                else
                                  InkWell(
                                    onTap: () {
                                      print(
                                          "Add button clicked for Downlink Right 2nd Level");
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) => Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          : const Center(
                              child: Text(
                                "No Data Available",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBottomSheetContent({
    required String name,
    required String phone,
    required String email,
    required String joiningDate,
    required int lMember,
    required int lCarryPoint,
    required int rMember,
    required int rCarryPoint,
  }) {
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
          //Text('Joining Date: $joiningDate', style: const TextStyle(fontSize: 16)),
          Text('Left Member: $lMember', style: const TextStyle(fontSize: 16)),
          Text('Left Carry Point: $lCarryPoint',
              style: const TextStyle(fontSize: 16)),
          Text('Right Member: $rMember', style: const TextStyle(fontSize: 16)),
          Text('Right Carry Point: $rCarryPoint',
              style: const TextStyle(fontSize: 16)),
          //Text('Placement: $placement', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:fcb_global/utils/app_assets.dart';
// import 'package:fcb_global/utils/app_colors.dart';
// import 'package:fcb_global/view/team/member_switch.dart';

// import 'package:fcb_global/view/team/tree_view/tree_view_controller.dart';
// import 'package:fcb_global/widget/add_member_form.dart';
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
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 10),

                  // InkWell(
                  //   //root main user
                  //   onDoubleTap: () {},
                  //   onTap: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   backgroundColor: Colors.white,
                      //   shape: const RoundedRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.vertical(top: Radius.circular(20)),
                      //   ),
                      //   builder: (BuildContext context) {
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
                      //               backgroundImage:
                      //                   AssetImage(AppAssets.appLogo),
                      //             ),
                      //           ),
                      //           const SizedBox(
                      //             height: 10,
                      //           ),
                      //           Text(
                      //             'Name: ${data.user.name}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Phone: ${data.user.phone}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Email: ${data.user.email}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Joining Date: ${data.joiningDate}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Left Member: ${data.lMember}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Left Carry Point: ${data.lCarryPoint}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Right Member: ${data.rMember}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Right Carry Point: ${data.rCarryPoint}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           Text(
                      //             'Placement: ${data.placement}',
                      //             style: const TextStyle(
                      //                 fontSize: 16, color: Colors.black),
                      //           ),
                      //           const SizedBox(height: 20),
                      //           Center(
                      //             child: ElevatedButton(
                      //               onPressed: () {
                      //                 Navigator.pop(
                      //                     context); // Close the modal sheet
                      //               },
                      //               child: const Text('Close'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                   // },
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Column(
//                             children: [
//                               const CircleAvatar(
//                                 radius: 30,
//                                 backgroundImage: AssetImage(AppAssets.appLogo),
//                               ),
//                               Text(data.user.name,
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold)),
//                               Text(data.user.phone,
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               Text(data.user.email,
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               Text('Ref Name: ${data.referBy.name}',
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.white)),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(' ${data.lMember}',
//                                       style: const TextStyle(
//                                           fontSize: 14, color: Colors.white)),
//                                   const Text(
//                                     ' || ',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 16),
//                                   ),
//                                   Text('${data.rMember}',
//                                       style: const TextStyle(
//                                           fontSize: 14, color: Colors.white)),
//                                 ],
//                               ),
//                               const SizedBox(height: 20),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 10,
//                   ),

//                   //gen - 1
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
//                               // Left Data
//                               InkWell(
//                                 onDoubleTap: () {
//                                   setState(() {
//                                     isLeftActive = true;
//                                     selectedData =
//                                         data.downlinkLeft?.downlinkLeft2nd;
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
//                                     const CircleAvatar(
//                                       radius: 30,
//                                       backgroundImage:
//                                           AssetImage('assets/app_logo.png'),
//                                     ),
//                                     Text(
//                                       data.downlinkLeft?.user?.name ??
//                                           "Left User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       data.downlinkLeft?.user?.phone ??
//                                           "Left User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                      Text(
//                                       data.downlinkLeft?.user?.email ??
//                                           "Left User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     if (isLeftActive)
//                                       const Icon(
//                                         Icons.keyboard_double_arrow_down,
//                                         color: Colors.black,
//                                         size: 35,
//                                       ),
//                                   ],
//                                 ),
//                               ),

//                               // Right Data
//                               InkWell(
//                                 onDoubleTap: () {
//                                   setState(() {
//                                     isLeftActive = false;
//                                     selectedData =
//                                         data.downlinkRight?.downlinkRight2nd;
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
//                                     const CircleAvatar(
//                                       radius: 30,
//                                       backgroundImage:
//                                           AssetImage('assets/app_logo.png'),
//                                     ),
//                                     Text(
//                                       data.downlinkRight?.user?.name ??
//                                           "Right User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       data.downlinkRight?.user?.phone ??
//                                           "Right User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       data.downlinkRight?.user?.email ??
//                                           "Right User",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     if (!isLeftActive)
//                                       const Icon(
//                                         Icons.keyboard_double_arrow_down,
//                                         color: Colors.black,
//                                         size: 35,
//                                       ),
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
//                       child: selectedData != null
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // Left Column in Gen 2
//                                 InkWell(
//                                     onTap: () {
//                                     // Show left modal bottom sheet
//                                     showModalBottomSheet(
//                                       context: context,
//                                       backgroundColor: Colors.white,
//                                       shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.vertical(
//                                             top: Radius.circular(20)),
//                                       ),
//                                       builder: (BuildContext context) {
//                                         return _buildBottomSheetContent(
//                                           name: selectedData?.user?.name,
//                                           phone: selectedData?.user?.phone,
//                                           email: selectedData?.user?.email,
//                                           joiningDate:
//                                               selectedData?.user?.joiningDate,
//                                           lMember: selectedData?.user?.lMember,
//                                           lCarryPoint:
//                                               selectedData?.user?.lCarryPoint,
//                                           rMember: selectedData?.user?.rMember,
//                                           rCarryPoint:
//                                               selectedData?.user?.rCarryPoint,
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       const CircleAvatar(
//                                         radius: 30,
//                                         backgroundImage:
//                                             AssetImage('assets/app_logo.png'),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Text(
//                                         selectedData?.user?.name ?? "No Name",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Text(
//                                         selectedData?.user?.phone ?? "No Phone",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Text(
//                                         selectedData?.user?.email ?? "No Email",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 // Right Column in Gen 2
//                                 if (selectedData ==
//                                     data.downlinkRight?.downlinkRight2nd)
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Text(
//                                         'Downlink Right 2nd Level Information',
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 20),
//                                     ],
//                                   )
//                                 else
//                                   InkWell(
//                                     onTap: () {
//                                       print(
//                                           "Add button clicked for Downlink Right 2nd Level");
//                                     },
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                           height: 40,
//                                           width: 40,
//                                           child: Image.asset(
//                                             AppAssets.appLogo,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 5),
//                                         const Text(
//                                           'Open',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                               ],
//                             )
//                           : const Center(
//                               child: Text(
//                                 "No Data Available",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               ),
//                             ),
//                     ),
//                   ),

//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(height: 20),
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
//               backgroundImage: AssetImage(AppAssets.appLogo),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text('Name: $name', style: const TextStyle(fontSize: 16)),
//           Text('Phone: $phone', style: const TextStyle(fontSize: 16)),
//           Text('Email: $email', style: const TextStyle(fontSize: 16)),
//           Text('Joining Date: $joiningDate',
//               style: const TextStyle(fontSize: 16)),
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
