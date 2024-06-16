import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/utils/constants/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  static bool _isPasswordVisible = false;
  static bool _rememberTheUser = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: CColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade100,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: SafeArea(
              child: LoaderOverlay(
                overlayColor: CColors.primaryColor.withOpacity(0.4),
                useDefaultLoading: false,
                overlayWidgetBuilder: (progress) {
                  return const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: CColors.primaryColor,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 10,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Sign in to your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.1),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Enter your email and password to log in",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Form(
                                  key: _loginFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Email address",
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                      ),
                                      const SizedBox(height: 15),
                                      TextFormField(
                                        controller: passwordController,
                                        obscureText: !_isPasswordVisible,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              togglePasswordVisibility();
                                            },
                                            icon: Icon(_isPasswordVisible
                                                ? Icons.visibility
                                                : Icons
                                                    .visibility_off_outlined),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: Checkbox(
                                                  activeColor:
                                                      CColors.primaryColor,
                                                  value: _rememberTheUser,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _rememberTheUser =
                                                          !_rememberTheUser;
                                                    });
                                                  },
                                                ),
                                              ),
                                              const Text(
                                                "Remember me",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: CColors.primaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            context.loaderOverlay.show();
                                          });
                                        },
                                        child: const Text("Log In"),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text.rich(
                                        textAlign: TextAlign.center,
                                        TextSpan(
                                          text: "Don't have an account ? ",
                                          children: [
                                            TextSpan(
                                              text: "Sign Up",
                                              style: TextStyle(
                                                color: CColors.primaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
