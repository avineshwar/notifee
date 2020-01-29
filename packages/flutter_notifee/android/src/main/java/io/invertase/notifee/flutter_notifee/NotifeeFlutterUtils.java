package io.invertase.notifee.flutter_notifee;

import android.os.Bundle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;

public class NotifeeFlutterUtils {

    static void resultResolver(MethodChannel.Result result, Exception e) {
        if (e != null) {
            result.error("flutter_notifee", e.getMessage(), e);
        } else {
            result.success(null);
        }
    }

    static Bundle createBundleFromMap(HashMap<String, Object> map) {
        if (map == null) {
            return null;
        }

        Bundle bundle = new Bundle();

        for (Map.Entry<String, Object> entry : map.entrySet()) {
            String key = entry.getKey();
            if (entry.getValue() == null) {
                bundle.putString(key, null);
            } else {
                Object value = entry.getValue();

                if (value instanceof Boolean) {
                    bundle.putBoolean(key, (Boolean) value);
                } else if (value instanceof String) {
                    bundle.putString(key, (String) value);
                } else if (value instanceof Long) {
                    Long longVal = (Long) value;
                    bundle.putDouble(key, longVal);
                } else if (value instanceof Float) {
                    float floatVal = (float) value;
                    bundle.putFloat(key, floatVal);
                } else if (value instanceof Double) {
                    bundle.putDouble(key, (double) value);
                } else if (value instanceof Integer) {
                    bundle.putInt(key, (int) value);
                } else {
                    if (List.class.isAssignableFrom(value.getClass())) {
                        // todo list
                    } else if (Map.class.isAssignableFrom(value.getClass())) {
                        bundle.putBundle(key, createBundleFromMap((HashMap<String, Object>) value));
                    } else {
                        // log
                    }
                }
            }
        }

        return bundle;
    }

}
