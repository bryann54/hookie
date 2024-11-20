import 'package:flutter/material.dart';

class EmailInputRow extends StatefulWidget {
  final Function(String firstName, String lastName, String email)
      onInputSubmitted;
  final TextEditingController emailController;

  const EmailInputRow({
    super.key,
    required this.emailController,
    required this.onInputSubmitted,
  });

  @override
  State<EmailInputRow> createState() => _EmailInputRowState();
}

class _EmailInputRowState extends State<EmailInputRow> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void _submitData() {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = widget.emailController.text;

    if (firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty) {
      widget.onInputSubmitted(firstName, lastName, email);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => _submitData(),
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
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => _submitData(),
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
                      controller: widget.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onChanged: (_) => _submitData(),
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
