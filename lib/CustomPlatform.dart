import 'package:flutter/material.dart';

abstract class CustomPlatform {
  Widget build({
    BuildContext context,
    Map creationParams,
  });
}