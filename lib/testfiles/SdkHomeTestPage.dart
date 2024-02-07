import 'dart:async';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//x-import 'package:partner_app/Custom_Plugins/spintly_ouath_sdk/lib/spintly_oauth_manager.dart';
import 'package:partner_app/Feature/congitoService/CongitoService.dart';
import 'package:partner_app/Gobal%20File/GobalVariable.dart';
// import 'package:spintly_oauth_sdk_plugin/authorization_callback.dart';
// import 'package:spintly_oauth_sdk_plugin/spintly_oauth_manager.dart';
// import 'package:partner_app/Gobal%20File/GobalVariable.dart';
// import 'package:spintly_oauth_sdk_plugin/authorization_callback.dart';
// import 'package:spintly_oauth_sdk_plugin/spintly_oauth_manager.dart';


// // //
// import 'package:spintly_ouath_sdk/authorization_callback.dart';
// import 'package:spintly_ouath_sdk/spintly_oauth_manager.dart';



//
//import 'package:partner_app/Custom_Plugins/spintly_ouath_sdk/lib/authorization_callback.dart' as spintly;
//x-import 'package:partner_app/Custom_Plugins/spintly_ouath_sdk/lib/authorization_callback.dart' as spintlyxyt;
//import 'package:spintly_ouath_sdk/.dart' ;



String clientjtwkToken="";
class SdkTestHomePage extends StatefulWidget {
  const SdkTestHomePage({super.key});

  @override
  State<SdkTestHomePage> createState() => _SdkTestHomePageState();
}

class _SdkTestHomePageState extends State<SdkTestHomePage> {
  var _clientId ="109c23b8-ced3-4125-b952-a048b4fbdb52";
  var _provider ="5102fc0f-ccec-485c-b2ea-ec363e7bfe2b";
  var _environment ="dev1";

final AuthService _authService = AuthService();

  //SpintlyOauthManager? _oauthManager;
  
  final CognitoUserPool _userPool = CognitoUserPool(
    'ap-south-1_O3xYAhbVR', //<--dev1 enivorment
    '2kuq0nbjv9d8gevm0oqbjc5gsj', // <-- dev1 mobile client id,dev1 web clientid: 551d5sdrbvoabpgtm7bapn676h
  );

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

   Future<String> getClientIdToken() async {

 print("getClientIdToken:");
      final username = await secureStorage.read(key: 'username');

      final tokenIdJtk = await secureStorage.read(key: 'tokenId');
      clientjtwkToken=tokenIdJtk!;
     
  String? refreshTokenString = await secureStorage.read(key: 'refreshToken');
        CognitoRefreshToken? refreshToken = refreshTokenString != null ? CognitoRefreshToken(refreshTokenString) : null;

      print("getClientIdToken refresh:${refreshToken!.token!.toString()}");
    final user = CognitoUser(username, _userPool, storage: _userPool.storage);
     CognitoUserSession? session = await user.refreshSession(refreshToken) ;
          

           final idTokenJwt = session!.idToken.jwtToken;
           final accessTokenJwt = session!.accessToken.jwtToken;
 print("pow");
           print("hjty:${idTokenJwt.toString().substring(idTokenJwt!.length-100,idTokenJwt!.length)}=len  aceess-->${accessTokenJwt!.length}//:: ${accessTokenJwt.toString().substring(accessTokenJwt!.length-100,accessTokenJwt!.length)}=len${accessTokenJwt!.length}");
     print("sav ${tokenIdJtk.toString().substring(tokenIdJtk!.length-100,idTokenJwt.length)}:kkkl${idTokenJwt!.length.toString()}");
    //
    // final CognitoAuthSession result = await Amplify.Auth.fetchAuthSession(
    //     options: CognitoSessionOptions(getAWSCredentials: true),
    //   ) as CognitoAuthSession;
    String clientIdToken;
       if(accessTokenJwt!=null){
        clientIdToken=accessTokenJwt.toString();
       }
       else{
        print("didnot find token");
        clientIdToken="";
       }
      return clientIdToken;
  }

  Future<void> signInUser(
   // String username, String password
                        )
   async {
    try {
      //  var session = await _authService.signIn(
      //                          username,
      //                          password,);
      print("signInUser:}");
      String clientIdToken = await getClientIdToken();
      print("client:${clientIdToken}");
      final accessToken = await getAccessToken(clientIdToken );
      
      print("accessToken:${accessToken}");
      // await _credManager.logIn(accessToken);
      print('signInUser onSuccess');

    } catch (e) {
     // safePrint(e);
      print("ERROR 12:$e");
      signOutCurrentUser();
    }
  }


  Future<void> signOutCurrentUser() async {
    // try {

    //   await Amplify.Auth.signOut();




    //   await _accessManager.stopBleScan();
    //   await _credManager.logOut(); //Logout existing credential if present
    //   await _oauthManager.clearSession();
     // refreshPage();
    // } catch (exception) {
    //   print(exception);
    // }
  }


   Future<String> getAccessToken(String clientToken) {
    print("called me :getAccessToken tanteta");
    final completer = Completer<String>();
//  var callback =AuthorizationCallback(
//         onSuccess: (session) {
//           print("onSuccess authorizationCallback");
//           String? accessToken = session.accessToken.token;
//           // login to Spintly access control now
//           completer.complete(accessToken);
//         },
//         getAuthenticationDetails: (continuation) {
//         // this is called when user is logged out or all tokens have been expired and
//         // need login parameters again from client.
//         // For Token Exchange grant type authorization:
//         print("getAuthenticationDetails here on main home");
//         //   i comented// 
//          //continuation.authenticationDetails = AuthenticationDetails.createWithTokenExchangeGrantType(clientToken);
//          continuation.continueTask();
//         // If clientToken was not available when this function was called,
//         // hold on to the continuation reference and once clientToken is acquired,
//         // repeat the above steps.
//         // Or call getSession again and repeat the process
//         },
//         onFailure: (exception) {
//           print('getAccessToken onFailure $exception');
//           completer.completeError(exception);
//         }
//     );

  //  print("called me :getAccessToken");
// importanatttttt


//  String acccessToken = _oauthManager!.getAccessToken(clientToken);
// //
//     _oauthManager!.getOrCreateSession(callback);
    return completer.future;
  }





///my new function;
///
///
//    Future<void> authenticateSdk(String accessToken) async {
//   final completer = Completer<void>();

//   var callback = AuthorizationCallback(
//     onSuccess: (session) {
//       // Authentication successful, SDK is now authenticated
//       completer.complete();
//     },
//     getAuthenticationDetails: (continuation) {
//       // Set the access token for authentication
//       // Note: Make sure the SDK provides a method like createWithAccessToken for this purpose
//       continuation.authenticationDetails =
//           AuthenticationDetails.createWithAccessToken(accessToken);
//       continuation.continueTask();
//     },
//     onFailure: (exception) {
//       print('SDK Authentication Failure: $exception');
//       completer.completeError(exception);
//     },
//   );

//   _oauthManager!.getOrCreateSession(callback);

//   return completer.future;
// }

  @override
  initState() {
    super.initState();
  
  //  _configureAmplify();

    // _oauthManager = SpintlyOauthManager(_clientId, _provider, _environment);
    // print("PUIO:${_oauthManager?.TEST}");
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("sdk Test",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 11,),),
          ],
        ),
      ),
   body: Column(children: [
    TextButton(onPressed: (){
      
   signInUser();
    }, child: Text("getAccessToken"),),
    
     TextButton(onPressed: (){
      
 //_oauthManager!.getAuthTokenSdkTest(clientjtwkToken);
    }, child: Text("testsdk"),
    ),
    
   ],),
    );
  }
}