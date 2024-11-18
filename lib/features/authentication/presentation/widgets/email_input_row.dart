import 'package:flutter/material.dart';

class EmailInputRow extends StatelessWidget {
  final TextEditingController controller;

  const EmailInputRow({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller:
                          firstNameController, // Use separate controller
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        border: InputBorder.none,
                        hintText: 'first name',
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 17,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 17,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter first name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: lastNameController, // Use separate controller
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        border: InputBorder.none,
                        hintText: 'last name',
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 17,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 17,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      // Changed to TextFormField for form validation
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 17,
                        ),
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 17,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
