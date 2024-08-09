import 'package:flutter/material.dart';
import 'package:weather_kokorkin/Form/user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final List<String> _countries = [
    'Ukraine',
    'USA',
    'Canada',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'China',
    'Japan',
    'South Korea',
  ];
  String _selectedCountry = 'Ukraine';

  final _snackBar = const SnackBar(
    content: Text('Form is not valid! Please review and correct.'),
    backgroundColor: Colors.red,
  );
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _countryFocusNode = FocusNode();
  final _storyFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _countryFocusNode.dispose();
    _storyFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // Decide if it is a mobile or tablet/desktop
          bool isMobile = width < 600;
          bool isTablet = width >= 600 && width < 1200;
          bool isDesktop = width >= 1200;

          double padding = isMobile ? 15 : (isTablet ? 30 : 60);

          return Center(
            child: Container(
              width: isDesktop ? 600 : double.infinity,
              padding: EdgeInsets.all(padding),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      autofocus: true,
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(_nameFocusNode, _phoneFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your name',
                        prefixIcon: const Icon(Icons.person),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneController,
                      focusNode: _phoneFocusNode,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(_phoneFocusNode, _emailFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your phone number',
                        prefixIcon: const Icon(Icons.phone),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(_emailFocusNode, _countryFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      focusNode: _countryFocusNode,
                      value: _selectedCountry,
                      items: _countries
                          .map(
                            (country) => DropdownMenuItem(
                              child: Text(country),
                              value: country,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value!;
                        });
                        _fieldFocusChange(_countryFocusNode, _storyFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Select your country',
                        prefixIcon: const Icon(Icons.flag),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _storyController,
                      focusNode: _storyFocusNode,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(_storyFocusNode, _passwordFocusNode);
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Life story',
                        prefixIcon: const Icon(Icons.book),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your life story';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(
                            _passwordFocusNode, _confirmPasswordFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Password ...',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      onFieldSubmitted: (_) {
                        _confirmPasswordFocusNode.unfocus();
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm password ...',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Register',
                          style: TextStyle(fontSize: 20)),
                    ),
                    TextButton(
                        onPressed: _clearFields,
                        child: const Text('Clear fields')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        country: _selectedCountry,
        story: _storyController.text,
        password: _passwordController.text,
      );
      _formKey.currentState!.save();

      Navigator.pushNamed(
        context,
        '/second',
        arguments: user,
      );
    } else {
      _showDialog();
      _showMessage();
    }
  }

  void _clearFields() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _storyController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void _fieldFocusChange(FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _showMessage() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registration successful'),
          content: const Text('You have successfully registered!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
