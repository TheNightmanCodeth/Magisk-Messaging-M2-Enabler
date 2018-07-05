#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

# Force-stop messaging
am force-stop com.google.android.apps.messaging
# Modify the `bugle_phenotype__enable_m2` property in the PhenotypePrefs file using sed.
sed -i '/<boolean name="bugle_phenotype__enable_m2" value="false" \/\>/c\    <boolean name="bugle_phenotype__enable_m2" value="true" \/\>' /data/data/com.google.android.apps.messaging/shared_prefs/PhenotypePrefs.xml
# Modify the `bugle_phenotype__enable_phenotype_override` property, still using sed.
sed -i '/<boolean name="bugle_phenotype__enable_phenotype_override" value="false" \/\>/c\    <boolean name="bugle_phenotype__enable_phenotype_override" value="true" \/\>' /data/data/com.google.android.apps.messaging/shared_prefs/PhenotypePrefs.xml
# Should be working now ~~ and persisting after reboots.
