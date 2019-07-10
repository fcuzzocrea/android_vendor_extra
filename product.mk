PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.opa.eligible_device=true

# Themes
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay

DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/extra/overlay-lineage

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri="https://updater.oddsolutions.us/api/v1/{device}/{type}/{incr}"

# Android ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:root/adb_keys

# Recovery ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:recovery/root/adb_keys

ifneq ($(filter %berkeley,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    HwCamera2

PRODUCT_COPY_FILES := \
    vendor/extra/HwCamera2/lib/arm/libfyusenet.so:system/priv-app/HwCamera2/lib/arm/libfyusenet.so \
    vendor/extra/HwCamera2/lib/arm/libgif_maker.so:system/priv-app/HwCamera2/lib/arm/libgif_maker.so \
    vendor/extra/HwCamera2/lib/arm/libHW_Pano_f.so:system/priv-app/HwCamera2/lib/arm/libHW_Pano_f.so \
    vendor/extra/HwCamera2/lib/arm/libHwPostCamera_jni.so:system/priv-app/HwCamera2/lib/arm/libHwPostCamera_jni.so \
    vendor/extra/HwCamera2/lib/arm/libIvw35.so:system/priv-app/HwCamera2/lib/arm/libIvw35.so \
    vendor/extra/HwCamera2/lib/arm/libjni_front_panorama_beauty_hidl.so:system/priv-app/HwCamera2/lib/arm/libjni_front_panorama_beauty_hidl.so \
    vendor/extra/HwCamera2/lib/arm/libjni_front_panorama_camera2.so:system/priv-app/HwCamera2/lib/arm/libjni_front_panorama_camera2.so \
    vendor/extra/HwCamera2/lib/arm/libjni_mrc_cg_filters_camera2.so:system/priv-app/HwCamera2/lib/arm/libjni_mrc_cg_filters_camera2.so \
    vendor/extra/HwCamera2/lib/arm/libJniVoiceCapture.so:system/priv-app/HwCamera2/lib/arm/libJniVoiceCapture.so \
    vendor/extra/HwCamera2/lib/arm/libmorpho_memory_allocator.so:system/priv-app/HwCamera2/lib/arm/libmorpho_memory_allocator.so \
    vendor/extra/HwCamera2/lib/arm/libmorpho_panorama_gp.so:system/priv-app/HwCamera2/lib/arm/libmorpho_panorama_gp.so \
    vendor/extra/HwCamera2/lib/arm/libscanner.so:system/priv-app/HwCamera2/lib/arm/libscanner.so \
    vendor/extra/HwCamera2/lib/arm/libTargetTracking.so:system/priv-app/HwCamera2/lib/arm/libTargetTracking.so \
    vendor/extra/HwCamera2/lib/arm/libtrack.so:system/priv-app/HwCamera2/lib/arm/libtrack.so \
    vendor/extra/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.0.so:system/priv-app/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.0.so \
    vendor/extra/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.1.so:system/priv-app/HwCamera2/lib/arm/vendor.huawei.hardware.camera.cfgsvr@1.1.so
endif

ifneq ($(filter %nash,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    MotCamera2

PRODUCT_COPY_FILES := \
    vendor/extra/MotCamera2/lib/libDepthBokehEffect.so:system/lib/libDepthBokehEffect.so \
    vendor/extra/MotCamera2/lib/libFNVfbEngineHAL.so:system/lib/libFNVfbEngineHAL.so \
    vendor/extra/MotCamera2/lib/libMobileOcrEngine.so:system/lib/libMobileOcrEngine.so \
    vendor/extra/MotCamera2/lib/libMotDoF.so:system/lib/libMotDoF.so \
    vendor/extra/MotCamera2/lib/libSNPE.so:system/lib/libSNPE.so \
    vendor/extra/MotCamera2/lib/libSNPExecutor.so:system/lib/libSNPExecutor.so \
    vendor/extra/MotCamera2/lib/libarcso:system/lib/ft_agegender_estimation.so:system/lib/ft_agegender_estimation.so \
    vendor/extra/MotCamera2/lib/libarcso:system/lib/ft_beautyshot.so:system/lib/ft_beautyshot.so \
    vendor/extra/MotCamera2/lib/libarcso:system/lib/ft_dualcam_refocus.so:system/lib/ft_dualcam_refocus.so \
    vendor/extra/MotCamera2/lib/libbacktrace.so:system/lib/libbacktrace.so \
    vendor/extra/MotCamera2/lib/libbsDepthWrapper_01_00_000.so:system/lib/libbsDepthWrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libc++_shared.so:system/lib/libc++_shared.so \
    vendor/extra/MotCamera2/lib/libclearsight.so:system/lib/libclearsight.so \
    vendor/extra/MotCamera2/lib/libclearsight_wrapper_01_00_000.so:system/lib/libclearsight_wrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libddm_wrapper_01_00_000.so:system/lib/libddm_wrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libdualcameraddm.so:system/lib/libdualcameraddm.so \
    vendor/extra/MotCamera2/lib/libframe_stack_wrapper_morpho_v4.so:system/lib/libframe_stack_wrapper_morpho_v4.so \
    vendor/extra/MotCamera2/lib/libframe_stack_wrapper_morpho_v5.so:system/lib/libframe_stack_wrapper_morpho_v5.so \
    vendor/extra/MotCamera2/lib/libgif.so:system/lib/libgif.so \
    vendor/extra/MotCamera2/lib/libjpeg.so:system/lib/libjpeg.so \
    vendor/extra/MotCamera2/lib/liblenovo_panorama.so:system/lib/liblenovo_panorama.so \
    vendor/extra/MotCamera2/lib/libmcf-common.so:system/lib/libmcf-common.so \
    vendor/extra/MotCamera2/lib/libmcf-foundation.so:system/lib/libmcf-foundation.so \
    vendor/extra/MotCamera2/lib/libmcf-foundation2.so:system/lib/libmcf-foundation2.so \
    vendor/extra/MotCamera2/lib/libmcf-jni.so:system/lib/libmcf-jni.so \
    vendor/extra/MotCamera2/lib/libmcf-local.so:system/lib/libmcf-local.so \
    vendor/extra/MotCamera2/lib/libmcf-qc-fd-offline.so:system/lib/libmcf-qc-fd-offline.so \
    vendor/extra/MotCamera2/lib/libmcf.so:system/lib/libmcf.so \
    vendor/extra/MotCamera2/lib/libmcfutils.so:system/lib/libmcfutils.so \
    vendor/extra/MotCamera2/lib/libmorpho_cinema_graph.so:system/lib/libmorpho_cinema_graph.so \
    vendor/extra/MotCamera2/lib/libmorpho_defocusface.so:system/lib/libmorpho_defocusface \
    vendor/extra/MotCamera2/lib/libmorpho_easy_hdr.so:system/lib/libmorpho_easy_hdr.so \
    vendor/extra/MotCamera2/lib/libmorpho_image_stab5.so:system/lib/libmorpho_image_stab5.so \
    vendor/extra/MotCamera2/lib/libmorpho_image_stabilizer4.so:system/lib/libmorpho_image_stabilizer4.so \
    vendor/extra/MotCamera2/lib/libmorpho_panorama_gp3.so:system/lib/libmorpho_panorama_gp3.so \
    vendor/extra/MotCamera2/lib/libmorpho_sensor_fusion.so:system/lib/libmorpho_sensor_fusion.so
    vendor/extra/MotCamera2/lib/libmorpho_super_resolution.so:system/lib/libmorpho_super_resolution.so \
    vendor/extra/MotCamera2/lib/libmotioncore_01_00_000.so:system/lib/libmotioncore_01_00_000.so \
    vendor/extra/MotCamera2/lib/libmpbase.so:system/lib/libmpbase.so \
    vendor/extra/MotCamera2/lib/liboffline_fd_wrapper_01_00_000.so:system/lib/liboffline_fd_wrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libopenssh.so:system/lib/libopenssh.so \
    vendor/extra/MotCamera2/lib/librefocus_image_wrapper_01_00_000.so:system/lib/librefocus_image_wrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libremosaic_tuning.so:system/lib/libremosaic_tuning.so \
    vendor/extra/MotCamera2/lib/libremosaic_wrapper.so:system/lib/libremosaic_wrapper.so \
    vendor/extra/MotCamera2/lib/libremosaiclib.so:system/lib/libremosaiclib.so \
    vendor/extra/MotCamera2/lib/libsnpe-android.so:system/lib/libsnpe-android.so \
    vendor/extra/MotCamera2/lib/libsnpe_adsp.so:system/lib/libsnpe_adsp.so \
    vendor/extra/MotCamera2/lib/libsnpe_dsp_domains.so:system/lib/libsnpe_dsp_domains.so \
    vendor/extra/MotCamera2/lib/libsnpe_dsp_domains_skel.so:system/lib/libsnpe_dsp_domains_skel.so \
    vendor/extra/MotCamera2/lib/libsnpe_dsp_skel.so:system/lib/libsnpe_dsp_skel.so \
    vendor/extra/MotCamera2/lib/libsnpe_dsp_v65_domains_skel.so:system/lib/libsnpe_dsp_v65_domains_skel.so \
    vendor/extra/MotCamera2/lib/libsuper_resolution_wrapper_morpho_v2.so:system/lib/libsuper_resolution_wrapper_morpho_v2.so \
    vendor/extra/MotCamera2/lib/libsymphony-cpu.so:system/lib/libsymphony-cpu.so \
    vendor/extra/MotCamera2/lib/libsymphonypower.so:system/lib/libsymphonypower.so \
    vendor/extra/MotCamera2/lib/libubifocus_wrapper_01_00_000.so:system/lib/libubifocus_wrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib/libzxing_01_00_000.so:system/lib/libzxing_01_00_000.so \
    vendor/extra/MotCamera2/lib/libzxingwrapper_01_00_000.so:system/lib/libzxingwrapper_01_00_000.so \
    vendor/extra/MotCamera2/lib64/librcfw.so:system/lib64/librcfw.so

endif

EXCLUDE_GOOGLE_SERVICES_DEVICES += \
    %flo \
    %foster \
    %fugu \
    %hammerhead \
    %jfltexx \
    %m8 \
    %m8d \
    %molly \
    %tv_molly

ifneq ($(filter $(EXCLUDE_GOOGLE_SERVICES_DEVICES),$(TARGET_PRODUCT)),)
DISABLE_GAPPS := true
endif

ifneq ($(DISABLE_GAPPS),true)
-include vendor/google_pixel/product.mk
endif # Disable GApps
