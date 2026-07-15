import 'package:best_of_nepal/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSettings extends ConsumerStatefulWidget {
  const ProfileSettings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileSettingsState();
}

class _ProfileSettingsState extends ConsumerState<ProfileSettings> {
  bool _switchMode = true;
  bool _notifications = true;
  bool _biometric = false;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preferences",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Dark Mode
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.dark_mode_outlined),
                              SizedBox(width: 10),
                              Text("Dark Mode"),
                            ],
                          ),
                          Switch(
                            value: _switchMode,
                            onChanged: (val) => setState(() {
                              _switchMode = val;
                            }),
                          ),
                        ],
                      ),
                      Divider(),

                      //Notification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),

                              Icon(Icons.notifications_outlined),
                              SizedBox(width: 10),
                              Text("Notifications"),
                            ],
                          ),
                          Switch(
                            value: _notifications,
                            onChanged: (val) => setState(() {
                              _notifications = val;
                            }),
                          ),
                        ],
                      ),
                      Divider(),

                      //Biometric Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),

                              Icon(Icons.fingerprint),
                              SizedBox(width: 10),
                              Text("Biometric Login"),
                            ],
                          ),
                          Switch(
                            value: _biometric,
                            onChanged: (val) => setState(() {
                              _biometric = val;
                            }),
                          ),
                        ],
                      ),
                      Divider(),

                      //Language
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.language),
                              SizedBox(width: 10),
                              Text("Language"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: DropdownButton<String>(
                              value: selectedValue,
                              items: [
                                DropdownMenuItem(
                                  value: 'English',
                                  child: Text('English'),
                                ),
                                DropdownMenuItem(
                                  value: 'Nepali',
                                  child: Text('Nepali'),
                                ),
                                DropdownMenuItem(
                                  value: 'Hindi',
                                  child: Text('Hindi'),
                                ),
                                DropdownMenuItem(
                                  value: 'Chinese',
                                  child: Text('Chinese'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),

                SizedBox(height: 5),
                Text(
                  "General",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Change Password
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(Icons.lock_outline_rounded),
                                SizedBox(width: 10),
                                Text(" Change Password"),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      Divider(),

                      //Privacy Policy
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),

                            child: Row(
                              children: [
                                SizedBox(width: 10),

                                Icon(Icons.privacy_tip_outlined),
                                SizedBox(width: 10),
                                Text("Privacy Policy"),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      Divider(),

                      //Terms & Conditions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),

                            child: Row(
                              children: [
                                SizedBox(width: 10),

                                Icon(Icons.description_outlined),
                                SizedBox(width: 10),
                                Text(" Terms & Conditions"),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      Divider(),

                      //About App
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),

                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(Icons.info_outline_rounded),
                                SizedBox(width: 10),
                                Text("About App"),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //Logout Account
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      // outline border
                      color: Colors.red,
                      width: 2,
                    ),
                    minimumSize: Size(80, 50),
                  ),
                  onPressed: () async {
                    await ref.read(authRepositoryProvider).signOut();
                    if (context.mounted) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.red, size: 22),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
