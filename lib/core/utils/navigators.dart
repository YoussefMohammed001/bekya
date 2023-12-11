import 'package:flutter/material.dart';

Future push(
  BuildContext context,
  Widget screen,
) async {
  return await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => screen),
  );
}

Future pushReplacement(
  BuildContext context,
  Widget screen,
) async {
  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

Future pushAndRemoveUntil(
  BuildContext context,
  Widget screen,
) async {
  return await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

Future pushNamed(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) async {
  return await Navigator.pushNamed(context, routeName, arguments: arguments);
}

void pushNamedAndRemove(
  context,
  routeName, {
  Object? arguments,
}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
    arguments: arguments,
  );
}

void pop(context, [dynamic result]) {
  Navigator.pop(context, result);
}
