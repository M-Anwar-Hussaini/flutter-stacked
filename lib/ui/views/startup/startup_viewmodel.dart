import 'package:flutter_stacked/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_stacked/app/app.locator.dart';
import 'package:flutter_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    if (_authenticationService.isLoggedIn) {
      _navigationService.replaceWithTextReverseView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
