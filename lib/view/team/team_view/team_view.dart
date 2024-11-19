import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/team/member_switch.dart';
import 'package:fcb_global/view/team/team_controller/team_controller.dart';
import 'package:fcb_global/view/team/team_model/team_model.dart';
import 'package:fcb_global/widget/add_member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeView extends StatelessWidget {
  final TreeController controller = Get.put(TreeController());

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
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Center(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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

                  const SizedBox(
                    height: 10,
                  ),

                  ///=== first genaration,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                //show left data
                                onDoubleTap: () {},
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
                                            const Divider(color: Colors.black),
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
                                              'Name: ${data.downlinkLeft!.user.name}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Phone: ${data.downlinkLeft!.user.phone}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Email: ${data.downlinkLeft!.user.email}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Joining Date: ${data.downlinkLeft!.joiningDate}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Left Member: ${data.downlinkLeft!.lMember}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Left Carry Point: ${data.downlinkLeft!.lCarryPoint}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Right Member: ${data.downlinkLeft!.rMember}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Right Carry Point: ${data.downlinkLeft!.rCarryPoint}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Placement: ${data.downlinkLeft!.placement}',
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
                                },
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppAssets.people),
                                    ),

                                    Text(
                                      data.downlinkLeft!.user.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.downlinkLeft!.user.phone,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    Text(
                                      data.downlinkLeft!.user.email,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    //icon
                                    const Icon(
                                      Icons.keyboard_double_arrow_down,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ],
                                ),
                              ),

                              //right
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: InkWell(
                                    //show right data
                                    onDoubleTap: () {},
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  'Name: ${data.downlinkRight!.user.name}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Phone: ${data.downlinkRight!.user.phone}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Email: ${data.downlinkRight!.user.email}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Joining Date: ${data.downlinkRight!.joiningDate}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Left Member: ${data.downlinkRight!.lMember}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Left Carry Point: ${data.downlinkRight!.lCarryPoint}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Right Member: ${data.downlinkRight!.rMember}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Right Carry Point: ${data.downlinkRight!.rCarryPoint}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  'Placement: ${data.downlinkRight!.placement}',
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
                                    },
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              AssetImage(AppAssets.people),
                                        ),

                                        Text(data.downlinkRight!.user.name,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        Text(data.downlinkRight!.user.phone,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        Text(data.downlinkRight!.user.email,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),

                                        ///=== icons
                                        const SizedBox(
                                          height: 35,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  ////====> 2nd genaration ==>
                  //downlink left 2nd // G-2
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //downlink left 2nd
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                    },
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              AssetImage(AppAssets.people),
                                        ),
                                        if (data.downlinkLeft
                                                ?.downlinkLeft2nd !=
                                            null) ...[
                                          Text(
                                              '${data.downlinkLeft!.downlinkLeft2nd!.user.name}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          Text(
                                              '${data.downlinkLeft!.downlinkLeft2nd!.user.phone}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          Text(
                                              '${data.downlinkLeft!.downlinkLeft2nd!.user.email}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          const SizedBox(height: 20),
                                        ] else ...[
                                          ElevatedButton(
                                            onPressed: () {
                                              // Add your action for adding a new downlink here.
                                              print(
                                                  "Add button clicked for Downlink Left 2nd Level");
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
                                            child: const Text('Add +'),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 120,
                                  ),

                                  //2nd Downlink right

                                  if (data.downlinkRight?.downlinkRight2nd !=
                                      null) ...[
                                    const Text(
                                        'Downlink Right 2nd Level Information',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(
                                        'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                    Text(
                                        'Phone: ${data.downlinkRight!.downlinkRight2nd!.user.phone}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                    Text(
                                        'Email: ${data.downlinkRight!.downlinkRight2nd!.user.email}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                    const SizedBox(height: 20),
                                  ] else ...[
                                    InkWell(
                                      onTap: () {
                                        // Add your action for adding a new downlink here.
                                        print(
                                            "Add button clicked for Downlink Right 2nd Level");
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
                                              )),
                                          const Text(
                                            'Open',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],

                                  const SizedBox(
                                    width: 18,
                                  ),

                                  //downlink - left - 2nd // 2
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
                                  //           padding:
                                  //               const EdgeInsets.all(16.0),
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
                                  //                   backgroundImage:
                                  //                       AssetImage(
                                  //                           AppAssets.people),
                                  //                 ),
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 10,
                                  //               ),
                                  //               Text(
                                  //                 'Name: ${data.downlinkRight!.downlinkLeft2nd!.user.name}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Phone: ${data.downlinkRight!.downlinkLeft2nd!.user.phone}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Email: ${data.downlinkRight!.downlinkLeft2nd!.user.email}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Joining Date: ${data.downlinkRight!.downlinkLeft2nd!.joiningDate}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Left Member: ${data.downlinkRight!.downlinkLeft2nd!.lMember}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Left Carry Point: ${data.downlinkRight!.downlinkLeft2nd!.lCarryPoint}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Right Member: ${data.downlinkRight!.downlinkLeft2nd!.rMember}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Right Carry Point: ${data.downlinkRight!.downlinkLeft2nd!.rCarryPoint}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),
                                  //               Text(
                                  //                 'Placement: ${data.downlinkRight!.downlinkLeft2nd!.placement}',
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.black),
                                  //               ),

                                  //               //

                                  //               const SizedBox(height: 20),
                                  //               Center(
                                  //                 child: ElevatedButton(
                                  //                   onPressed: () {
                                  //                     Navigator.pop(
                                  //                         context); // Close the modal sheet
                                  //                   },
                                  //                   child:
                                  //                       const Text('Close'),
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   },
                                  //   child: Column(
                                  //     children: [
                                  //       const CircleAvatar(
                                  //         radius: 30,
                                  //         backgroundImage:
                                  //             AssetImage(AppAssets.people),
                                  //       ),
                                  //       if (data.downlinkRight
                                  //               ?.downlinkLeft2nd !=
                                  //           null) ...[
                                  //         Text(
                                  //             data.downlinkRight!.downlinkLeft2nd!.user.name,
                                  //             style: const TextStyle(
                                  //                 fontSize: 14,
                                  //                 color: Colors.white)),
                                  //         Text(
                                  //             data.downlinkRight!.downlinkLeft2nd!.user.phone,
                                  //             style: const TextStyle(
                                  //                 fontSize: 14,
                                  //                 color: Colors.white)),
                                  //         Text(
                                  //             data.downlinkRight!.downlinkLeft2nd!.user.email,
                                  //             style: const TextStyle(
                                  //                 fontSize: 14,
                                  //                 color: Colors.white)),
                                  //         const SizedBox(height: 20),
                                  //       ] else ...[
                                  //         ElevatedButton(
                                  //           onPressed: () {
                                  //             // Add your action for adding a new downlink here.
                                  //             print(
                                  //                 "Add button clicked for Downlink Left 2nd Level");
                                  //             showModalBottomSheet(
                                  //               context: context,
                                  //               isScrollControlled: true,
                                  //               builder: (context) => Padding(
                                  //                 padding: EdgeInsets.only(
                                  //                     bottom: MediaQuery.of(
                                  //                             context)
                                  //                         .viewInsets
                                  //                         .bottom),
                                  //                 child: const JoinForm(),
                                  //               ),
                                  //             );
                                  //           },
                                  //           child: const Text('Add +'),
                                  //         ),
                                  //       ],
                                  //     ],
                                  //   ),
                                  // ),

                                  const SizedBox(
                                    width: 18,
                                  ),

                                  // downlink right 2nd

                                  // if (data.downlinkRight?.downlinkRight2nd !=
                                  //     null) ...[
                                  //   const Text(
                                  //       'Downlink Right 2nd Level Information',
                                  //       style: TextStyle(
                                  //           fontSize: 18,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.white)),
                                  //   Text(
                                  //       'Name: ${data.downlinkRight!.downlinkRight2nd!.user.name}',
                                  //       style: const TextStyle(
                                  //           fontSize: 14,
                                  //           color: Colors.white)),
                                  //   Text(
                                  //       'Phone: ${data.downlinkRight!.downlinkRight2nd!.user.phone}',
                                  //       style: const TextStyle(
                                  //           fontSize: 14,
                                  //           color: Colors.white)),
                                  //   Text(
                                  //       'Email: ${data.downlinkRight!.downlinkRight2nd!.user.email}',
                                  //       style: const TextStyle(
                                  //           fontSize: 14,
                                  //           color: Colors.white)),
                                  //   const SizedBox(height: 20),
                                  // ] else ...[
                                  //   InkWell(
                                  //     onTap: () {
                                  //       // Add your action for adding a new downlink here.
                                  //       print(
                                  //           "Add button clicked for Downlink Right 2nd Level");
                                  //       showModalBottomSheet(
                                  //         context: context,
                                  //         isScrollControlled: true,
                                  //         builder: (context) => Padding(
                                  //           padding: EdgeInsets.only(
                                  //               bottom: MediaQuery.of(context)
                                  //                   .viewInsets
                                  //                   .bottom),
                                  //           child: const JoinForm(),
                                  //         ),
                                  //       );
                                  //     },
                                  //     child: Column(
                                  //       children: [
                                  //         SizedBox(
                                  //             height: 40,
                                  //             width: 40,
                                  //             child: Image.asset(
                                  //               AppAssets.addIcon,
                                  //               color: Colors.white,
                                  //             )),
                                  //         const Text(
                                  //           'Open',
                                  //           style: TextStyle(
                                  //               color: Colors.white),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ],
                                ],
                              ),
                            ],
                          ),
                        ],
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
}
