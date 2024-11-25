import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:fcb_global/view/join/join_controller.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinForm extends StatefulWidget {
  const JoinForm({super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  bool isPasswordVisible = false;

  final gender = [
    'Male',
    'Female',
    'Rather not say',
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final TextEditingController uplineController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  final UserController userController = Get.put(UserController());
  final JoinController joinController = Get.put(JoinController());

  @override
  void initState() {
    super.initState();
    userController.fetchUserInfo().then((_) {
      // Automatically populate the referral email field with the fetched email
      referralController.text = userController.email.value ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor:
          0.9, // Controls the height of the modal sheet (90% of screen)
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                const SizedBox(height: 16),
                const LabelWithAsterisk(labelText: 'Name', isRequired: true),
                CustomTextField(
                  label: 'Name',
                  controller: nameController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Name is required'
                      : null,
                ),
                const SizedBox(height: 8),
                const LabelWithAsterisk(labelText: 'Email', isRequired: true),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const LabelWithAsterisk(
                    labelText: 'Phone Number', isRequired: true),
                CustomTextField(
                  label: 'Phone Number',
                  controller: phoneController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Phone number is required'
                      : null,
                ),
                const SizedBox(height: 8),
                const LabelWithAsterisk(
                    labelText: 'Password', isRequired: true),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  isPasswordVisible: isPasswordVisible,
                  onTogglePasswordVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Password is required'
                      : null,
                ),
                const SizedBox(height: 8),
                const LabelWithAsterisk(labelText: 'Gender', isRequired: true),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                  ),
                  items: gender
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Gender is required' : null,
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                    labelText: 'Referral E-mail', isRequired: true),
                CustomTextField(
                  label: 'Referral Email',
                  controller: referralController,
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                const LabelWithAsterisk(
                    labelText: 'Upline Number', isRequired: true),
                CustomTextField(
                  label: 'Upline Number',
                  controller: uplineController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Upline number is required'
                      : null,
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: joinController.isLoading.value
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  joinController.submitJoinForm(
                                    email: 'moshi1@gmail.com',
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    upline: 168,
                                    position: 1,
                                    genderId: 1,
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: joinController.isLoading.value
                              ? Colors.grey
                              : const Color(0xFF4B0082),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: joinController.isLoading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'Join',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool readOnly;
  final bool isPasswordVisible;
  final Function? onTogglePasswordVisibility;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.readOnly = false,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => onTogglePasswordVisibility?.call(),
              )
            : null,
      ),
      validator: validator,
    );
  }
}
