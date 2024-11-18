// PhoneInputRow Widget
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryCode {
  final String name;
  final String code;
  final String dialCode;
  final String flag;

  CountryCode({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });
}

class PhoneInputRow extends StatefulWidget {
  final TextEditingController controller;

  const PhoneInputRow({
    super.key,
    required this.controller,
  });

  @override
  State<PhoneInputRow> createState() => _PhoneInputRowState();
}

class _PhoneInputRowState extends State<PhoneInputRow> {
  late CountryCode _selectedCountry;
  bool _isPickerOpen = false;

  final List<CountryCode> _countries = [
    CountryCode(name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪'),
    CountryCode(name: 'Uganda', code: 'UG', dialCode: '+256', flag: '🇺🇬'),
    CountryCode(name: 'Tanzania', code: 'TZ', dialCode: '+255', flag: '🇹🇿'),
    CountryCode(name: 'Rwanda', code: 'RW', dialCode: '+250', flag: '🇷🇼'),
    CountryCode(name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: '🇪🇹'),
    CountryCode(name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬'),
    CountryCode(
        name: 'South Africa', code: 'ZA', dialCode: '+27', flag: '🇿🇦'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countries.firstWhere((country) => country.code == 'KE');
  }

  void _togglePicker() {
    setState(() {
      _isPickerOpen = !_isPickerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Country Code Field
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: GestureDetector(
                onTap: _togglePicker,
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                _selectedCountry.flag,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _selectedCountry.dialCode,
                                style: const TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Phone Number Field
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      // Changed to TextFormField for form validation
                      controller: widget.controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9),
                      ],
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        border: InputBorder.none,
                        hintText: 'Enter phone number',
                        hintStyle:
                            TextStyle(color: Colors.pinkAccent, fontSize: 17),
                      ),
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 17,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter phone number';
                        }
                        if (value.length < 9) {
                          return 'enter a valid phone number';
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
        // Country Picker Dropdown
        if (_isPickerOpen)
          Container(
            margin: const EdgeInsets.fromLTRB(15, 4, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.pinkAccent.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                final country = _countries[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCountry = country;
                      _isPickerOpen = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: index != _countries.length - 1
                          ? Border(
                              bottom: BorderSide(
                                color: Colors.pinkAccent.withOpacity(0.1),
                              ),
                            )
                          : null,
                    ),
                    child: Row(
                      children: [
                        Text(
                          country.flag,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          country.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          country.dialCode,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
