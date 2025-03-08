# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
  
for i in /system/product/etc/sysconfig/*; do
    file=$i
    file=${file/\/system\/product\/etc\/sysconfig\//}
    if [ ! -z "$(grep PIXEL_2020_ $i)" ] || [ ! -z "$(grep PIXEL_2021_ $i)" ] || [ ! -z "$(grep PIXEL_2019_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2018_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2017_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2022_ $i)" ]; then
        [ ! -f $MODPATH/system/product/etc/sysconfig/$file ] && cat /system/product/etc/sysconfig/$file | grep -v PIXEL_2020_ | grep -v PIXEL_2021_ | grep -v PIXEL_2022_ | grep -v PIXEL_2018_PRELOAD | grep -v PIXEL_2019_PRELOAD >$MODPATH/system/product/etc/sysconfig/$file
    fi
done
for i in /system/etc/sysconfig/*; do
    file=$i
    file=${file/\/system\/etc\/sysconfig\//}
    if [ ! -z "$(grep PIXEL_2020_ $i)" ] || [ ! -z "$(grep PIXEL_2021_ $i)" ] || [ ! -z "$(grep PIXEL_2019_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2018_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2017_PRELOAD $i)" ] || [ ! -z "$(grep PIXEL_2022_ $i)" ]; then
        [ ! -f $MODPATH/system/product/etc/sysconfig/$file ] && cat /system/etc/sysconfig/$file | grep -v PIXEL_2020_ | grep -v PIXEL_2021_ | grep -v PIXEL_2022_ | grep -v PIXEL_2018_PRELOAD | grep -v PIXEL_2019_PRELOAD | grep -v PIXEL_2017_PRELOAD >$MODPATH/system/etc/sysconfig/$file
    fi
done
if [ -d /data/adb/modules/PixelifyPhotos/system/product/etc/sysconfig ]; then
    for i in /data/adb/modules/PixelifyPhotos/system/product/etc/sysconfig/*; do
        file=$i
        file=${file/\/data\/adb\/modules\/PixelifyPhotos\/system\/product\/etc\/sysconfig\//}
        if [ ! -f $MODPATH/system/product/etc/sysconfig/$file ]; then
            cp -f /data/adb/modules/PixelifyPhotos/system/product/etc/sysconfig/$file $MODPATH/system/product/etc/sysconfig/$file
        fi
    done
fi
if [ -d /data/adb/modules/PixelifyPhotos/system/etc/sysconfig ]; then
    for i in /data/adb/modules/PixelifyPhotos/system/etc/sysconfig/*; do
        file=$i
        file=${file/\/data\/adb\/modules\/PixelifyPhotos\/system\/etc\/sysconfig\//}
        if [ ! -f $MODPATH/system/etc/sysconfig/$file ]; then
            cp -f /data/adb/modules/PixelifyPhotos/system/etc/sysconfig/$file $MODPATH/system/etc/sysconfig/$file
        fi
    done
fi
echo "Executing commands"

# Execute commands needed to activate Circle to Search
cmd device_config put launcher long_press_home_button_to_search true

cmd device_config put launcher long_press_home_button_to_search_mpr true

cmd device_config put launcher press_hold_nav_handle_to_search true

cmd device_config put launcher press_hold_nav_handle_to_search_mpr true

cmd device_config put launcher ENABLE_SETTINGS_OSE_CUSTOMIZATIONS true

cmd device_config put launcher ENABLE_LONG_PRESS_NAV_HANDLE true

cmd device_config put launcher ENABLE_LONG_PRESS_NAV_HANDLE_MPR true

cmd device_config put launcher INVOKE_OMNI_LPH true

cmd device_config put launcher INVOKE_OMNI_LPH_MPR true

cmd device_config set_sync_disabled_for_tests persistent

echo "Commands executed successfully! Reboot to to apply changes"

