package com.vladushik.flutter_recipe

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "samples.flutter.dev/app_version"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getAppVersion") {
                val appVersion = getAppVersion()

                result.success(appVersion)

            }
        }
    }

    private fun getAppVersion(): String {
        val versionName = BuildConfig.VERSION_NAME
        return versionName
    }
}
