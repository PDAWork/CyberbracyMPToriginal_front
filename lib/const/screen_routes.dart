sealed class ScreenRoute {
  final String routeName;

  ScreenRoute(this.routeName);
}

class HomeRoute implements ScreenRoute {
  @override
  String get routeName => "home";
}

class SignInRoute implements ScreenRoute {
  @override
  String get routeName => "sign_in";
}

class SignUpRoute implements ScreenRoute {
  @override
  String get routeName => "sign_up";
}

class PinVerificationRoute implements ScreenRoute {
  @override
  String get routeName => "pin_verification";
}

class ChatBotRoute implements ScreenRoute {
  @override
  String get routeName => "chat_bot";
}

class ControlSupervisoryRoute implements ScreenRoute {
  @override
  String get routeName => "control_supervisory_body";
}
class RequirementsRoute implements ScreenRoute {
  @override
  String get routeName => "requirements";
}

