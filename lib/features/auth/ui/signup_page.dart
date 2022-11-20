import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/ui/login_page.dart';
import 'package:ninecoin/features/home/ui/home_page.dart';
import 'package:ninecoin/features/home/ui/home_view.dart';
import 'package:ninecoin/model/auth/register/user_register.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/create_account.dart';
import 'package:ninecoin/utilities/dialogs/successful_create.dart';
import 'package:ninecoin/widgets/form_messages.dart';
import '../../../utilities/dialogs/error_dialoge.dart';
import '../services/auth.dart';

String? gender;
String? state;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (context) => const SignupPage());
  }

  @override
  State<SignupPage> createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  //TextEditingController state = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController country = TextEditingController(text: 'Malaysia');
  TextEditingController password = TextEditingController();
  TextEditingController checkPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  String? emails;
  bool isLoading = false;
    String deviceTokenToSendPushNotification = "";




   void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      print('Firebase');
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
      }
    });

    super.initState();
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CoinColors.black,
          appBar: AppBar(
            backgroundColor: CoinColors.black12,
            centerTitle: true,
            title: Text(
              "Sign Up",
              style: CoinTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              children: [
                Center(
                  child: Text("Create an Account",
                      style: CoinTextStyle.title1.copyWith(
                          color: CoinColors.orange,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(hintText: "User Name"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "username required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 21.5),
                TextFormField(
                  key: _emailFormFieldKey,
                  onSaved: (newEmail) {
                    setState(() {
                      emails = newEmail;
                    });
                  },
                  controller: email,
                  onChanged: (newEmail) {
                    _emailFormFieldKey.currentState!.validate();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (newEmail) {
                    if (newEmail!.isEmpty) {
                      return kEmailNullError;
                    } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
                      return kInvalidEmailError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 21.5),
                TextFormField(
                  controller: contactNumber,
                  decoration: const InputDecoration(hintText: "Contact Number"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Contact Number required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 21.5),
                _InputGender(
                  gender: gender,
                ),
                const SizedBox(height: 21.5),
                TextFormField(
                  controller: address,
                  decoration: const InputDecoration(hintText: "Address"),
                  onChanged: (value) {
                    //print(gender);
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Address required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 21.5),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.25,
                      child: TextFormField(
                        controller: city,
                        decoration: const InputDecoration(hintText: "City"),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "City required";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 18),
                    _StateInput(
                      state: state,
                    ),
                  ],
                ),
                const SizedBox(height: 21.5),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.25,
                      child: TextFormField(
                        controller: postalCode,
                        decoration:
                            const InputDecoration(hintText: "Postal Code"),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Postal Code required";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: size.width / 2.25,
                      child: TextFormField(
                        controller: country,
                        decoration: const InputDecoration(hintText: "Country"),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Country required";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 21.5),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 21.5),
                TextFormField(
                  controller: checkPassword,
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: "Re-enter Password"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Re-Password required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 21.5),
                const _TermsAndCondition(),
                const SizedBox(height: 21.5),
                ElevatedButton(
                  onPressed: () async {
                    getDeviceTokenToSendNotification();
                    if (_formKey.currentState!.validate()) {
                      if (await showCreateAccountDialog(context)) {
                        setState(() {
                          isLoading = true;
                        });
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email.text);
                        if (emailValid) {
                          UserRegister user = UserRegister(
                              name: username.text,
                              email: email.text,
                              gender: gender,
                              address:
                                  "${address.text} ${city.text} $state ${postalCode.text} ${country.text}",
                              point: "",
                              qrcode: "",
                              avatarphotourl: "",
                              phonenumber: contactNumber.text,
                              password: password.text,
                              confirmPassword: checkPassword.text);

                          registerUser(registerUser: user).then((value) async {
                            if (await showSuccessfulCreateAccountDialog(
                                context)) {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(context, LoginPage.route());
                            }
                          }).catchError((err) async {
                            setState(() {
                              isLoading = false;
                            });
                            await showErrorDialog(context, "Error", "$err");
                          });
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          await showErrorDialog(
                              context, "Error", "Email is not valid");
                        }
                      }
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Sign up"),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Already have an account?",
                        style: CoinTextStyle.title3,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, LoginPage.route());
                      },
                      child: Text("Sign In", style: CoinTextStyle.orangeTitle3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// State DropDown Button
class _StateInput extends StatefulWidget {
  String? state;
  _StateInput({this.state, Key? key}) : super(key: key);

  @override
  State<_StateInput> createState() => _StateInputState();
}

class _StateInputState extends State<_StateInput> {
  List<String> states = [
    "Johor",
    "Kedah",
    "Kelantan",
    "Malacca",
    "Negeri Sembilan",
    "Pahang",
    "Penang",
    "Perak",
    "Perlis",
    "Sabah",
    "Sarawak",
    "Selangor",
    "Terengganu"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      width: size.width / 2.6,
      decoration: BoxDecoration(
          color: CoinColors.black12,
          border: Border.all(color: CoinColors.black12),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          dropdownColor: CoinColors.black26,
          borderRadius: BorderRadius.circular(12),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey[700],
          ),
          value: widget.state,
          hint: Text("Select State",
              style: CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
          isExpanded: true,
          iconSize: 36,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              widget.state = newValue;
              state = widget.state;
              //state = widget.state;

              //state = widget.state;
            });
          },
          items: List.generate(
            states.length,
            (index) {
              return DropdownMenuItem(
                  value: states[index], child: Text(states[index]));
            },
          ),
        ),
      ),
    );
  }
}

class _InputCity extends StatefulWidget {
  String? city;
  _InputCity({
    this.city,
    Key? key,
  }) : super(key: key);

  @override
  State<_InputCity> createState() => _InputCityState();
}

class _InputCityState extends State<_InputCity> {
  List<String> cities = ["Paris", "London", "New York"];

  String? selectCity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: CoinColors.black12,
            border: Border.all(color: CoinColors.black12),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: widget.city,
            dropdownColor: CoinColors.black12,
            borderRadius: BorderRadius.circular(12),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
            ),
            hint: Text("City",
                style:
                    CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
            isExpanded: true,
            iconSize: 36,
            underline: const SizedBox(),
            onChanged: (String? city) {
              setState(() {
                widget.city = city!;
              });
            },
            items: List.generate(
              cities.length,
              (index) {
                return DropdownMenuItem(
                    value: cities[index], child: Text(cities[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InputState extends StatefulWidget {
  String? states;
  _InputState({
    this.states,
    Key? key,
  }) : super(key: key);

  @override
  State<_InputState> createState() => _InputStateState();
}

class _InputStateState extends State<_InputState> {
  List<String> states = ["Sabah", "Sarawak	", "Selangor"];

  String? selectState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: CoinColors.black12,
            border: Border.all(color: CoinColors.black12),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: widget.states,
            dropdownColor: CoinColors.black12,
            borderRadius: BorderRadius.circular(12),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
            ),
            hint: Text("State",
                style:
                    CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
            isExpanded: true,
            iconSize: 36,
            underline: const SizedBox(),
            onChanged: (String? state) {
              setState(() {
                widget.states = state!;
              });
            },
            items: List.generate(
              states.length,
              (index) {
                return DropdownMenuItem(
                    value: states[index], child: Text(states[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InputGender extends StatefulWidget {
  String? gender;
  _InputGender({this.gender, Key? key}) : super(key: key);

  @override
  State<_InputGender> createState() => _InputGenderState();
}

class _InputGenderState extends State<_InputGender> {
  List<String> genders = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: CoinColors.black12,
          border: Border.all(color: CoinColors.black12),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          dropdownColor: CoinColors.black26,
          borderRadius: BorderRadius.circular(12),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey[700],
          ),
          value: widget.gender,
          hint: Text("Select Gender",
              style: CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
          isExpanded: true,
          iconSize: 36,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              widget.gender = newValue;
              gender = widget.gender;
            });
          },
          items: List.generate(
            genders.length,
            (index) {
              return DropdownMenuItem(
                  value: genders[index], child: Text(genders[index]));
            },
          ),
        ),
      ),
    );
  }
}

class _TermsAndCondition extends StatefulWidget {
  const _TermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  State<_TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<_TermsAndCondition> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Checkbox(
            side: const BorderSide(color: CoinColors.white, width: 1.8),
            checkColor: CoinColors.white,
            // fillColor: CoinColors.dialogTextColor,
            activeColor: CoinColors.dialogTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            value: isChecked,
            onChanged: (bool? state) {
              setState(() {
                isChecked = state;
              });
            },
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: RichText(
            text: TextSpan(
                text: "By Continuing Sign up you agree to the following our",
                style: CoinTextStyle.title3,
                children: [
                  TextSpan(
                      text: " Term & privacy policy.",
                      style: CoinTextStyle.orangeTitle3)
                ]),
          ),
        ),
      ],
    );
  }
}

class _InputPostCode extends StatefulWidget {
  String? postalCode;
  _InputPostCode({
    this.postalCode,
    Key? key,
  }) : super(key: key);

  @override
  State<_InputPostCode> createState() => _InputPostCodeState();
}

class _InputPostCodeState extends State<_InputPostCode> {
  List<String> postCodes = ["34544", "34000", "91200"];

  String? selectPostCode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: CoinColors.black12,
            border: Border.all(color: CoinColors.black12),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: widget.postalCode,
            dropdownColor: CoinColors.black12,
            borderRadius: BorderRadius.circular(12),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
            ),
            hint: Text("Post Code",
                style:
                    CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
            isExpanded: true,
            iconSize: 36,
            underline: const SizedBox(),
            onChanged: (String? code) {
              setState(() {
                widget.postalCode = code!;
              });
            },
            items: List.generate(
              postCodes.length,
              (index) {
                return DropdownMenuItem(
                    value: postCodes[index], child: Text(postCodes[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InputCountry extends StatefulWidget {
  String? country;
  _InputCountry({
    this.country,
    Key? key,
  }) : super(key: key);

  @override
  State<_InputCountry> createState() => _InputCountryState();
}

class _InputCountryState extends State<_InputCountry> {
  List<String> countries = ["America", "Dubai", "Malasia"];

  String? selectCountry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: CoinColors.black12,
            border: Border.all(color: CoinColors.black12),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: widget.country,
            dropdownColor: CoinColors.black12,
            borderRadius: BorderRadius.circular(12),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[700],
            ),
            hint: Text("Country",
                style:
                    CoinTextStyle.title3.copyWith(color: CoinColors.black54)),
            isExpanded: true,
            iconSize: 36,
            underline: const SizedBox(),
            onChanged: (String? state) {
              setState(() {
                widget.country = state!;
              });
            },
            items: List.generate(
              countries.length,
              (index) {
                return DropdownMenuItem(
                    value: countries[index], child: Text(countries[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
