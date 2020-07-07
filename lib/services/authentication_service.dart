import 'package:flutter_auth0/flutter_auth0.dart';

class AuthenticationSerivice {
  static final String clientId = '6wHsffvYN3uy2vECisRv4jKJcjQhk131';
  static final String domain = "cyuket.auth0.com";
  Auth0 auth = Auth0(baseUrl: 'https://$domain/', clientId: clientId);

  signup({String email, String password}) async {
    try {
      await auth.auth.createUser({
        'email': email,
        'password': password,
        'connection': 'Username-Password-Authentication'
      });
      var message = 'Signup successfull';
      return message;
    } catch (e) {
      print(e);
    }
  }

  signIn({String email, String password}) async {
    try {
      await auth.auth.passwordRealm({
        'username': email,
        'password': password,
        'realm': 'Username-Password-Authentication'
      });
      var message = 'Signin successfull';
      return message;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
