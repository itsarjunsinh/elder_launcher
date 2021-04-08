package xyz.arjunsinh.elderlauncher

import android.app.role.RoleManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.ContactsContract
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_CONTACTS).setMethodCallHandler { call, result ->
            when (call.method) {
                "hasTelephoneFeature" -> result.success(hasTelephoneFeature())
                "launchContactsApp" -> openContactsApp()
                "launchDialerWithNumber" -> {
                    if (call.hasArgument("number")) {
                        val number = call.argument<String>("number")!!
                        openDialerWithNumber(number)
                    }
                }
                "startPhoneCall" -> {
                    if (call.hasArgument("number")) {
                        val number = call.argument<String>("number")!!
                        startPhoneCall(number)
                    }
                }
                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_CORE).setMethodCallHandler { call, result ->
            when (call.method) {
                "canSetDefaultLauncher" -> result.success(canSetDefaultLauncher())
                "getDeprecatedFavAppIds" -> result.success(getDeprecatedFavAppIds())
                "setDefaultLauncher" -> setDefaultLauncher()
                else -> result.notImplemented()
            }
        }
    }

    /*
    ** Contacts & Phone
    */

    private fun hasTelephoneFeature(): Boolean {
        val pm = applicationContext.packageManager;
        return pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY);
    }

    // TODO: Fix Contacts App opening twice.
    private fun openContactsApp() {
        val intent = Intent(Intent.ACTION_VIEW, ContactsContract.Contacts.CONTENT_URI)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (intent != null) {
            startActivity(intent)
        }
    }

    private fun openDialerWithNumber(number: String) {
        val intent = Intent(Intent.ACTION_DIAL)
        intent.data = Uri.parse("tel:$number")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (intent != null) {
            startActivity(intent)
        }
    }

    private fun startPhoneCall(number: String) {
        val intent = Intent(Intent.ACTION_CALL)
        intent.data = Uri.parse("tel:$number")
        if (intent != null) {
            startActivity(intent)
        }
    }

    /*
    ** Core
    */

    private fun canSetDefaultLauncher(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val roleManager = getSystemService(RoleManager::class.java)
            val roleAvailable = roleManager.isRoleAvailable(RoleManager.ROLE_HOME)
            val roleHeld = roleManager.isRoleHeld(RoleManager.ROLE_HOME)
            roleAvailable && !roleHeld
        } else {
            false
        }
    }

    private fun getDeprecatedFavAppIds(): List<String> {
        val sharedPrefs = applicationContext.getSharedPreferences("key_apps", Context.MODE_PRIVATE)
        var deprecatedFavAppIds = sharedPrefs.getStringSet("key_favorites", emptySet<String>())
        return deprecatedFavAppIds!!.toList()
    }

    private fun setDefaultLauncher() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val roleManager = getSystemService(RoleManager::class.java)
            val roleHeld = roleManager.isRoleHeld(RoleManager.ROLE_HOME)
            if (!roleHeld) {
                val roleRequestIntent = roleManager.createRequestRoleIntent(RoleManager.ROLE_HOME)
                startActivityForResult(roleRequestIntent, DEFAULT_LAUNCHER_INTENT_REQUEST_CODE) // Creates new instance of main activity if successful
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == DEFAULT_LAUNCHER_INTENT_REQUEST_CODE) {
            if (resultCode != RESULT_OK) {
                MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL_CORE)?.invokeMethod("setDefaultLauncherFailure", null)
            }
        }
    }
}
