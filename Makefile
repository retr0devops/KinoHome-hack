TARGET := iphone:clang:latest:7.0


include ~/theos/makefiles/common.mk

TWEAK_NAME = KinoHomeHackByRetr0

KinoHomeHackByRetr0_LOGOS_DEFAULT_GENERATOR = internal
KinoHomeHackByRetr0_FILES = Tweak.xm
KinoHomeHackByRetr0_CFLAGS = -fobjc-arc -mllvm -enable-adb -mllvm -enable-strcry -mllvm -enable-acdobf -mllvm -enable-fco -mllvm -enable-bcfobf -mllvm -sub_loop=2 -mllvm -sub_prob=100 -mllvm -bcf_cond_compl=3   -mllvm -acd-rename-methodimp -mllvm -adb_prob=100 -mllvm -enable-subobf -mllvm -acd-use-initialize -mllvm -enable-indibran -mllvm -enable-splitobf #-mllvm -enable-indibran -mllvm -bcf_loop=100 -mllvm -bcf_prob=100
KinoHomeHackByRetr0_CCFLAGS = -mllvm -enable-adb -mllvm -enable-strcry -mllvm -enable-acdobf -mllvm -enable-fco -mllvm -enable-bcfobf -mllvm -sub_loop=2 -mllvm -sub_prob=100 -mllvm -bcf_cond_compl=3   -mllvm -acd-rename-methodimp -mllvm -adb_prob=100 -mllvm -enable-subobf -mllvm -acd-use-initialize -mllvm -enable-indibran -mllvm -enable-splitobf #-mllvm -enable-indibran -mllvm -bcf_loop=3 -mllvm -bcf_prob=3



include ~/theos/makefiles/tweak.mk
