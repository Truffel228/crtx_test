package com.example.crtex_test

import  android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

var simIn:Boolean? = null;

class SimChangeReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        if(intent != null){
            if(intent.action == "android.intent.action.SIM_STATE_CHANGED"){
                val state = intent.getStringExtra("ss");
                when(state){
                    "ABSENT"->{
                        simIn = false;
                    }
                    else->{
                        simIn = true;}
                }
            }
        }
    }
}