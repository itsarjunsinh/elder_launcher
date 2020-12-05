package xyz.arjunsinh.elderlauncher

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.provider.ContactsContract
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val CHANNEL = "arjunsinh.xyz/elder_launcher"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getDeprecatedFavAppIds" -> result.success(getDeprecatedFavAppIds())
                "hasTelephoneFeature" -> result.success(hasTelephoneFeature())
                "launchContactsApp" -> result.success(openContactsApp())
                "launchDialerWithNumber" -> {
                    if(call.hasArgument("number")) {
                        val number = call.argument<String>("number")!!
                        result.success((openDialerWithNumber(number)))
                    }
                }
                "startPhoneCall" -> {
                    if(call.hasArgument("number")) {
                        val number = call.argument<String>("number")!!
                        result.success((startPhoneCall(number)))
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getDeprecatedFavAppIds(): List<String> {
        val sharedPrefs = applicationContext.getSharedPreferences("key_apps", Context.MODE_PRIVATE)
        var deprecatedFavAppIds = sharedPrefs.getStringSet("key_favorites", emptySet<String>())
        return deprecatedFavAppIds!!.toList()
    }

    private fun hasTelephoneFeature(): Boolean {
        val pm = applicationContext.packageManager;
        return pm.hasSystemFeature(PackageManager.FEATURE_TELEPHONY);
    }

    // TODO: Fix Contacts App opening twice.
    private fun openContactsApp(): Boolean {
        val intent = Intent(Intent.ACTION_VIEW, ContactsContract.Contacts.CONTENT_URI)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (intent != null) {
            startActivity(intent)
            return true
        } else {
            return false
        }
    }

    private fun openDialerWithNumber(number: String): Boolean {
        val intent = Intent(Intent.ACTION_DIAL)
        intent.data = Uri.parse("tel:$number")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (intent != null) {
            startActivity(intent)
            return true
        } else {
            return false
        }
    }

    private fun startPhoneCall(number: String): Boolean {
        val intent = Intent(Intent.ACTION_CALL)
        intent.data = Uri.parse("tel:$number")
        if (intent != null) {
            startActivity(intent)
            return true
        } else {
            return false
        }
    }
}
