import 'package:blnk_demo/data/cache/app_shared_pref.dart';
import 'package:blnk_demo/pages/register/viewModel/google_auth_client.dart';
import 'package:get/get.dart';
import 'package:blnk_demo/pages/register/ui/register_view.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signin;
import 'package:googleapis/drive/v3.dart';


class LoginViewModel extends GetxController{

  Future<void> signIn()async{
    final googleSignIn = signin.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
    final signin.GoogleSignInAccount? account = await googleSignIn.signIn();
    print("User account $account");
    if(account!.id != null && account.id.isNotEmpty){
      AppSharedPref.setString(AppSharedPref.KEY_STAFF_NAME, account.displayName!);
      AppSharedPref.setString(AppSharedPref.KEY_STAFF_EMAIL, account.email);
      AppSharedPref.setString(AppSharedPref.KEY_STAFF_ID, account.id);
      AppSharedPref.setString(AppSharedPref.KEY_STAFF_SERVER_CODE, account.serverAuthCode!);
      AppSharedPref.setString(AppSharedPref.KEY_STAFF_PHOTO, account.photoUrl!);

      Get.offAll(RegisterView());
    }



  }

}