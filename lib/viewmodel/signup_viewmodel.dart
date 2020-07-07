import 'package:flutter/material.dart';
import 'package:news_api/constant/route_names.dart';
import 'package:news_api/locator.dart';
import 'package:news_api/services/authentication_service.dart';
import 'package:news_api/services/navigtion_service.dart';
import 'package:news_api/viewmodel/base_model.dart';

class SignupViewModel extends BaseModel {
  final AuthenticationSerivice _authenticationSerivice =
      locator<AuthenticationSerivice>();
  final NavigationService _navigationService = locator<NavigationService>();
  void _showSnap(String message, scaffloldKey) {
    scaffloldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(message),
      ),
    );
  }

  Future signup({String email, String password, scaffloldKey}) async {
    try {
      setBusy(true);
      var message = await _authenticationSerivice.signup(
          email: email, password: password);
      _showSnap(message, scaffloldKey);
      _navigationService.removeAllAndNavigateTo(HomeContainerRoute);
      setBusy(false);
    } catch (e) {
      setBusy(false);
      _showSnap(e, scaffloldKey);
    }
  }
}
