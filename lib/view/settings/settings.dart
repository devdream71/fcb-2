import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/about.dart';
import 'package:fcb_global/view/deposit/deposit.dart';
import 'package:fcb_global/view/home/home_view.dart';
import 'package:fcb_global/view/income/income_view/income_view.dart';
import 'package:fcb_global/view/invest/invest_view.dart';
import 'package:fcb_global/view/package/pacakage_view.dart';
import 'package:fcb_global/view/login/login_view.dart';
import 'package:fcb_global/view/my_wallet/my_wallet.dart';
import 'package:fcb_global/view/notification/notification.dart';
import 'package:fcb_global/view/receive_money/receive_moneytwo.dart';
import 'package:fcb_global/view/refer/refer_view/refer_view.dart';
import 'package:fcb_global/view/send_money/send_money.dart';
import 'package:fcb_global/view/team/team_view/team_view.dart';
import 'package:fcb_global/view/withdraw/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../change_password/change_password.dart';
import '../income_statement/income_statement.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, bottom: 5, top: 2),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 28,
                          Icons.more_vert,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          size: 28,
                          Icons.cancel,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customListTile(
                        title: 'Home',
                        icon: Icons.home,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const HomeView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'My Wallet',
                        icon: Icons.wallet,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(MyWallet(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'About',
                        icon: Icons.info,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(About(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Notification',
                        icon: Icons.notifications,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const AppNotification(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Income Statement',
                        icon: Icons.description,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const IncomeStatement(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      // customListTile(
                      //   title: 'Income',
                      //   icon: Icons.wallet,
                      //   iconBackgroundColor: Colors.red,
                      //   onTap: () {
                      //     Get.to(const IncomeView(),
                      //         transition: Transition.rightToLeftWithFade);
                      //   },
                      // ),

                      customListTile(
                        title: 'Package',
                        icon: Icons.lock_reset,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const PackageView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'My Refer',
                        icon: Icons.monetization_on,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(MyReferPage(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Invest',
                        icon: Icons.monetization_on,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const InvestView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Team',
                        icon: Icons.people,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(TreeView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Withdraw',
                        icon: Icons.send,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(Withdraw(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Deposit',
                        icon: Icons.access_alarm,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const Deposit(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Send Money',
                        icon: Icons.send,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(SendMoney(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Change Password',
                        icon: Icons.inventory_2,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(const ChangePassword(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      customListTile(
                        title: 'Receive Money History',
                        icon: Icons.inventory_2,
                        iconBackgroundColor: Colors.red,
                        onTap: () {
                          Get.to(ReceiveMoneyPage(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      ),

                      //log out
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          showAlertDialog(context);
                        },
                        title: const Text("logout",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //delete acount
                      // ListTile(
                      //   minTileHeight: 40,
                      //   onTap: () {
                      //     showDeleteAlertDialog(context);
                      //   },
                      //   title: const Text("Delete Account",
                      //       style:
                      //           TextStyle(color: Colors.white, fontSize: 14)),
                      //   //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                      //   leading: const CircleAvatar(
                      //       radius: 15,
                      //       backgroundColor: Colors.red,
                      //       child: Icon(
                      //         Icons.delete,
                      //         color: Colors.white,
                      //         size: 18,
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // showAlertDialog(BuildContext context) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('auth_token') ?? '';

  //   Widget cancelButton = TextButton(
  //       onPressed: () {
  //         Navigator.of(context).pop();
  //       },
  //       child: const Text("Cancel"));

  //   Widget logOutButton = TextButton(
  //       onPressed: () async {
  //         await Future.delayed(const Duration(seconds: 2));

  //         Get.to(LoginView(), transition: Transition.rightToLeftWithFade);
  //       },
  //       child: const Text(
  //         "Log out",
  //         style: TextStyle(color: Colors.red),
  //       ));

  //   AlertDialog alertDialog = AlertDialog(
  //     title: const Text("Logout"),
  //     content: const Text("Are you sure, you want logout"),
  //     actions: [
  //       cancelButton,
  //       logOutButton,
  //     ],
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return alertDialog;
  //       });
  // }

  ///===>
  showAlertDialog(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('auth_token') ?? '';

    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Cancel"),
    );

    Widget logOutButton = TextButton(
      onPressed: () async {
        await prefs.remove('auth_token');
        //await Future.delayed(const Duration(seconds: 2));
        Get.to(LoginView(), transition: Transition.rightToLeftWithFade);
      },
      child: const Text(
        "Log out",
        style: TextStyle(color: Colors.red),
      ),
    );

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure, you want to logout?"),
      actions: [
        cancelButton,
        logOutButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  showDeleteAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Cancel"));

    Widget logOutButton = TextButton(
        onPressed: () {
          Get.to(LoginView(), transition: Transition.rightToLeftWithFade);
        },
        child: const Text(
          "Delete",
          style: TextStyle(color: Colors.red),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Delete"),
      content: const Text("Are you sure, you want to Delete Account "),
      actions: [
        cancelButton,
        logOutButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Widget customListTile({
    required String title,
    required IconData icon,
    required Color iconBackgroundColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      minTileHeight: 40,
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: iconBackgroundColor,
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
