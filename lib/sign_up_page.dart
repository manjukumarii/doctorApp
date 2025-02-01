import 'package:doctor_app/colors.dart';
import 'package:doctor_app/provider/authentication_provider.dart';
import 'package:doctor_app/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Semicircle Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
          ),

          // Logo and Title
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset("assets/images/logo.png"),
                ),
                const SizedBox(height: 5),
                Text(
                  "Your Doctor",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Sign Up Form
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: authenticationProvider.emailController,
                  style: const TextStyle(fontSize: 14), // Smaller text size
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(fontSize: 12), // Hint text smaller
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12), // Smaller padding
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Smaller radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.5, color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Phone Number
                const Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                IntlPhoneField(
                  controller: authenticationProvider.phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 14), // Smaller text size
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(fontSize: 12), // Smaller hint text
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12), // Adjust padding
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.5, color: primaryColor),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print("Phone number: ${phone.completeNumber}");
                  },
                ),

                // Password Field
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: authenticationProvider.passwordController,
                  obscureText: !authenticationProvider.isVisible,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.5, color: primaryColor),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        authenticationProvider.toogleVisibility();
                      },
                      icon: authenticationProvider.isVisible
                          ? Icon(Icons.visibility, color: primaryColor)
                          : Icon(Icons.visibility_off, color: primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email =
                          authenticationProvider.emailController.text.trim();
                      String phone =
                          authenticationProvider.phoneController.text.trim();
                      String password =
                          authenticationProvider.passwordController.text.trim();

                      if (email.isEmpty || phone.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Fill all required blanks")));
                      } else {
                        await authenticationProvider.loginUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("User signed up successfully!")),
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Or continue with",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "facebook",
                              style: TextStyle(color: blue),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/google_logo.png",
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "google",
                              style: TextStyle(color: blue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("you have account already?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInPage();
                          }));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
