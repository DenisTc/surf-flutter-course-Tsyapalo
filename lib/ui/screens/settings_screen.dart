import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:places/main.dart';
import 'package:places/ui/screens/onboarding_screen.dart';
import 'package:places/ui/screens/res/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,//settings.getThemeValue ? myDarkMain : Colors.white,
      appBar: const _AppBarSettings(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Тёмная тема',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                FlutterSwitch(
                  height: 32.0,
                  width: 56.0,
                  padding: 2.0,
                  toggleSize: 28.0,
                  borderRadius: 16.0,
                  inactiveColor: myInactiveBlack.withOpacity(0.56),
                  activeColor: myDarkGreen,
                  value: settings.getThemeValue,
                  onToggle: (value) {
                    setState(() {
                      settings.changeTheme(value);
                    });
                  },
                ),
              ],
            ),
            Divider(color: myLightSecondaryTwo.withOpacity(0.56)),
            const SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Смотреть туториал',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Divider(color: myLightSecondaryTwo.withOpacity(0.56)),
          ],
        ),
      ),
    );
  }
}

class _AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSettings({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Настройки',
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
        ),
      ),
    );
  }
}
