#!/system/bin/sh

echo 65535 1 > /proc/swpm/enable
echo 1 > /proc/swpm/pmu_ms_mode
echo 1 > /proc/swpm/swpm_pmsr_trigger

