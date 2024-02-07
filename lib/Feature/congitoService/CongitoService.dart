import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Gobal File/GobalVariable.dart';

class AuthService {
  final CognitoUserPool _userPool = CognitoUserPool(
    'ap-south-1_O3xYAhbVR', //<--dev1 enivorment
    '2kuq0nbjv9d8gevm0oqbjc5gsj', // <-- dev1 mobile client id,dev1 web clientid: 551d5sdrbvoabpgtm7bapn676h
  );

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<dynamic> signIn(String username, String password) async {
    print("CognitoUser service");
    final user = CognitoUser(username, _userPool, storage: _userPool.storage);
    final authDetails = AuthenticationDetails(
      username: username,
      password: password,
    );

    try {
      var session = await user.authenticateUser(authDetails);
      if (session != null) {
        tokenId = session.getIdToken().getJwtToken()!;
        var tokenIdrt=session.accessToken.getTokenUse();

//var sessionNew = await user.refreshSession() ;
        sessionCurrent = session;
        //   testSession = session;
        saveSession(session, username, password);
        // final prefs = await SharedPreferences.getInstance();
        // final tokenId3 = prefs.getString('tokenId');
        //   print("login save session:tokenId3:$tokenId3");
      }

      print("signIn sessionCurr$sessionCurrent::");
      return session;
    } catch (e) {
      print("inside error");
      if (e is CognitoClientException) {
        print("e.message${e.message}");
        print("errorFound.$e");
        return e.message.toString();
      } else {
        print("Authentication Error: $e");
      }
      return null;
    }
  }

  //
  Future<void> saveSession(
      CognitoUserSession session, String userName, String password) async {
    try {
      print("save session");

      // final Map<String, dynamic> sessionMap = session.toMap();
      // await secureStorage.write(
      //   key: 'sessionCurrent',
      //   value: json.encode(sessionMap),
      // );
      var refersehToken= session.refreshToken;
  print("refreshToken:${refersehToken!.token.toString()}");
      await secureStorage.write(
        key: 'tokenId',
        value: session.getIdToken().getJwtToken().toString(),
      );
      await secureStorage.write(
        key: 'refreshToken',
        value: refersehToken.token!.toString(),
      );
      await secureStorage.write(key: 'username', value: userName);
      await secureStorage.write(key: 'password', value: password);


   print("long");
     //  CognitoRefreshToken? refreshTokenPrint = (await secureStorage.read(key: 'refreshToken')) as CognitoRefreshToken;

  String? refreshTokenString = await secureStorage.read(key: 'refreshToken');
        CognitoRefreshToken? refreshToken = refreshTokenString != null ? CognitoRefreshToken(refreshTokenString) : null;

       
       String ?username = (await secureStorage.read(key: 'username')) ;
       print("username:$username");

      print("getxx:${refreshToken!.token!.toString()}");

    } catch (e) {
      print("Error saving session: $e");
      // Handle the error as needed
    }
  }

  ////
  ///
  ///
  //

  Future<bool> isValidSession() async {
    CognitoUserSession? updatedSession;

    try {
      final tokenIdCache = await secureStorage.read(key: 'tokenId');
      final username = await secureStorage.read(key: 'username');
      final password = await secureStorage.read(key: 'password');

      print(
          "login save session:isValidSession:tokenIdCache:$username:$password");

      if (tokenIdCache != null && tokenIdCache.isNotEmpty) {
        final user =
            CognitoUser(username, _userPool, storage: _userPool.storage);
        final authDetails = AuthenticationDetails(
          username: username,
          password: password,
        );

        updatedSession = await user.authenticateUser(authDetails);
        if (updatedSession != null) {
          // Access the JWT token from the updated session
          var updatedJwtToken =
              updatedSession.getIdToken().getJwtToken().toString();
          print("Updated JWT Token: $updatedJwtToken");

          tokenId = updatedJwtToken;

          saveSession(updatedSession, username!, password!);
        } else {
          print("Failed to refresh session.");
          return false;
        }

        return true;
      }
    } catch (e) {
      // Handle errors, session is not valid
      print("Session is not valid: $e");
      return false;
    }

    return false;
  }

  //REFRESH
  Future<void> refreshToken(CognitoUserSession session) async {
    try {
      final idToken = session.idToken;

      // Extracting the username from the ID token payload
      final username = idToken.payload['cognito:username'];
      print("username:$username");

      if (username != null) {
        final user =
            CognitoUser(username, _userPool, storage: _userPool.storage);

        // Use refreshSession to obtain new tokens
        final refreshedSession =
            await user.refreshSession(session.refreshToken!);

        print("refreshedSession :$refreshedSession");
        if (refreshedSession != null) {
          print("refrreesshhhhh tokemnnnnn");
          // Update the tokenId with the new JWT token
          tokenId = refreshedSession.getIdToken().getJwtToken()!;
        }
      } else {
        print("Error: Username not found in the ID token payload");
      }
    } catch (e) {
      print("Refresh Token Error: $e");
    }
  }

  Future<bool> forgotPassword(String username) async {
    final user = CognitoUser(username, _userPool, storage: _userPool.storage);

    try {
      var res = await user.forgotPassword();
      print("otpSend");
      print(res);
      return true;
    } catch (e) {
      print("Forgot Password Error: $e");
      return false;
    }
  }

  Future<bool> verifyOTP(String username, String enteredOTP) async {
    final user = CognitoUser(username, _userPool, storage: _userPool.storage);

    try {
      // The confirmForgotPassword method handles the OTP verification
      var res = await user.confirmPassword(
          enteredOTP, "null12345678A@"); // Pass null for newPassword
      print("otpVERIFIED");
      print(res);
      return true;
    } catch (e) {
      print("Verify OTP Error: $e");
      return false;
    }
  }

  Future<bool> setNewPassword(
      String username, String enteredOTP, String newPassword) async {
    final user = CognitoUser(username, _userPool, storage: _userPool.storage);

    try {
      // This will set the new password after OTP verification
      var res = await user.confirmPassword(enteredOTP, newPassword);
      print("passward set new");
      print(res);
      return true;
    } catch (e) {
      print("Set Password Error: $e");
      return false;
    }
  }
}
