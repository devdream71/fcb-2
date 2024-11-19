import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';

class JoinForm extends StatefulWidget {
  const JoinForm({super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
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

              const LabelWithAsterisk(
                labelText: 'Name',
                isRequired: true,
              ),
              const CustomTextField(label: 'Name'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Email',
                isRequired: true,
              ),
              const CustomTextField(label: 'E-Mail'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Phone Number',
                isRequired: true,
              ),
              const CustomTextField(label: 'Phone Number'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Password',
                isRequired: true,
              ),
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
                            LabelWithAsterisk(
                              labelText: 'Gender',
                              isRequired: true,
                            ),
                            CustomTextField(label: 'Gender'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // Expanded(
                    //   child: SizedBox(
                    //     height: 95,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         LabelWithAsterisk(
                    //           labelText: 'Country',
                    //           isRequired: true,
                    //         ),
                    //         CustomTextField(label: 'Country'),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Referral E-mail',
                isRequired: true,
              ),
              const CustomTextField(label: 'ref@gamil.com'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Upline Number',
                isRequired: true,
              ),
              const CustomTextField(label: 'upline@gmail.com'),
              const SizedBox(height: 8),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.image, size: 50),
              //     SizedBox(width: 10),
              //     Text('Picture Upload'),
              //   ],
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
