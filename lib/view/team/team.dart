import 'dart:io';

import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/team/member_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/label_with_asterrisk.dart';

class TeamView extends StatelessWidget {
  const TeamView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ),

            buildRating(),

            ratingwithdimond(),

            const HeaderWithTeams(),

            const SizedBox(height: 20),

            //Team member section
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 520,
                   
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                           
                          child: Column(
                            children: [
                              Container(
                                height: 400,
                                child: TeamList(
                                  teamScore: 100,
                                  members: List.generate(
                                    10,
                                    (index) => MemberData('MD.Anwar Alom',
                                        'anowar@gmail.com', 'Ref:Md.Korim', 10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
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
                                child: const Text(
                                  "Add+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Dash(
                          direction: Axis.vertical,
                          length: 400,
                          dashLength: 5,
                          dashColor: Colors.white),
                      Expanded(
                        child: Container(
                         
                          child: Column(
                            children: [
                              Container(
                                height: 400,
                                 
                                child: TeamList(
                                  teamScore: 150,
                                  members: List.generate(
                                    7,
                                    (index) => MemberData('MD.Anwar Alom',
                                        'anowar@gmail.com', 'Ref:Md.Taher', 5),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
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
                                child: const Text(
                                  "Add+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingwithdimond() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 2,
          minRating: 1,
          itemSize: 20,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          unratedColor: Colors.white,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            debugPrint("$rating");
          },
        ),
        const Icon(
          Icons.diamond,
          color: Colors.white,
        )
      ],
    );
  }
}

buildRating() {
  return const Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AppAssets.appLogo),
      ),
      Text(
        'Md. Mosiur Rahman Rangga',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'mosiur@gmail.com',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'Ref: Md. Monirol Islam',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    ],
  );
}

class HeaderWithTeams extends StatelessWidget {
  const HeaderWithTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, color: Colors.white, size: 40),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Team',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          'L-1 L-2',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

class TeamList extends StatelessWidget {
  final int teamScore;
  final List<MemberData> members;

  const TeamList({super.key, required this.teamScore, required this.members});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Center(
            child: Text(
              '$teamScore',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];
              return MemberTile(member: member);
            },
          ),
        ),
      ],
    );
  }
}

class MemberTile extends StatelessWidget {
  final MemberData member;

  const MemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () {
          Get.to(const MemberSwitch(),
              transition: Transition.rightToLeftWithFade);
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member.name,
                        style: const TextStyle(color: Colors.white)),
                    Text(member.email,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                    Text(member.ref,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '${member.score}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
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

class MemberData {
  final String name;
  final String email;
  final String ref;
  final int score;

  MemberData(this.name, this.email, this.ref, this.score);
}

class JoinForm extends StatefulWidget {
  const JoinForm({super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {

  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  String? selectedValue = 'No';
  
  
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor:
          0.9, // Controls the height of the modal sheet (90% of screen)
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Joining',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add spacing for better layout

              LabelWithAsterisk(labelText: 'Name', isRequired: true,),
              const CustomTextField(label: 'Name'),
              const SizedBox(height: 8),

              LabelWithAsterisk(labelText: 'Email', isRequired: true,),
              const CustomTextField(label: 'E-Mail'),
              const SizedBox(height: 8),

              LabelWithAsterisk(labelText: 'Phone Number', isRequired: true,),
              const CustomTextField(label: 'Phone Number'),
              const SizedBox(height: 8),

              LabelWithAsterisk(labelText: 'Password', isRequired: true,),
              const CustomTextField(label: 'Password', isPassword: true),
              const SizedBox(height: 8),
              const SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            LabelWithAsterisk(labelText: 'Gender', isRequired: true,),
                            CustomTextField(label: 'Gender'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            LabelWithAsterisk(labelText: 'Country', isRequired: true,),
                            CustomTextField(label: 'Country'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              LabelWithAsterisk(labelText: 'Referral E-mail', isRequired: true,),
              const CustomTextField(label: 'Referral E-Mail'),
              const SizedBox(height: 8),

              LabelWithAsterisk(labelText: 'Up Mail', isRequired: true,),
              const CustomTextField(label: 'Up Mail'),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 50),
                  SizedBox(width: 10),
                  Text('Picture Upload'),
                ],
              ),


//
//               Center(
//   child: Stack(
//     alignment: Alignment.bottomRight,
//     children: [
//       CircleAvatar(
//         radius: 65,
//         backgroundColor: Colors.green[100],
//         child: CircleAvatar(
//           radius: 60,
//           backgroundImage: _imageFile != null
//               ? FileImage(File(_imageFile!.path))
//               : Image.asset("assets/images/logo.JPG")
//                   as ImageProvider,
//         ),
//       ),
//       Positioned(
//         bottom: 4,
//         right: 4,
//         child: GestureDetector(
//           onTap: () {
//             _showImageSourceActionSheet(context);
//           },
//           child: Container(
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             padding: const EdgeInsets.all(6),
//             child: const Icon(
//               Icons.camera_alt,
//               size: 20,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),


              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B0082), // Purple color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const CustomTextField(
      {super.key, required this.label, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
