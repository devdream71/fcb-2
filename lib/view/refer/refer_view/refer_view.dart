import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/refer/refer_controller/refer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyReferPage extends StatelessWidget {
  const MyReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyReferController myReferController = Get.put(MyReferController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Obx(() {
          if (myReferController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (myReferController.errorMessage.isNotEmpty) {
            return Center(child: Text(myReferController.errorMessage.value));
          }

          if (myReferController.myReferData.value != null) {
            final myReferData = myReferController.myReferData.value;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Refer",
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: myReferData?.myRefer?.length ?? 0,
                      itemBuilder: (context, index) {
                        final myRefer = myReferData?.myRefer?[index];
                        return ListTile(
                          title: Text(
                            'Name: ${myRefer?.user?.name ?? 'No Name'}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Phone: ${myRefer?.user?.phone ?? 'No Joining Date'} ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                  "Up link id: ${myRefer?.uplinkId ?? 'No Up link'} ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                  "Downlink left link id: ${myRefer?.downlinkLeftId ?? 'No down link left'} ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                  "Downlink Right link id: ${myRefer?.downlinkRightId ?? 'No down link Right'} ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                  'Joining Date: ${myRefer?.joiningDate ?? 'No Date'}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No referrals available.'));
          }
        }),
      ),
    );
  }
}
