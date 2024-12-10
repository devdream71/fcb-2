/////===>
///
///Working====>

import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/team/team_controller/team_controller.dart';
import 'package:fcb_global/view/join/add_member_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeView extends StatefulWidget {
  const TreeView({super.key});

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
                            return DetailsBottomSheet(
                              title: 'Details',
                              //imagePath: AppAssets.people,
                              title2: data.user.name,
                              lMember: data.lMember,
                              rMember: data.rMember,
                              phone: data.user.phone,

                              email: data.user.email,
                              joiningDate: data.joiningDate,
                              lCarryPoint: data.lCarryPoint,
                              rCarryPoint: data.rCarryPoint,
                              placement: data.placement,
                              onClose: () {
                                Navigator.pop(context);
                              },
                              onStepDown: () {
                                var treeID = data.uplink;
                                setState(() {});
                                controller.fetchTreeData(treeID!.toInt());
                                //Get.snackbar("Step down", "");
                                Navigator.pop(context);
                              },
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
                                            var id =
                                                data.downlinkLeft!.user.treeId;
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
                                              print(data.uplink);
                                              print(data.placement);
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: JoinForm(
                                                    placement: data.placement,
                                                    uplink: data.uplink,
                                                  ),
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
                                              var id = data
                                                  .downlinkRight!.user.treeId;
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
                                              //get upline
                                              print(data.uplink);

                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: JoinForm(
                                                    placement: data.placement,
                                                    uplink: data.uplink,
                                                  ),
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
                      child:
                          data.downlinkLeft != null ||
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
                                              null || data.downlinkLeft?.downlinkRight2nd?.user
                                                  ?.name !=
                                              null
                                          ? SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                                    .downlinkLeft2nd!
                                                                    .placement,
                                                                lMember: data
                                                                    .downlinkLeft!
                                                                    .downlinkLeft2nd!
                                                                    .lMember,
                                                                lCarryPoint: data
                                                                    .downlinkLeft!
                                                                    .downlinkLeft2nd!
                                                                    .lCarryPoint,
                                                                rMember: data
                                                                    .downlinkLeft!
                                                                    .downlinkLeft2nd!
                                                                    .rMember,
                                                                rCarryPoint: data
                                                                    .downlinkLeft!
                                                                    .downlinkLeft2nd!
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
                                                                        .treeId;
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
                                                    child:
                                                        //working ==>
                                                        //data.downlinkLeft ?.downlinkLeft2nd ?.user?.name != null  ?  

                                                         data.downlinkLeft ?.downlinkLeft2nd ?.user?.name != null  ?  

                                                         

                                                            Column(
                                                                children: [
                                                                  const CircleAvatar(
                                                                    radius: 25,
                                                                    backgroundImage:
                                                                        AssetImage(
                                                                            AppAssets.people),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          10),
                                                                  Text(
                                                                    data
                                                                        .downlinkLeft!
                                                                        .downlinkLeft2nd!
                                                                        .user!
                                                                        .name,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .white,
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
                                                                    context:
                                                                        context,
                                                                    isScrollControlled:
                                                                        true,
                                                                    builder:
                                                                        (context) =>
                                                                            Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: MediaQuery.of(context)
                                                                              .viewInsets
                                                                              .bottom),
                                                                      child:
                                                                          JoinForm(
                                                                        placement:
                                                                            data.placement,
                                                                        uplink:
                                                                            data.uplink,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          40,
                                                                      width: 40,
                                                                      child: Image
                                                                          .asset(
                                                                        AppAssets
                                                                            .addIcon,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    const Text(
                                                                      'Open',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
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
                                                                    .downlinkRight2nd!
                                                                    .placement,
                                                                lMember: data
                                                                    .downlinkLeft!
                                                                    .downlinkRight2nd!
                                                                    .lMember,
                                                                lCarryPoint: data
                                                                    .downlinkLeft!
                                                                    .downlinkRight2nd!
                                                                    .lCarryPoint,
                                                                rMember: data
                                                                    .downlinkLeft!
                                                                    .downlinkRight2nd!
                                                                    .rMember,
                                                                rCarryPoint: data
                                                                    .downlinkLeft!
                                                                    .downlinkRight2nd!
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
                                                                        .treeId;
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
                                                                  color: Colors
                                                                      .white,
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
                                                                context:
                                                                    context,
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
                                                                      JoinForm(
                                                                    placement: data
                                                                        .placement,
                                                                    uplink: data
                                                                        .uplink,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 40,
                                                                  width: 40,
                                                                  child: Image
                                                                      .asset(
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
                                                                    .downlinkLeft2nd!
                                                                    .placement,
                                                                lMember: data
                                                                    .downlinkRight!
                                                                    .downlinkLeft2nd!
                                                                    .lMember,
                                                                lCarryPoint: data
                                                                    .downlinkRight!
                                                                    .downlinkLeft2nd!
                                                                    .lCarryPoint,
                                                                rMember: data
                                                                    .downlinkRight!
                                                                    .downlinkLeft2nd!
                                                                    .rMember,
                                                                rCarryPoint: data
                                                                    .downlinkRight!
                                                                    .downlinkLeft2nd!
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
                                                                        .downlinkLeft2nd!
                                                                        .user
                                                                        .treeId;
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
                                                    child:
                                                        // data.downlinkRight !=
                                                        //             null &&
                                                        //         data.downlinkRight!
                                                        //                 .downlinkLeft2nd !=
                                                        //             null
                                                        //     ? Column(
                                                        //         children: [
                                                        //           const CircleAvatar(
                                                        //             radius: 25,
                                                        //             backgroundImage:
                                                        //                 AssetImage(
                                                        //                     AppAssets
                                                        //                         .people),
                                                        //           ),
                                                        //           const SizedBox(
                                                        //               height: 10),
                                                        //           Text(
                                                        //             data
                                                        //                 .downlinkRight!
                                                        //                 .downlinkLeft2nd!
                                                        //                 .user!
                                                        //                 .name,
                                                        //             style:
                                                        //                 const TextStyle(
                                                        //               fontSize: 14,
                                                        //               color:
                                                        //                   Colors.white,
                                                        //               fontWeight:
                                                        //                   FontWeight
                                                        //                       .bold,
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )
                                                        //     : InkWell(
                                                        //         onTap: () {
                                                        //           showModalBottomSheet(
                                                        //             context: context,
                                                        //             isScrollControlled:
                                                        //                 true,
                                                        //             builder:
                                                        //                 (context) =>
                                                        //                     Padding(
                                                        //               padding: EdgeInsets.only(
                                                        //                   bottom: MediaQuery.of(
                                                        //                           context)
                                                        //                       .viewInsets
                                                        //                       .bottom),
                                                        //               child:
                                                        //                     JoinForm(
                                                        //                        placement: data.placement,
                                                        //     uplink: data.uplink,
                                                        //                     ),
                                                        //             ),
                                                        //           );
                                                        //         },
                                                        //         child: Column(
                                                        //           children: [
                                                        //             SizedBox(
                                                        //               height: 40,
                                                        //               width: 40,
                                                        //               child:
                                                        //                   Image.asset(
                                                        //                 AppAssets
                                                        //                     .addIcon,
                                                        //                 color: Colors
                                                        //                     .white,
                                                        //               ),
                                                        //             ),
                                                        //             const SizedBox(
                                                        //                 height: 5),
                                                        //             const Text(
                                                        //               'Open',
                                                        //               style: TextStyle(
                                                        //                   color: Colors
                                                        //                       .white),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       ),

                                                        data.downlinkRight?.user
                                                                    ?.name !=
                                                                null
                                                            ? (data.downlinkRight !=
                                                                        null &&
                                                                    data.downlinkRight!
                                                                            .downlinkLeft2nd !=
                                                                        null
                                                                ? Column(
                                                                    children: [
                                                                      const CircleAvatar(
                                                                        radius:
                                                                            25,
                                                                        backgroundImage:
                                                                            AssetImage(AppAssets.people),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        data
                                                                            .downlinkRight!
                                                                            .downlinkLeft2nd!
                                                                            .user!
                                                                            .name,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : InkWell(
                                                                    onTap: () {
                                                                      showModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding:
                                                                              EdgeInsets.only(
                                                                            bottom:
                                                                                MediaQuery.of(context).viewInsets.bottom,
                                                                          ),
                                                                          child:
                                                                              JoinForm(
                                                                            placement:
                                                                                data.placement,
                                                                            uplink:
                                                                                data.uplink,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              40,
                                                                          width:
                                                                              40,
                                                                          child:
                                                                              Image.asset(
                                                                            AppAssets.addIcon,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                5),
                                                                        const Text(
                                                                          'Open',
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ))
                                                            : const SizedBox
                                                                .shrink(),
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
                                                                  .downlinkRight2nd!
                                                                  .placement,
                                                              lMember: data
                                                                  .downlinkRight!
                                                                  .downlinkRight2nd!
                                                                  .lMember,
                                                              lCarryPoint: data
                                                                  .downlinkRight!
                                                                  .downlinkRight2nd!
                                                                  .lCarryPoint,
                                                              rMember: data
                                                                  .downlinkRight!
                                                                  .downlinkRight2nd!
                                                                  .rMember,
                                                              rCarryPoint: data
                                                                  .downlinkRight!
                                                                  .downlinkRight2nd!
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
                                                                      .treeId;
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
                                                    child:
                                                        // data.downlinkRight !=
                                                        //             null &&
                                                        //         data.downlinkRight!
                                                        //                 .downlinkRight2nd !=
                                                        //             null
                                                        //     ? Column(
                                                        //         children: [
                                                        //           const CircleAvatar(
                                                        //             radius: 25,
                                                        //             backgroundImage:
                                                        //                 AssetImage(
                                                        //                     AppAssets
                                                        //                         .people),
                                                        //           ),
                                                        //           const SizedBox(
                                                        //               height: 10),
                                                        //           Text(
                                                        //             data
                                                        //                 .downlinkRight!
                                                        //                 .downlinkRight2nd!
                                                        //                 .user!
                                                        //                 .name,
                                                        //             style:
                                                        //                 const TextStyle(
                                                        //               fontSize: 14,
                                                        //               color:
                                                        //                   Colors.white,
                                                        //               fontWeight:
                                                        //                   FontWeight
                                                        //                       .bold,
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )
                                                        //     : InkWell(
                                                        //         onTap: () {
                                                        //           showModalBottomSheet(
                                                        //             context: context,
                                                        //             isScrollControlled:
                                                        //                 true,
                                                        //             builder:
                                                        //                 (context) =>
                                                        //                     Padding(
                                                        //               padding: EdgeInsets.only(
                                                        //                   bottom: MediaQuery.of(
                                                        //                           context)
                                                        //                       .viewInsets
                                                        //                       .bottom),
                                                        //               child: JoinForm(
                                                        //                 placement: data
                                                        //                     .placement,
                                                        //                 uplink:
                                                        //                     data.uplink,
                                                        //               ),
                                                        //             ),
                                                        //           );
                                                        //         },
                                                        //         child: Column(
                                                        //           children: [
                                                        //             SizedBox(
                                                        //               height: 40,
                                                        //               width: 40,
                                                        //               child:
                                                        //                   Image.asset(
                                                        //                 AppAssets
                                                        //                     .addIcon,
                                                        //                 color: Colors
                                                        //                     .white,
                                                        //               ),
                                                        //             ),
                                                        //             const SizedBox(
                                                        //                 height: 5),
                                                        //             const Text(
                                                        //               'Open',
                                                        //               style: TextStyle(
                                                        //                   color: Colors
                                                        //                       .white),
                                                        //             ),
                                                        //           ],
                                                        //         ),
                                                        //       ),

                                                        data.downlinkRight?.user
                                                                    ?.name !=
                                                                null
                                                            ? (data.downlinkRight !=
                                                                        null &&
                                                                    data.downlinkRight!
                                                                            .downlinkRight2nd !=
                                                                        null
                                                                ? Column(
                                                                    children: [
                                                                      const CircleAvatar(
                                                                        radius:
                                                                            25,
                                                                        backgroundImage:
                                                                            AssetImage(AppAssets.people),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10),
                                                                      Text(
                                                                        data
                                                                            .downlinkRight!
                                                                            .downlinkRight2nd!
                                                                            .user!
                                                                            .name,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : InkWell(
                                                                    onTap: () {
                                                                      showModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        isScrollControlled:
                                                                            true,
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding:
                                                                              EdgeInsets.only(
                                                                            bottom:
                                                                                MediaQuery.of(context).viewInsets.bottom,
                                                                          ),
                                                                          child:
                                                                              JoinForm(
                                                                            placement:
                                                                                data.placement,
                                                                            uplink:
                                                                                data.uplink,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              40,
                                                                          width:
                                                                              40,
                                                                          child:
                                                                              Image.asset(
                                                                            AppAssets.addIcon,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                5),
                                                                        const Text(
                                                                          'Open',
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ))
                                                            : const SizedBox
                                                                .shrink(), // Show SizedBox if `user?.name` is null
                                                  ),
                                                ],
                                              ),
                                            )
                                          :
                                          // InkWell(
                                          //     onTap: () {
                                          //       showModalBottomSheet(
                                          //         context: context,
                                          //         isScrollControlled: true,
                                          //         builder: (context) => Padding(
                                          //           padding: EdgeInsets.only(
                                          //             bottom: MediaQuery.of(context)
                                          //                 .viewInsets
                                          //                 .bottom,
                                          //           ),
                                          //           child: JoinForm(
                                          //             placement: data.placement,
                                          //             uplink: data.uplink,
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //     child: Column(
                                          //       children: [
                                          //         SizedBox(
                                          //           height: 40,
                                          //           width: 40,
                                          //           child: Image.asset(
                                          //             AppAssets.addIcon,
                                          //             color: Colors.white,
                                          //           ),
                                          //         ),
                                          //         const SizedBox(height: 5),
                                          //         const Text(
                                          //           'Open fghfghfg',
                                          //           style: TextStyle(
                                          //               color: Colors.white),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          const SizedBox()
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

  ///bottom model for Gen1 and Gen2
  Widget _buildBottomSheetContent({
    required String name,
    required String phone,
    required String email,
    required int placement,
    required String joiningDate,
    required int lMember,
    required int lCarryPoint,
    required int rMember,
    required int rCarryPoint,
    required void Function()? onPressed,
  }) {
    Widget _buildRow(String label, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5, top: 5),
      child: SingleChildScrollView(
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
            const SizedBox(height: 5),
            const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppAssets.people),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$lMember || $rMember ',
                    style: const TextStyle(fontSize: 16))
              ],
            ),
            const SizedBox(height: 5),
            _buildRow('Name:', name),
            _buildRow('Phone:', phone),
            _buildRow('Email:', email),
            _buildRow('Joining Date:', joiningDate),
            _buildRow('Placement:', placement.toString()),
            _buildRow('Left Member:', lMember.toString()),
            _buildRow('Left Carry Point:', lCarryPoint.toString()),
            _buildRow('Right Member:', rMember.toString()),
            _buildRow('Right Carry Point:', rCarryPoint.toString()),
            const SizedBox(height: 8),
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
      ),
    );
  }
}

///bottom Model for Root user.
class DetailsBottomSheet extends StatelessWidget {
  final String title;
  final String title2;
  final int lMember;
  final int rMember;
  final String phone;
  final String email;
  final String joiningDate;
  final int lCarryPoint;
  final int rCarryPoint;
  final int placement;
  final void Function()? onClose;
  final void Function()? onStepDown;

  const DetailsBottomSheet({
    Key? key,
    required this.title,
    required this.title2,
    required this.lMember,
    required this.rMember,
    required this.phone,
    required this.email,
    required this.joiningDate,
    required this.lCarryPoint,
    required this.rCarryPoint,
    required this.placement,
    this.onClose,
    this.onStepDown,
  }) : super(key: key);

  Widget _buildCustomRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(color: Colors.black),
          const SizedBox(height: 5),
          const Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppAssets.people),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              '$lMember || $rMember',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          _buildCustomRow('Name:', title2),
          _buildCustomRow('Phone:', phone),
          _buildCustomRow('Email:', email),
          _buildCustomRow('Joining Date:', joiningDate),
          _buildCustomRow('Left Member:', lMember.toString()),
          _buildCustomRow('Left Carry Point:', lCarryPoint.toString()),
          _buildCustomRow('Right Member:', rMember.toString()),
          _buildCustomRow('Right Carry Point:', rCarryPoint.toString()),
          _buildCustomRow('Placement:', placement.toString()),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: onClose,
                icon: const Icon(Icons.close, color: Colors.red),
                label: const Text('Close'),
              ),
              ElevatedButton.icon(
                onPressed: onStepDown,
                icon: const Icon(Icons.arrow_downward, color: Colors.blue),
                label: const Text('Step Down'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}














// /////===>
// ///
// ///Working====>

// import 'package:fcb_global/utils/app_assets.dart';
// import 'package:fcb_global/utils/app_colors.dart';
// import 'package:fcb_global/view/team/team_controller/team_controller.dart';
// import 'package:fcb_global/view/join/add_member_form.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TreeView extends StatefulWidget {
//   const TreeView({super.key});

//   @override
//   State<TreeView> createState() => _TreeViewState();
// }

// class _TreeViewState extends State<TreeView> {
//   final TreeController controller = Get.put(TreeController());

//   bool isLeftActive = true;

//   bool isRightActive = true;

//   var selectedData;
//   var rightSelectedData;

//   var leftSelectedDateG2;
//   var rightSelecteddateG2;

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
//                             return DetailsBottomSheet(
//                               title: 'Details',
//                               //imagePath: AppAssets.people,
//                               title2: data.user.name,
//                               lMember: data.lMember,
//                               rMember: data.rMember,
//                               phone: data.user.phone,

//                               email: data.user.email,
//                               joiningDate: data.joiningDate,
//                               lCarryPoint: data.lCarryPoint,
//                               rCarryPoint: data.rCarryPoint,
//                               placement: data.placement,
//                               onClose: () {
//                                 Navigator.pop(context);
//                               },
//                               onStepDown: () {
//                                 var treeID = data.uplink;
//                                 setState(() {});
//                                 controller.fetchTreeData(treeID!.toInt());
//                                 //Get.snackbar("Step down", "");
//                                 Navigator.pop(context);
//                               },
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
//                       //color: Colors.blue.withOpacity(0.9),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 2, horizontal: 5),
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               //Left Data // gen 1
//                               InkWell(
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
//                                         onPressed: () {
//                                           setState(() {
//                                             isLeftActive = true;

//                                             selectedData = data
//                                                 .downlinkLeft?.downlinkLeft2nd;
//                                             var id =
//                                                 data.downlinkLeft!.user.treeId;
//                                             print(id);
//                                             controller
//                                                 .fetchTreeData(id!.toInt());
//                                             Navigator.pop(context);
//                                           });
//                                         },
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
//                                             ],
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               print(data.uplink);
//                                               print(data.placement);
//                                               showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 builder: (context) => Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom:
//                                                           MediaQuery.of(context)
//                                                               .viewInsets
//                                                               .bottom),
//                                                   child: JoinForm(
//                                                     placement: data.placement,
//                                                     uplink: data.uplink,
//                                                   ),
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
//                                           name: data.downlinkRight!.user.name,
//                                           phone: data.downlinkRight!.user.phone,
//                                           email: data.downlinkRight!.user.email,
//                                           joiningDate:
//                                               data.downlinkRight!.joiningDate,
//                                           placement:
//                                               data.downlinkRight!.placement,
//                                           lMember: data.downlinkRight!.lMember,
//                                           lCarryPoint:
//                                               data.downlinkRight!.lCarryPoint,
//                                           rMember: data.downlinkRight!.rMember,
//                                           rCarryPoint:
//                                               data.downlinkRight!.rCarryPoint,
//                                           onPressed: () {
//                                             setState(() {
//                                               isLeftActive = false;
//                                               rightSelectedData = data
//                                                   .downlinkRight
//                                                   ?.downlinkRight2nd;
//                                               var id = data
//                                                   .downlinkRight!.user.treeId;
//                                               print(id);
//                                               controller
//                                                   .fetchTreeData(id!.toInt());
//                                               Navigator.pop(context);
//                                             });
//                                           });
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
//                                             ],
//                                           )
//                                         : InkWell(
//                                             onTap: () {
//                                               //get upline
//                                               print(data.uplink);

//                                               showModalBottomSheet(
//                                                 context: context,
//                                                 isScrollControlled: true,
//                                                 builder: (context) => Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom:
//                                                           MediaQuery.of(context)
//                                                               .viewInsets
//                                                               .bottom),
//                                                   child: JoinForm(
//                                                     placement: data.placement,
//                                                     uplink: data.uplink,
//                                                   ),
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

//                   const SizedBox(height: 5),

//                   ///2nd gen 2  ===> container
//                   Container(
//                     //height: 180,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       //color: Colors.blueGrey,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 5),
//                       child: data.downlinkLeft != null ||
//                               data.downlinkRight != null
//                           ? Container(
//                               decoration: BoxDecoration(
//                                   //color: Colors.teal,
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   data.downlinkLeft?.downlinkLeft2nd?.user
//                                               ?.name !=
//                                           null
//                                       ? SingleChildScrollView(
//                                           scrollDirection: Axis.horizontal,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               //gen 2 //downlinkLeft!.downlinkLeft2nd!

//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       context: context,
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       shape:
//                                                           const RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.vertical(
//                                                                 top: Radius
//                                                                     .circular(
//                                                                         20)),
//                                                       ),
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return _buildBottomSheetContent(
//                                                             name: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             phone: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .user
//                                                                 .phone,
//                                                             email: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .user
//                                                                 .email,
//                                                             joiningDate: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .joiningDate,
//                                                             placement: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .placement,
//                                                             lMember: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .lMember,
//                                                             lCarryPoint: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .lCarryPoint,
//                                                             rMember: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .rMember,
//                                                             rCarryPoint: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .rCarryPoint,
//                                                             onPressed: () {
//                                                               setState(() {
//                                                                 isLeftActive =
//                                                                     true;

//                                                                 selectedData = data
//                                                                     .downlinkLeft
//                                                                     ?.downlinkLeft2nd;
//                                                                 var id = data
//                                                                     .downlinkLeft!
//                                                                     .downlinkLeft2nd!
//                                                                     .user
//                                                                     .treeId;
//                                                                 print(id);
//                                                                 controller
//                                                                     .fetchTreeData(
//                                                                         id!.toInt());
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               });
//                                                             });
//                                                       });
//                                                 },
//                                                 child: data
//                                                             .downlinkLeft
//                                                             ?.downlinkLeft2nd
//                                                             ?.user
//                                                             ?.name !=
//                                                         null
//                                                     ?

//                                                     //data.downlinkLeft?.downlinkLeft2nd?.name != null ?

//                                                     Column(
//                                                         children: [
//                                                           const CircleAvatar(
//                                                             radius: 25,
//                                                             backgroundImage:
//                                                                 AssetImage(
//                                                                     AppAssets
//                                                                         .people),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 10),
//                                                           Text(
//                                                             data
//                                                                 .downlinkLeft!
//                                                                 .downlinkLeft2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             style:
//                                                                 const TextStyle(
//                                                               fontSize: 14,
//                                                               color:
//                                                                   Colors.white,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     : InkWell(
//                                                         onTap: () {
//                                                           showModalBottomSheet(
//                                                             context: context,
//                                                             isScrollControlled:
//                                                                 true,
//                                                             builder:
//                                                                 (context) =>
//                                                                     Padding(
//                                                               padding: EdgeInsets.only(
//                                                                   bottom: MediaQuery.of(
//                                                                           context)
//                                                                       .viewInsets
//                                                                       .bottom),
//                                                               child: JoinForm(
//                                                                 placement: data
//                                                                     .placement,
//                                                                 uplink:
//                                                                     data.uplink,
//                                                               ),
//                                                             ),
//                                                           );
//                                                         },
//                                                         child: Column(
//                                                           children: [
//                                                             SizedBox(
//                                                               height: 40,
//                                                               width: 40,
//                                                               child:
//                                                                   Image.asset(
//                                                                 AppAssets
//                                                                     .addIcon,
//                                                                 color: Colors
//                                                                     .white,
//                                                               ),
//                                                             ),
//                                                             const SizedBox(
//                                                                 height: 5),
//                                                             const Text(
//                                                               'Open',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .white),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                               ),

//                                               const SizedBox(
//                                                 width: 10,
//                                               ),

//                                               //gen 2 // downlinkLeft!.downlinkRight2nd
//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       context: context,
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       shape:
//                                                           const RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.vertical(
//                                                                 top: Radius
//                                                                     .circular(
//                                                                         20)),
//                                                       ),
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return _buildBottomSheetContent(
//                                                             name: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             phone: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .user
//                                                                 .phone,
//                                                             email: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .user
//                                                                 .email,
//                                                             joiningDate: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .joiningDate,
//                                                             placement: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .placement,
//                                                             lMember: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .lMember,
//                                                             lCarryPoint: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .lCarryPoint,
//                                                             rMember: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .rMember,
//                                                             rCarryPoint: data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .rCarryPoint,
//                                                             onPressed: () {
//                                                               setState(() {
//                                                                 isLeftActive =
//                                                                     true;

//                                                                 selectedData = data
//                                                                     .downlinkLeft
//                                                                     ?.downlinkRight2nd;
//                                                                 var id = data
//                                                                     .downlinkLeft!
//                                                                     .downlinkRight2nd!
//                                                                     .user
//                                                                     .treeId;
//                                                                 print(id);
//                                                                 controller
//                                                                     .fetchTreeData(
//                                                                         id!.toInt());
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               });
//                                                             });
//                                                       });
//                                                 },
//                                                 child: data.downlinkLeft!
//                                                             .downlinkRight2nd !=
//                                                         null
//                                                     ? Column(
//                                                         children: [
//                                                           const CircleAvatar(
//                                                             radius: 25,
//                                                             backgroundImage:
//                                                                 AssetImage(
//                                                                     AppAssets
//                                                                         .people),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 10),
//                                                           Text(
//                                                             data
//                                                                 .downlinkLeft!
//                                                                 .downlinkRight2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             style:
//                                                                 const TextStyle(
//                                                               fontSize: 14,
//                                                               color:
//                                                                   Colors.white,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     : InkWell(
//                                                         onTap: () {
//                                                           showModalBottomSheet(
//                                                             context: context,
//                                                             isScrollControlled:
//                                                                 true,
//                                                             builder:
//                                                                 (context) =>
//                                                                     Padding(
//                                                               padding: EdgeInsets.only(
//                                                                   bottom: MediaQuery.of(
//                                                                           context)
//                                                                       .viewInsets
//                                                                       .bottom),
//                                                               child: JoinForm(
//                                                                 placement: data
//                                                                     .placement,
//                                                                 uplink:
//                                                                     data.uplink,
//                                                               ),
//                                                             ),
//                                                           );
//                                                         },
//                                                         child: Column(
//                                                           children: [
//                                                             SizedBox(
//                                                               height: 40,
//                                                               width: 40,
//                                                               child:
//                                                                   Image.asset(
//                                                                 AppAssets
//                                                                     .addIcon,
//                                                                 color: Colors
//                                                                     .white,
//                                                               ),
//                                                             ),
//                                                             const SizedBox(
//                                                                 height: 5),
//                                                             const Text(
//                                                               'Open',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .white),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                               ),

//                                               const SizedBox(
//                                                 width: 40,
//                                               ),

//                                               const IntrinsicHeight(
//                                                 child: Row(
//                                                   children: [
//                                                     Text(''),
//                                                     VerticalDivider(
//                                                       color: Colors.black,
//                                                       thickness: 2,
//                                                     ),
//                                                     Text(''),
//                                                   ],
//                                                 ),
//                                               ),

//                                               const SizedBox(
//                                                 width: 40,
//                                               ),

//                                               //2nd gen //downlinkRight! .downlinkLeft2nd
//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       context: context,
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       shape:
//                                                           const RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.vertical(
//                                                                 top: Radius
//                                                                     .circular(
//                                                                         20)),
//                                                       ),
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return _buildBottomSheetContent(
//                                                             name: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             phone: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .user
//                                                                 .phone,
//                                                             email: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .user
//                                                                 .email,
//                                                             joiningDate: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .joiningDate,
//                                                             placement: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .placement,
//                                                             lMember: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .lMember,
//                                                             lCarryPoint: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .lCarryPoint,
//                                                             rMember: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .rMember,
//                                                             rCarryPoint: data
//                                                                 .downlinkRight!
//                                                                 .downlinkLeft2nd!
//                                                                 .rCarryPoint,
//                                                             onPressed: () {
//                                                               setState(() {
//                                                                 isLeftActive =
//                                                                     true;

//                                                                 selectedData = data
//                                                                     .downlinkRight
//                                                                     ?.downlinkLeft2nd;

//                                                                 var id = data
//                                                                     .downlinkRight!
//                                                                     .downlinkLeft2nd!
//                                                                     .user
//                                                                     .treeId;
//                                                                 print(id);
//                                                                 controller
//                                                                     .fetchTreeData(
//                                                                         id!.toInt());
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               });
//                                                             });
//                                                       });
//                                                 },
//                                                 child: 
//                                                 // data.downlinkRight !=
//                                                 //             null &&
//                                                 //         data.downlinkRight!
//                                                 //                 .downlinkLeft2nd !=
//                                                 //             null
//                                                 //     ? Column(
//                                                 //         children: [
//                                                 //           const CircleAvatar(
//                                                 //             radius: 25,
//                                                 //             backgroundImage:
//                                                 //                 AssetImage(
//                                                 //                     AppAssets
//                                                 //                         .people),
//                                                 //           ),
//                                                 //           const SizedBox(
//                                                 //               height: 10),
//                                                 //           Text(
//                                                 //             data
//                                                 //                 .downlinkRight!
//                                                 //                 .downlinkLeft2nd!
//                                                 //                 .user!
//                                                 //                 .name,
//                                                 //             style:
//                                                 //                 const TextStyle(
//                                                 //               fontSize: 14,
//                                                 //               color:
//                                                 //                   Colors.white,
//                                                 //               fontWeight:
//                                                 //                   FontWeight
//                                                 //                       .bold,
//                                                 //             ),
//                                                 //           ),
//                                                 //         ],
//                                                 //       )
//                                                 //     : InkWell(
//                                                 //         onTap: () {
//                                                 //           showModalBottomSheet(
//                                                 //             context: context,
//                                                 //             isScrollControlled:
//                                                 //                 true,
//                                                 //             builder:
//                                                 //                 (context) =>
//                                                 //                     Padding(
//                                                 //               padding: EdgeInsets.only(
//                                                 //                   bottom: MediaQuery.of(
//                                                 //                           context)
//                                                 //                       .viewInsets
//                                                 //                       .bottom),
//                                                 //               child:
//                                                 //                     JoinForm(
//                                                 //                        placement: data.placement,
//                                                 //     uplink: data.uplink,
//                                                 //                     ),
//                                                 //             ),
//                                                 //           );
//                                                 //         },
//                                                 //         child: Column(
//                                                 //           children: [
//                                                 //             SizedBox(
//                                                 //               height: 40,
//                                                 //               width: 40,
//                                                 //               child:
//                                                 //                   Image.asset(
//                                                 //                 AppAssets
//                                                 //                     .addIcon,
//                                                 //                 color: Colors
//                                                 //                     .white,
//                                                 //               ),
//                                                 //             ),
//                                                 //             const SizedBox(
//                                                 //                 height: 5),
//                                                 //             const Text(
//                                                 //               'Open',
//                                                 //               style: TextStyle(
//                                                 //                   color: Colors
//                                                 //                       .white),
//                                                 //             ),
//                                                 //           ],
//                                                 //         ),
//                                                 //       ),

                                                
//                                                 data.downlinkRight?.user?.name != null
//     ? (data.downlinkRight != null &&
//             data.downlinkRight!.downlinkLeft2nd != null
//         ? Column(
//             children: [
//               const CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage(AppAssets.people),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 data.downlinkRight!.downlinkLeft2nd!.user!.name,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           )
//         : InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 builder: (context) => Padding(
//                   padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom,
//                   ),
//                   child: JoinForm(
//                     placement: data.placement,
//                     uplink: data.uplink,
//                   ),
//                 ),
//               );
//             },
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 40,
//                   width: 40,
//                   child: Image.asset(
//                     AppAssets.addIcon,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 const Text(
//                   'Open',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ))
//     : const SizedBox.shrink(), 



//                                               ),



//                                               const SizedBox(
//                                                 width: 10,
//                                               ),

//                                               // gen 2 // downlinkRight!.downlinkRight2nd
//                                               InkWell(
//                                                 onTap: () {
//                                                   showModalBottomSheet(
//                                                       context: context,
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       shape:
//                                                           const RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.vertical(
//                                                                 top: Radius
//                                                                     .circular(
//                                                                         20)),
//                                                       ),
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return _buildBottomSheetContent(
//                                                           name: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .user!
//                                                               .name,
//                                                           phone: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .user
//                                                               .phone,
//                                                           email: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .user
//                                                               .email,
//                                                           joiningDate: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .joiningDate,
//                                                           placement: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .placement,
//                                                           lMember: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .lMember,
//                                                           lCarryPoint: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .lCarryPoint,
//                                                           rMember: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .rMember,
//                                                           rCarryPoint: data
//                                                               .downlinkRight!
//                                                               .downlinkRight2nd!
//                                                               .rCarryPoint,
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               isLeftActive =
//                                                                   true;

//                                                               selectedData = data
//                                                                   .downlinkRight
//                                                                   ?.downlinkLeft2nd;
//                                                               var id = data
//                                                                   .downlinkRight!
//                                                                   .downlinkRight2nd!
//                                                                   .user
//                                                                   .treeId;
//                                                               print(id);
//                                                               controller
//                                                                   .fetchTreeData(
//                                                                       id!.toInt());
//                                                               Navigator.pop(
//                                                                   context);
//                                                             });
//                                                           },
//                                                         );
//                                                       });
//                                                 },
//                                                 child: data.downlinkRight !=
//                                                             null &&
//                                                         data.downlinkRight!
//                                                                 .downlinkRight2nd !=
//                                                             null
//                                                     ? Column(
//                                                         children: [
//                                                           const CircleAvatar(
//                                                             radius: 25,
//                                                             backgroundImage:
//                                                                 AssetImage(
//                                                                     AppAssets
//                                                                         .people),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 10),
//                                                           Text(
//                                                             data
//                                                                 .downlinkRight!
//                                                                 .downlinkRight2nd!
//                                                                 .user!
//                                                                 .name,
//                                                             style:
//                                                                 const TextStyle(
//                                                               fontSize: 14,
//                                                               color:
//                                                                   Colors.white,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     : InkWell(
//                                                         onTap: () {
//                                                           showModalBottomSheet(
//                                                             context: context,
//                                                             isScrollControlled:
//                                                                 true,
//                                                             builder:
//                                                                 (context) =>
//                                                                     Padding(
//                                                               padding: EdgeInsets.only(
//                                                                   bottom: MediaQuery.of(
//                                                                           context)
//                                                                       .viewInsets
//                                                                       .bottom),
//                                                               child:
//                                                                     JoinForm(
//                                                                        placement: data.placement,
//                                                     uplink: data.uplink,
//                                                                     ),
//                                                             ),
//                                                           );
//                                                         },
//                                                         child: Column(
//                                                           children: [
//                                                             SizedBox(
//                                                               height: 40,
//                                                               width: 40,
//                                                               child:
//                                                                   Image.asset(
//                                                                 AppAssets
//                                                                     .addIcon,
//                                                                 color: Colors
//                                                                     .white,
//                                                               ),
//                                                             ),
//                                                             const SizedBox(
//                                                                 height: 5),
//                                                             const Text(
//                                                               'Open',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .white),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       : 
                                      
//                                       InkWell(
//                                           onTap: () {
//                                             showModalBottomSheet(
//                                               context: context,
//                                               isScrollControlled: true,
//                                               builder: (context) => Padding(
//                                                 padding: EdgeInsets.only(
//                                                   bottom: MediaQuery.of(context)
//                                                       .viewInsets
//                                                       .bottom,
//                                                 ),
//                                                 child:   JoinForm(
//                                                    placement: data.placement,
//                                                     uplink: data.uplink,
//                                                 ),
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
          


//                                 ],
//                               ),
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

//   ///bottom model for Gen1 and Gen2
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
//     required void Function()? onPressed,
//   }) {
//     Widget _buildRow(String label, String value) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0),
//         child: Row(
//           children: [
//             Text(
//               label,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Text(
//                 value,
//                 style: const TextStyle(fontSize: 16),
//                 textAlign: TextAlign.right,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return Padding(
//       padding:
//           const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5, top: 5),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Center(
//               child: Text(
//                 'Details',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const Divider(color: Colors.black),
//             const SizedBox(height: 5),
//             const Center(
//               child: CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage(AppAssets.people),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('$lMember || $rMember ',
//                     style: const TextStyle(fontSize: 16))
//               ],
//             ),
//             const SizedBox(height: 5),
//             _buildRow('Name:', name),
//             _buildRow('Phone:', phone),
//             _buildRow('Email:', email),
//             _buildRow('Joining Date:', joiningDate),
//             _buildRow('Placement:', placement.toString()),
//             _buildRow('Left Member:', lMember.toString()),
//             _buildRow('Left Carry Point:', lCarryPoint.toString()),
//             _buildRow('Right Member:', rMember.toString()),
//             _buildRow('Right Carry Point:', rCarryPoint.toString()),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.close,
//                       color: Colors.red,
//                     ),
//                     label: const Text('Close'),
//                   ),
//                 ),
//                 Center(
//                   child: ElevatedButton.icon(
//                     onPressed: onPressed,
//                     icon: const Icon(
//                       Icons.arrow_upward,
//                       color: Colors.green,
//                     ),
//                     label: const Text('Switch To Top'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ///bottom Model for Root user.
// class DetailsBottomSheet extends StatelessWidget {
//   final String title;
//   final String title2;
//   final int lMember;
//   final int rMember;
//   final String phone;
//   final String email;
//   final String joiningDate;
//   final int lCarryPoint;
//   final int rCarryPoint;
//   final int placement;
//   final void Function()? onClose;
//   final void Function()? onStepDown;

//   const DetailsBottomSheet({
//     Key? key,
//     required this.title,
//     required this.title2,
//     required this.lMember,
//     required this.rMember,
//     required this.phone,
//     required this.email,
//     required this.joiningDate,
//     required this.lCarryPoint,
//     required this.rCarryPoint,
//     required this.placement,
//     this.onClose,
//     this.onStepDown,
//   }) : super(key: key);

//   Widget _buildCustomRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 5),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           const Divider(color: Colors.black),
//           const SizedBox(height: 5),
//           const Center(
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(AppAssets.people),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Center(
//             child: Text(
//               '$lMember || $rMember',
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//             ),
//           ),
//           const SizedBox(height: 5),
//           _buildCustomRow('Name:', title2),
//           _buildCustomRow('Phone:', phone),
//           _buildCustomRow('Email:', email),
//           _buildCustomRow('Joining Date:', joiningDate),
//           _buildCustomRow('Left Member:', lMember.toString()),
//           _buildCustomRow('Left Carry Point:', lCarryPoint.toString()),
//           _buildCustomRow('Right Member:', rMember.toString()),
//           _buildCustomRow('Right Carry Point:', rCarryPoint.toString()),
//           _buildCustomRow('Placement:', placement.toString()),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: onClose,
//                 icon: const Icon(Icons.close, color: Colors.red),
//                 label: const Text('Close'),
//               ),
//               ElevatedButton.icon(
//                 onPressed: onStepDown,
//                 icon: const Icon(Icons.arrow_downward, color: Colors.blue),
//                 label: const Text('Step Down'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }







