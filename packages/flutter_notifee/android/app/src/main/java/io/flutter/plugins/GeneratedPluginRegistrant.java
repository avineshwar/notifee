package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.invertase.notifee.flutter_notifee.NotifeeFlutterPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    NotifeeFlutterPlugin.registerWith(registry.registrarFor("io.invertase.notifee.flutter_notifee.NotifeeFlutterPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
