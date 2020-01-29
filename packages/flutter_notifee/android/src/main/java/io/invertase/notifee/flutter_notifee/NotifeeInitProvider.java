package io.invertase.notifee.flutter_notifee;

import android.util.Log;

import app.notifee.core.InitProvider;
import app.notifee.core.Notifee;
import app.notifee.core.NotifeeConfig;

public class NotifeeInitProvider extends InitProvider {
    @Override
    public boolean onCreate() {
        boolean onCreate = super.onCreate();
        Log.d("ELLIOT", "INIT");
        NotifeeConfig.Builder configBuilder = new NotifeeConfig.Builder();
        configBuilder.setJsonConfig("{}");
//        configBuilder.setProductVersion(BuildConfig.VERSION_NAME);
//        configBuilder.setFrameworkVersion(getReactNativeVersionString());
//        configBuilder.setEventSubscriber(new NotifeeEventSubscriber());

        Notifee.configure(configBuilder.build());
        return onCreate;
    }

}
