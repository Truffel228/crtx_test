package com.example.crtex_test

import android.annotation.SuppressLint
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.telephony.SubscriptionManager
import androidx.annotation.RequiresApi

var isSimInside:Boolean? = null;

class MainActivity: FlutterActivity() {
    private val METHOD_CHANEL_NAME = "crtex_test_method_channel";
    private lateinit var channel: MethodChannel

    val simChangeReceiver = SimChangeReceiver();
    val intentFilter = IntentFilter("android.intent.action.SIM_STATE_CHANGED");


    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,METHOD_CHANEL_NAME);
        
        channel.setMethodCallHandler { call, result ->  if(call.method == "checkSimState"){
            registerReceiver(simChangeReceiver, intentFilter);
            result.success(simIn);
        } }
    }
}

