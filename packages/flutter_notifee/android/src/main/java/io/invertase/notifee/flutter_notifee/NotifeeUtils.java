package io.invertase.notifee.flutter_notifee;

import android.app.ActivityManager;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.Bundle;
import android.os.Parcelable;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.notifee.core.EventSubscriber;
import io.flutter.plugin.common.MethodChannel;

public class NotifeeUtils {

    /**
     * @param result
     * @param e
     */
    static void resultResolver(MethodChannel.Result result, Exception e) {
        if (e != null) {
            result.error("flutter_notifee", e.getMessage(), e);
        } else {
            result.success(null);
        }
    }

    static void resultResolver(MethodChannel.Result result, Exception e, Bundle bundle) {
        if (e != null) {
            result.error("flutter_notifee", e.getMessage(), e);
        } else if (bundle == null) {
            result.success(null);
        } else {
            HashMap foo = createHashMapFromBundle(bundle);
            result.success(foo);
        }
    }

    static void resultResolver(MethodChannel.Result result, Exception e, List<Bundle> bundleList) {
        if (e != null) {
            result.error("flutter_notifee", e.getMessage(), e);
        } else if (bundleList == null || bundleList.size() == 0) {
            result.success(Collections.emptyList());
        } else {
            ArrayList<HashMap> list = new ArrayList<>(bundleList.size());
            for (Bundle bundle : bundleList) {
                list.add(createHashMapFromBundle(bundle));
            }
            result.success(list);
        }
    }

    static HashMap<String, Object> createHashMapFromBundle(@NonNull Bundle bundle) {
        HashMap<String, Object> hashMap = new HashMap<>();

        for (String key : bundle.keySet()) {
            Object value = bundle.get(key);

            if (value == null) {
                hashMap.put(key, null);
            } else {
                if (List.class.isAssignableFrom(value.getClass())) {
                    hashMap.put(key, createListFromObjects((List<Object>) value));
                } else if (Bundle.class.isAssignableFrom(value.getClass())) {
                    hashMap.put(key, createHashMapFromBundle((Bundle) value));
                } else {
                    hashMap.put(key, value);
                }
            }
        }

        return hashMap;
    }

    /**
     * @param map
     * @return
     */
    static Bundle createBundleFromMap(HashMap<String, Object> map) {
        if (map == null) {
            return null;
        }

        Bundle bundle = new Bundle();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            putValueInBundle(bundle, entry.getKey(), entry.getValue());
        }
        return bundle;
    }

    /**
     * @param objectList
     * @return
     */
    static ArrayList<? extends Parcelable> createListFromObjects(List<Object> objectList) {
        ArrayList list = new ArrayList(objectList.size());

        for (Object o : objectList) {
            putValueInList(list, o);
        }

        return list;
    }

    /**
     * @param bundle
     * @param key
     * @param value
     * @return
     */
    static Bundle putValueInBundle(Bundle bundle, String key, Object value) {
        if (value == null) {
            bundle.putString(key, null);
            return bundle;
        }

        if (value instanceof Boolean) {
            bundle.putBoolean(key, (Boolean) value);
        } else if (value instanceof String) {
            bundle.putString(key, (String) value);
        } else if (value instanceof Long) {
            Long longVal = (Long) value;
            bundle.putDouble(key, longVal.doubleValue());
        } else if (value instanceof Float) {
            Float floatVal = (Float) value;
            bundle.putDouble(key, floatVal.doubleValue());
        } else if (value instanceof Double) {
            bundle.putDouble(key, (Double) value);
        } else if (value instanceof Integer) {
            Integer integerVal = (Integer) value;
            bundle.putDouble(key, integerVal.doubleValue());
        } else {
            if (List.class.isAssignableFrom(value.getClass())) {
                bundle.putParcelableArrayList(key, createListFromObjects((List<Object>) value));
            } else if (Map.class.isAssignableFrom(value.getClass())) {
                bundle.putBundle(key, createBundleFromMap((HashMap<String, Object>) value));
            } else {
                // todo log error
            }
        }

        return bundle;
    }

    /**
     * @param list
     * @param value
     * @return
     */
    static List putValueInList(ArrayList list, Object value) {
        if (list == null) {
            return Collections.emptyList();
        }

        if (List.class.isAssignableFrom(value.getClass())) {
            list.add(createListFromObjects((List<Object>) value));
        } else if (Bundle.class.isAssignableFrom(value.getClass())) {
            list.add(createHashMapFromBundle((Bundle) value));
        } else if (Map.class.isAssignableFrom(value.getClass())) {
            list.add(createBundleFromMap((HashMap<String, Object>) value));
        } else {
            list.add(value);
        }

        return list;
    }

    static boolean isAppInForeground() {
        Context context = EventSubscriber.getContext();

        KeyguardManager keyguardManager =
                (KeyguardManager) context.getSystemService(Context.KEYGUARD_SERVICE);

        if (keyguardManager.isKeyguardLocked()) {
            return false;
        }

        ActivityManager activityManager = (ActivityManager) context
                .getSystemService(Context.ACTIVITY_SERVICE);
        if (activityManager == null) return false;

        List<ActivityManager.RunningAppProcessInfo> appProcesses = activityManager
                .getRunningAppProcesses();
        if (appProcesses == null) return false;

        final String packageName = context.getPackageName();

        for (ActivityManager.RunningAppProcessInfo appProcess : appProcesses) {
            if (appProcess.importance == ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND &&
                    appProcess.processName.equals(packageName)) {
                return true;
            }
        }

        return false;
    }
}
