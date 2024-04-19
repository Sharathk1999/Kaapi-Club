import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaapi_club/pages/auth/widgets/login_form.dart';
import 'package:kaapi_club/pages/auth/widgets/signup_form.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;
    return Container(
      // height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                width: isLogin.value ? 100 : 0,
                                height: 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Sign up",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyMedium
                                    : Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                width: isLogin.value ? 0 : 100,
                                height: 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              Obx(() =>  isLogin.value ? LoginForm() : SignUpForm(),),
             
              ],
            ),
          ),
        ],
      ),
    );
  }
}
