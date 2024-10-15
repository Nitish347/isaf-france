import 'package:flutter/material.dart';
import 'package:isaf/widgets/custom_textfields.dart';
import 'package:sign_in_button/sign_in_button.dart'; // Add this line if using the sign_in_button package

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _selectedCountry = 'India';
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 24),
                Center(
                  child: SignInButton(
                    
                    Buttons.google,
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    onPressed: () {
                      // Implement Google Sign-In functionality here
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Container(
                      color: Colors.grey,
                      height: 1
                    )),
                    Center(
                      child: Text(
                        ' or ',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Container(
                        color: Colors.grey,
                        height: 1
                    )),
                  ],
                ),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  labelText: 'First Name',
                  controller: _firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Last Name',
                  controller: _lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Phone Number',
                  controller: _phoneNumberController,
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
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  isPassword: true,
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
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isPassword: true,
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
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCountry,
                  decoration: InputDecoration(
                    labelText: 'Country of Residence',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  ),
                  items: <String>['India', 'France'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountry = newValue!;
                    });
                  },
                ),
                SizedBox(height: 16),
                CheckboxListTile(
                  title: Text('I accept the terms and conditions'),
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.deepPurple,
                ),
                SizedBox(height: 24),
                InkWell(
                  onTap: (){
                    if (_formKey.currentState!.validate() && _termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted Successfully')),
                      );
                    } else if (!_termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please accept the terms and conditions')),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height*0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 16),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
