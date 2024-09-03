import 'package:flutter/material.dart';
import 'package:nectar/ui/landing/landing.dart';
import 'package:nectar/ui/onboarding/onboarding.dart';
import 'package:nectar/ui/wrapper/wrapper_viewmodel.dart';
import 'package:provider/provider.dart';

class NectarWrapper extends StatefulWidget {
  const NectarWrapper({super.key});

  @override
  State<NectarWrapper> createState() => _NectarWrapperState();
}

class _NectarWrapperState extends State<NectarWrapper> {
  @override
  Widget build(BuildContext context) {
    return (context.watch<WrapperViewmodel>().changeview) ? const LandingScreen(): const OnBoardingScreen();
  }
}