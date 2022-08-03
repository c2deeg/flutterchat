import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cellPhoneController = TextEditingController();
  final TextEditingController homePhoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  int currentStep = 0;

  @override
  void initState() {
    passwordController.addListener(() => setState(() {}));
    confirmPasswordController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool activeKeyBoard =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;

    // bool isCompleted = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Palette.white,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assests.blankSplash))),
        child: SafeArea(
          child: Column(
            children: [
              Visibility(
                visible: !activeKeyBoard,
                child: const Spacer(
                  flex: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom:
                        (activeKeyBoard ? Constants.insetS : Constants.insetL)),
                child: SizedBox(
                    height: activeKeyBoard ? 60 : 100,
                    child: Image.asset(
                      Assests.logo,
                    )),
              ),
              Form(
                child: Expanded(
                  flex: activeKeyBoard ? 1 : 6,
                  child: Stepper(
                      controlsBuilder: ((context, details) {
                        return Row(
                          mainAxisAlignment: details.stepIndex != 0
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.end,
                          children: [
                            if (details.stepIndex != 0)
                              RectButton(
                                  buttonColor: Colors.blueGrey,
                                  size: ButtonSize.xsmall,
                                  fullwidth: false,
                                  text: 'BACK',
                                  onPressed: details.onStepCancel!),
                            RectButton(
                                size: ButtonSize.xsmall,
                                fullwidth: false,
                                text: details.stepIndex == 2
                                    ? 'COMPLETE'
                                    : 'NEXT',
                                onPressed: details.onStepContinue!),
                          ],
                        );
                      }),
                      onStepContinue: () {
                        if (currentStep != 2) {
                          setState(() {
                            currentStep++;
                          });
                        } else {
                          // print('Completed');
                        }
                      },
                      onStepCancel: currentStep == 0
                          ? null
                          : () {
                              if (currentStep != 0) {
                                setState(() {
                                  currentStep--;
                                });
                              }
                            },
                      type: StepperType.horizontal,
                      currentStep: currentStep,
                      onStepTapped: (index) {
                        setState(() {
                          currentStep = index;
                        });
                      },
                      steps: [
                        Step(
                          state: currentStep > 0
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: currentStep >= 0,
                          title: const Text('Personal Info'),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: Constants.hPaddingM,
                                    child: Text(
                                      'Lets start with something simple, whats your name...',
                                      style: AppText.bodyLarge(context),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              AppTextField(
                                label: 'First Name',
                                controller: firstnameController,
                              ),
                              AppTextField(
                                label: 'Last Name',
                                controller: lastnameController,
                              ),
                            ],
                          ),
                        ),
                        Step(
                          state: currentStep > 1
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: currentStep >= 1,
                          title: const Text('Account Info'),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: Constants.hPaddingM,
                                    child: Text(
                                      'Make sure to choose a good P@s\$w0rd¡',
                                      style: AppText.bodyLarge(context),
                                    ),
                                  ),
                                ],
                              ),
                              UsernameField(
                                showIcon: false,
                                controller: usernameController,
                              ),
                              PasswordField(
                                showIcon: false,
                                controller: passwordController,
                              ),
                              PasswordField(
                                showIcon: false,
                                label: 'Confirm Password',
                                controller: confirmPasswordController,
                              ),
                            ],
                          ),
                        ),
                        Step(
                          state: currentStep > 2
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: currentStep >= 2,
                          title: const Text('Contact Info'),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: Constants.hPaddingM,
                                    child: Text(
                                      'How can we reach you?',
                                      style: AppText.bodyLarge(context),
                                    ),
                                  ),
                                ],
                              ),
                              AppTextField(
                                label: 'Cellphone Number',
                                controller: cellPhoneController,
                              ),
                              AppTextField(
                                label: 'Home Number',
                                controller: homePhoneController,
                              ),
                              EmailField(
                                showIcon: false,
                                controller: emailController,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Visibility(
                visible: !activeKeyBoard,
                child: const Spacer(
                  flex: 1,
                ),
              ),
              const PoweredByUs()
            ],
          ),
        ),
      ),
    );
  }
}
