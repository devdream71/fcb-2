import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/about.dart';
import 'package:fcb_global/view/deposit/deposit.dart';
import 'package:fcb_global/view/home/home_view.dart';
import 'package:fcb_global/view/income_statement/receive_money.dart';
import 'package:fcb_global/view/invest/invest_view.dart';
import 'package:fcb_global/view/package/pacakage_view.dart';
import 'package:fcb_global/view/login/login_view.dart';
import 'package:fcb_global/view/my_wallet/my_wallet.dart';
import 'package:fcb_global/view/notification/notification.dart';
import 'package:fcb_global/view/send_money/send_money.dart';
import 'package:fcb_global/view/team/team.dart';
import 'package:fcb_global/view/withdraw/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                          Icons.settings,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          size: 28,
                          Icons.cancel,
                          color: Colors.red,
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
                      Container(
                        //color: Colors.green,
                        child: ListTile(
                          minTileHeight: 40,
                          onTap: () {
                            Get.to(const HomeView(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          title: const Text("Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                          leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),

                      //my wallet
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(MyWallet(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("My Wallet",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.wallet,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),

                      //about
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(About(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("About",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //notification
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const AppNotification(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Notification",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //income Statement
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const IncomeStatement(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Income Statement",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const PackageView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Package",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.inventory_2,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const InvestView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Invest",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.access_alarm,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //team
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const TeamView(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Team",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //withdrae
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const Withdraw(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Withdraw",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //deposit
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const Deposit(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Deposit",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.money,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //send money
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const SendMoney(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Send Money",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //change password
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const ChangePassword(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Change Password",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.lock_reset,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                      //recive money
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          Get.to(const ReceiveMoney(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        title: const Text("Receive Money",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.lock_reset,
                              color: Colors.white,
                              size: 18,
                            )),
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
                      ListTile(
                        minTileHeight: 40,
                        onTap: () {
                          showDeleteAlertDialog(context);
                        },
                        title: const Text("Delete Account",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        //subtitle:Text('View your profile here', style: TextStyle(color: Colors.white, fontSize: 16)),
                        leading: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
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

  showAlertDialog(BuildContext context) {
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
          "Log out",
          style: TextStyle(color: Colors.red),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure, you want logout"),
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
}
