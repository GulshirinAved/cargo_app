import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../language/language.dart';

class _OnboardingScreenState extends State<LanguageScreen> {
  Future<bool> _getOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  Future<void> _setOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }

  @override
  void initState() {
    super.initState();
    _getOnboardingStatus().then((bool value) {
      if (value) {
        // Onboarding has been completed before, navigate to the main content
        Navigator.pushReplacementNamed(
            context, '/main'); // Replace with your main route name
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
