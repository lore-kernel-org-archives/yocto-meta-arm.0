Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.11702.1628095311255702100
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 09:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gHKOAViD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id a19so1822653qtx.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Aug 2021 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Yocd9GH9D8Eh08QwwcCk6Y0ArCcGI/29479zCnz4VE=;
        b=gHKOAViDGXzhgIW6EsE7gGW2hL54xEjJRJpPd7XU4e3cugzq0BsoieWgzQg5O2xNr7
         iaRHeKcw57WhbHgBqEY/Jq5UFZuK4TEZ8oFWKogPYYmvKsPAYZrMyVkzsMcg7BfNLtlS
         2MW1ajt1HDgebroeDpcTiLv6k8y7PwONVlqJs1Iq05wElDmS2gUT77F463HZRzRyfWXt
         6FUQBeaGANrqonWBiKhhJVnuJvZwPujl+c56fZMutcZbtl4wL0J73isdgV75YAT0K0Mx
         8/1J2DWGm27P0Q5mo00Vcpyaf3uFuRDbwqZxBuXTUCNwtODkx+HTkRAKyL+MEntcaCPH
         Mnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Yocd9GH9D8Eh08QwwcCk6Y0ArCcGI/29479zCnz4VE=;
        b=NVt6VOqVeUCaXMZjHQws7gjZDsuOM9rKgSyaOs2bHFIQLjOyQZFHMw+b+K6zR+nobi
         JV7wGb+243wmiL/OpZPzD3sIFSbW8NW8p3sOXLAUbUQMJVHPUrstxP9BOi4i5WaAVsh2
         Vtcc+DjojkbOZcnJdT1b3CkmOB4kp9plfNt3+EmxQbBD7yE4vETIBg8DqPUak28EYmjc
         3x/t8N1LM+UaY0ao3xzyGK7KLcfGciOnhT7dyOcxsxW19LsHgaNxlCIwI7FrMBNvzaP0
         JWfwR9bhGf62pZnyx/d8NKqtUiiyI+heKyni+ZQshBcXtPBZ4tmVcl2jSN7xXEl8MDQR
         wleQ==
X-Gm-Message-State: AOAM530O/Od8+v5AIT38cdHGIjANrmGAXSRDsRqp96P0bAb6/rfBr7VH
	k9AYhxdk/wA9Yb3b5ouxyY2gDc65FHviUA==
X-Google-Smtp-Source: ABdhPJw3kfvbQxOKcPKh+aBanAfCBV+4EYFRxw2W9Y8wxEJ61UFPf8KiD/k55Md3nrsGZcIiyJ6pCQ==
X-Received: by 2002:ac8:7d8b:: with SMTP id c11mr460018qtd.120.1628095309304;
        Wed, 04 Aug 2021 09:41:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:5502:1c1f:b765:ad72])
        by smtp.gmail.com with ESMTPSA id a8sm789191qkn.63.2021.08.04.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:41:49 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/3] meta-arm: Convert to new override syntax
Date: Wed,  4 Aug 2021 12:41:45 -0400
Message-Id: <20210804164145.1556-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804164145.1556-1-jon.mason@arm.com>
References: <20210804164145.1556-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                                   |   8 +-
 ci/gem5-arm64-xen.yml                         |   2 +-
 ci/qemuarmv5.yml                              |   2 +-
 ci/testimage.yml                              |   2 +-
 kas/fvp-baser-aemv8r64-bsp.yml                |   8 +-
 .../classes/alternate-kernel.bbclass          |   6 +-
 .../classes/docker_extern_containers.bbclass  |   4 +-
 .../classes/kernel-xenguest.bbclass           |   2 +-
 .../classes/xenguest_image_extra.bbclass      |   2 +-
 .../distro/include/arm-autonomy-guest.inc     |   4 +-
 .../conf/distro/include/arm-autonomy-host.inc |   8 +-
 meta-arm-autonomy/conf/layer.conf             |   2 +-
 .../arm-autonomy-machine-extra-settings.inc   |   6 +-
 .../conf/machine/fvp-base-extra-settings.inc  |   2 +-
 .../conf/machine/juno-extra-settings.inc      |   2 +-
 .../conf/machine/n1sdp-extra-settings.inc     |   6 +-
 .../images/firmware-image-juno.bbappend       |  12 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
 .../xen-devicetree/xen-devicetree.bbappend    |  22 +-
 .../recipes-extended/xen/xen_%.bbappend       |  18 +-
 .../recipes-bsp/grub/grub-efi_%.bbappend      |   4 +-
 .../import-docker-containers.bb               |   2 +-
 .../packagegroup-docker-runtime-minimal.bb    |   2 +-
 .../recipes-core/busybox/busybox_%.bbappend   |   6 +-
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   4 +-
 .../qemu/qemu-autonomy-host.inc               |   4 +-
 .../xen-devicetree/xen-devicetree.bb          |   2 +-
 .../recipes-extended/xen/xen-tools_%.bbappend |   2 +-
 .../xen/xen-tools_4.14.bbappend               |   6 +-
 .../recipes-extended/xen/xen_%.bbappend       |   4 +-
 .../recipes-extended/xen/xen_4.14.bbappend    |   6 +-
 .../xenguest/xenguest-base-image.bb           |   2 +-
 .../xenguest/xenguest-extern-guests.bb        |   2 +-
 .../xenguest/xenguest-manager.bb              |   4 +-
 .../xenguest/xenguest-mkimage.bb              |   4 +-
 .../xenguest/xenguest-network.bb              |  22 +-
 .../linux/linux-arm-autonomy.inc              |   8 +-
 meta-arm-bsp/conf/layer.conf                  |   4 +-
 .../conf/machine/corstone700-fvp.conf         |   2 +-
 .../conf/machine/corstone700-mps3.conf        |   4 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
 meta-arm-bsp/conf/machine/fvp-common.inc      |   2 +-
 .../conf/machine/include/arm/arch-armv6m.inc  |   6 +-
 .../conf/machine/include/arm/arch-armv7em.inc |   6 +-
 .../conf/machine/include/arm/arch-armv7m.inc  |   6 +-
 .../include/arm/arch-armv8-1m-main.inc        |   6 +-
 .../machine/include/arm/arch-armv8-2a.inc     |  16 +-
 .../machine/include/arm/arch-armv8-4a.inc     |  16 +-
 .../machine/include/arm/arch-armv8m-base.inc  |   6 +-
 .../machine/include/arm/arch-armv8m-main.inc  |  24 +-
 .../include/arm/armv8r/arch-armv8r64.inc      |  24 +-
 .../conf/machine/include/corstone700.inc      |   4 +-
 .../conf/machine/include/tune-cortexm0.inc    |   6 +-
 .../machine/include/tune-cortexm0plus.inc     |   6 +-
 .../conf/machine/include/tune-cortexm1.inc    |   6 +-
 .../conf/machine/include/tune-cortexm23.inc   |   6 +-
 .../conf/machine/include/tune-cortexm3.inc    |   6 +-
 .../conf/machine/include/tune-cortexm33.inc   |   6 +-
 .../conf/machine/include/tune-cortexm35p.inc  |   6 +-
 .../conf/machine/include/tune-cortexm4.inc    |   6 +-
 .../conf/machine/include/tune-cortexm55.inc   |   6 +-
 .../conf/machine/include/tune-cortexm7.inc    |   6 +-
 .../conf/machine/include/tune-neoversen1.inc  |   8 +-
 meta-arm-bsp/conf/machine/musca-b1.conf       |   2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf          |   2 +-
 meta-arm-bsp/conf/machine/sgi575.conf         |   2 +-
 .../boot-firmware/boot-firmware_git.bb        |   4 +-
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   4 +-
 .../boot-wrapper-aarch64_%.bbappend           |   2 +-
 .../external-system/external-system_0.1.0.bb  |   2 +-
 .../recipes-bsp/hafnium/hafnium_2.5.bbappend  |   2 +-
 .../images/n1sdp-board-firmware_2020.07.27.bb |   2 +-
 .../scp-firmware/scp-firmware-juno.inc        |   2 +-
 .../scp-firmware/scp-firmware-n1sdp.inc       |   8 +-
 .../scp-firmware/scp-firmware-sgi575.inc      |   2 +-
 .../scp-firmware/scp-firmware-tc0.inc         |   2 +-
 .../scp-firmware/scp-firmware_2.8%.bbappend   |   8 +-
 .../trusted-firmware-a-corstone500.inc        |   2 +-
 .../trusted-firmware-a-corstone700.inc        |   2 +-
 .../trusted-firmware-a-fvp-arm32.inc          |   2 +-
 .../trusted-firmware-a-juno.inc               |   2 +-
 .../trusted-firmware-a_2.%.bbappend           |   2 +-
 .../trusted-firmware-a_2.5.bbappend           |  16 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
 .../u-boot/u-boot_2020.04.bbappend            |   4 +-
 .../u-boot/u-boot_2020.07.bbappend            |   6 +-
 .../u-boot/u-boot_2021.07.bbappend            |   4 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +-
 .../uefi/edk2-firmware_202102.bbappend        |   6 +-
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
 .../linux/linux-arm-platforms.inc             |  82 ++--
 .../linux/linux-arm64-ack_5.10.bbappend       |   2 +-
 .../linux/linux-yocto-corstone700.inc         |  10 +-
 .../linux/linux-yocto-rt_%.bbappend           |   4 +-
 .../linux/linux-yocto_5.3%.bbappend           |   4 +-
 .../linux/linux-yocto_5.6%.bbappend           |   6 +-
 .../linux/linux-yocto_5.7%.bbappend           |   4 +-
 .../optee/optee-client_3.14.0.bbappend        |   2 +-
 .../recipes-security/optee/optee-os-tc0.inc   |   6 +-
 .../optee/optee-os_3.14.0.bbappend            |   2 +-
 .../optee/optee-test_3.14.0.bbappend          |   2 +-
 .../distro/include/tcmode-external-arm.inc    |  14 +-
 meta-arm-toolchain/conf/layer.conf            |   4 +-
 .../arm-binary-toolchain.inc                  |   4 +-
 .../external-arm-sdk-toolchain.bb             |  30 +-
 .../external-arm-toolchain.bb                 | 374 +++++++++---------
 .../gcc-aarch64-none-elf_10.2-2020.11.bb      |   4 +-
 .../external-arm-toolchain/license.inc        | 134 +++----
 .../recipes-devtools/gcc/gcc-arm-10.2.inc     |   4 +-
 .../recipes-devtools/gcc/gcc-arm-common.inc   |   4 +-
 .../gcc/gcc-sanitizers_arm-10.2.bb            |   4 +-
 .../recipes-devtools/gcc/gcc_arm-10.2.bb      |  10 +-
 .../gcc/libgcc-initial_arm-10.2.bb            |   2 +-
 .../recipes-devtools/gcc/libgcc_arm-10.2.bb   |   2 +-
 meta-arm/conf/machine/microbit-v1.conf        |   2 +-
 meta-arm/conf/machine/qemu-cortex-a53.conf    |   2 +-
 .../boot-wrapper-aarch64_git.bb               |   2 +-
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |   6 +-
 .../scp-firmware/scp-firmware_2.8.0.bb        |   6 +-
 .../trusted-firmware-a/trusted-firmware-a.inc |  18 +-
 .../trusted-firmware-a_%.bbappend             |  22 +-
 .../trusted-firmware-m_1.3.0.bb               |   2 +-
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |   4 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  10 +-
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  22 +-
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb     |   2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc  |   6 +-
 .../linux/linux-yocto_5.10.bbappend           |  14 +-
 .../recipes-security/optee/optee-client.inc   |  10 +-
 .../recipes-security/optee/optee-examples.inc |   2 +-
 meta-arm/recipes-security/optee/optee-os.inc  |  10 +-
 .../recipes-security/optee/optee-os_3.14.0.bb |   2 +-
 .../recipes-security/optee/optee-test.inc     |   2 +-
 meta-arm/recipes-security/optee/optee.inc     |   8 +-
 .../gem5/gem5-aarch64-native_20.bbappend      |   6 +-
 .../gem5/gem5-m5ops_20.bbappend               |   4 +-
 meta-atp/recipes-kernel/atp/atp-module_3.1.bb |   4 +-
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb   |   2 +-
 .../linux/linux-yocto_5.4.bbappend            |   2 +-
 meta-gem5/conf/layer.conf                     |   2 +-
 meta-gem5/conf/machine/gem5-arm64.conf        |   2 +-
 .../boot-wrapper-aarch64_%.bbappend           |  10 +-
 .../gem5/gem5-aarch64-native_20.bbappend      |   2 +-
 .../recipes-extended/xen/xen_%.bbappend       |   6 +-
 .../recipes-kernel/linux/linux-%.bbappend     |   8 +-
 .../boot-wrapper-aarch64_%.bbappend           |  10 +-
 .../gem5/gem5-aarch64-native_20.bb            |   6 +-
 .../recipes-devtools/gem5/gem5-native.inc     |   6 +-
 .../linux/linux-yocto_5.4.bbappend            |  10 +-
 149 files changed, 727 insertions(+), 727 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 15088ab8396e..99360a631835 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -29,14 +29,14 @@ local_conf_header:
     CONF_VERSION = "2"
     PACKAGE_CLASSES = "package_ipk"
     LICENSE_FLAGS_WHITELIST += "armcompiler"
-    PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
-    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
+    PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
+    EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
     BB_NUMBER_THREADS = "16"
     PARALLEL_MAKE = "-j16"
     INHERIT += "rm_work"
-    PACKAGECONFIG_append_pn-perf = " coresight"
+    PACKAGECONFIG:append:pn-perf = " coresight"
   noptest: |
-    DISTRO_FEATURES_remove = "ptest"
+    DISTRO_FEATURES:remove = "ptest"
 
 machine: unset
 
diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
index 85763b812d18..e2882441e109 100644
--- a/ci/gem5-arm64-xen.yml
+++ b/ci/gem5-arm64-xen.yml
@@ -22,7 +22,7 @@ machine: gem5-arm64
 
 local_conf_header:
   meta-virt:
-    DISTRO_FEATURES_append = " virtualization xen"
+    DISTRO_FEATURES:append = " virtualization xen"
 
 target:
   - xen-image-minimal
diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index aaf7f4f4c9f4..408112462df8 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -8,4 +8,4 @@ machine: qemuarmv5
 local_conf_header:
   bugs: |
     # Remove parselogs until errors can be resolved
-    TEST_SUITES_remove = "parselogs"
+    TEST_SUITES:remove = "parselogs"
diff --git a/ci/testimage.yml b/ci/testimage.yml
index 8941ad3e305a..70a08e045bd1 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -10,7 +10,7 @@ local_conf_header:
     TEST_SERVER_IP = "127.0.0.1"
     QEMU_USE_SLIRP = "1"
   packages: |
-    IMAGE_FEATURES_append = " ssh-server-dropbear"
+    IMAGE_FEATURES:append = " ssh-server-dropbear"
 
 # Multiple targets are available, put it down to just one
 target:
diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.yml
index 77bddba3d3ae..2e7ff0461482 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -29,10 +29,10 @@ local_conf_header:
   base: |
     CONF_VERSION = "2"
     PACKAGE_CLASSES = "package_ipk"
-    PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
-    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
-    IMAGE_CLASSES_append = " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_AEM_TARBALL_URI'), 'fvpboot', '')}"
-    LICENSE_FLAGS_WHITELIST_append = " ${@oe.utils.vartrue('FVP_BASE_R_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
+    PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
+    EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
+    IMAGE_CLASSES:append = " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_AEM_TARBALL_URI'), 'fvpboot', '')}"
+    LICENSE_FLAGS_WHITELIST:append = " ${@oe.utils.vartrue('FVP_BASE_R_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
 
 target:
   - core-image-minimal
diff --git a/meta-arm-autonomy/classes/alternate-kernel.bbclass b/meta-arm-autonomy/classes/alternate-kernel.bbclass
index 9ca59e2c0174..b25dfc71dcbc 100644
--- a/meta-arm-autonomy/classes/alternate-kernel.bbclass
+++ b/meta-arm-autonomy/classes/alternate-kernel.bbclass
@@ -2,7 +2,7 @@
 # an alternate kernel (set via PREFERRED_PROVIDER_alternate/kernel).
 #
 # It is mandatory to also set the KERNEL_PACKAGE_NAME for the alternate kernel
-# recipe via KERNEL_PACKAGE_NAME_pn-${PREFERRED_PROVIDER_alternate/kernel} and
+# recipe via KERNEL_PACKAGE_NAME:pn-${PREFERRED_PROVIDER_alternate/kernel} and
 # its value needs to be different from "kernel" since this is the default set
 # for PREFERRED_PROVIDER_virtual/kernel.
 #
@@ -16,11 +16,11 @@ PREFERRED_PROVIDER_alternate/kernel ??= ""
 python () {
     alternate_kernel = d.getVar('PREFERRED_PROVIDER_alternate/kernel')
     if alternate_kernel:
-        alternate_kernel_pkg_name = d.getVar('KERNEL_PACKAGE_NAME_pn-%s' % alternate_kernel)
+        alternate_kernel_pkg_name = d.getVar('KERNEL_PACKAGE_NAME:pn-%s' % alternate_kernel)
         if alternate_kernel_pkg_name:
             d.appendVar('EXTRA_IMAGEDEPENDS', ' ' + alternate_kernel)
             d.appendVar('IMAGE_INSTALL', ' kernel-modules')
             d.appendVar('IMAGE_INSTALL', ' ' + alternate_kernel_pkg_name + '-modules')
         else:
-            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME_pn-%s set" % alternate_kernel )
+            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME:pn-%s set" % alternate_kernel )
 }
diff --git a/meta-arm-autonomy/classes/docker_extern_containers.bbclass b/meta-arm-autonomy/classes/docker_extern_containers.bbclass
index 363784a980eb..57ac85f99eca 100644
--- a/meta-arm-autonomy/classes/docker_extern_containers.bbclass
+++ b/meta-arm-autonomy/classes/docker_extern_containers.bbclass
@@ -71,7 +71,7 @@ inherit features_check
 
 REQUIRED_DISTRO_FEATURES = "docker"
 
-RDEPENDS_${PN} = "packagegroup-docker-runtime-minimal"
+RDEPENDS:${PN} = "packagegroup-docker-runtime-minimal"
 
 CONTAINER_IMAGE_FILES ??= ""
 CONTAINERS_INSTALL_DIR ??= "${datadir}/docker/images"
@@ -112,4 +112,4 @@ do_install() {
 
 do_install[vardeps] += "CONTAINER_IMAGE_FILES"
 
-FILES_${PN} += "${CONTAINERS_INSTALL_DIR}"
+FILES:${PN} += "${CONTAINERS_INSTALL_DIR}"
diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
index 085fd560e14e..59eb9d709b02 100644
--- a/meta-arm-autonomy/classes/kernel-xenguest.bbclass
+++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
@@ -29,7 +29,7 @@ do_assemble_xenguest_initramfs() {
 }
 do_assemble_xenguest_initramfs[depends] += "${INITRAMFS_IMAGE}:do_merge_xenguestenv"
 
-kernel_do_deploy_append() {
+kernel_do_deploy:append() {
     if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
         install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest "$deployDir/Image-${INITRAMFS_NAME}.xenguest"
         ln -snf Image-${INITRAMFS_NAME}.xenguest $deployDir/Image-${INITRAMFS_LINK_NAME}.xenguest
diff --git a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
index 3123f49622ed..a2c2dcf87939 100644
--- a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
+++ b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
@@ -48,7 +48,7 @@ XENGUEST_IMAGE_VARS_EXTRA += "\
  XENGUEST_EXTRA_INIT_PRE XENGUEST_EXTRA_INIT XENGUEST_EXTRA_INIT_POST \
  XENGUEST_EXTRA_FILES XENGUEST_EXTRA_DISK_FILES"
 
-do_deploy_append() {
+do_deploy:append() {
     if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
         -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
         die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
index 8ef0a943985d..6ffcdb5c84d8 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
@@ -1,7 +1,7 @@
 # This files is added when DISTRO_FEATURES contains arm-autonomy-guest
 
 # We need to have ipv4 activated
-DISTRO_FEATURES_append = " ipv4"
+DISTRO_FEATURES:append = " ipv4"
 
 # Build a xenguest type image
 IMAGE_CLASSES += "image_types_xenguest"
@@ -10,6 +10,6 @@ IMAGE_FSTYPES += "xenguest"
 # xenguest kernel extension to handle initramfs
 KERNEL_CLASSES += "kernel-xenguest"
 
-IMAGE_INSTALL_append = "${@bb.utils.contains('DISTRO_FEATURES', 'docker', \
+IMAGE_INSTALL:append = "${@bb.utils.contains('DISTRO_FEATURES', 'docker', \
                         ' packagegroup-docker-runtime-minimal', \
                         '', d)}"
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index d2aaabf0bfd1..8c14a1fbd9ee 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -3,13 +3,13 @@
 ARM_AUTONOMY_HOST_OVERRIDES = ":autonomy-host"
 
 # We need to have xen and ipv4 activated
-DISTRO_FEATURES_append = " xen ipv4"
-DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
+DISTRO_FEATURES:append = " xen ipv4"
+DISTRO_FEATURES_NATIVE:append = " arm-autonomy-host"
 
 # Don't include kernels in standard images when building arm-autonomy-host
 # If the kernel image is needed in the rootfs the following should be set from
-# a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-image"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= ""
+# a bbappend: RDEPENDS:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-image"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= ""
 
 # Require extra machine specific settings from meta-arm-bsp dynamic-layers only
 # if meta-arm-bsp is in the bblayers.conf
diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index e475756a7489..47aeee02186e 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -29,7 +29,7 @@ ARM_AUTONOMY_LAYERDIR := "${LAYERDIR}"
 ARM_AUTONOMY_DISTRO_CFGDIR = "${ARM_AUTONOMY_LAYERDIR}/conf/distro/include/"
 
 # Add class to handle arm-autonomy distro extensions
-USER_CLASSES_append = " arm-autonomy-features"
+USER_CLASSES:append = " arm-autonomy-features"
 
 BBFILES_DYNAMIC += " \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
index 5f3d8f819474..44930c9bc29b 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
@@ -1,7 +1,7 @@
 # Require extra machine specific settings
 ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE ?= ""
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_n1sdp = "n1sdp-extra-settings.inc"
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_fvp-base = "fvp-base-extra-settings.inc"
-ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_juno = "juno-extra-settings.inc"
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:n1sdp = "n1sdp-extra-settings.inc"
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:fvp-base = "fvp-base-extra-settings.inc"
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE:juno = "juno-extra-settings.inc"
 
 require ${ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
index 477d6d27fee2..54544edab7cf 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
@@ -6,7 +6,7 @@ XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda2"
 
 # We need to extend the wks search path to be able to find the wks file set in
 # ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
 
 ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-fvp-base-disk.wks.in"
 # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
index f8a16f4001a5..6255c984998d 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
@@ -7,7 +7,7 @@ XEN_DEVICETREE_DOM0_SIZE ?= "0x02400000"
 
 # We need to extend the wks search path to be able to find the wks file set in
 # ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
 
 ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-juno-disk.wks.in"
 # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index 0bd150b85064..394d1b82bc6e 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -2,7 +2,7 @@
 
 # We need to extent the wks search path to be able to find the wks file set in
 # ARM_AUTONOMY_WKS_FILE.
-WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
 
 ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-n1sdp-efidisk.wks.in"
 WKS_FILE = "${ARM_AUTONOMY_WKS_FILE}"
@@ -58,7 +58,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', \
 KERNEL_PACKAGE_NAME_alternate/kernel ?= "kernel-rt"
 # When alternate-kernel DISTRO_FEATURE is present we set the kernel-rt by
 # default
-KERNEL_PACKAGE_NAME_pn-linux-yocto-rt = "\
+KERNEL_PACKAGE_NAME:pn-linux-yocto-rt = "\
 ${@ d.getVar('KERNEL_PACKAGE_NAME_alternate/kernel') \
 if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d) \
 else 'kernel' }"
@@ -87,4 +87,4 @@ d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
 
 # Additionnal kernel modules are necessary for n1sdp to be able to mount FAT
 # filesystems using CP437.
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append = " kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index 6e75af2c3747..f582b471c319 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -1,14 +1,14 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend:autonomy-host := "${THISDIR}/${PN}:"
 
-DEPENDS_append_autonomy-host = " dos2unix-native"
+DEPENDS:append:autonomy-host = " dos2unix-native"
 
-SRC_URI_append_autonomy-host = " file://add-xen-support.patch;patchdir=../"
+SRC_URI:append:autonomy-host = " file://add-xen-support.patch;patchdir=../"
 
-do_install_append_autonomy-host() {
+do_install:append:autonomy-host() {
     mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \
           ${D}/${UNPACK_DIR}/SOFTWARE/uenvfile
     for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)
@@ -22,7 +22,7 @@ DEPLOY_EXTRA_DEPS_autonomy-host = "xen:do_deploy xen-devicetree:do_deploy"
 
 do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
 
-do_deploy_prepend_autonomy-host() {
+do_deploy:prepend:autonomy-host() {
     # To avoid dependency loop between firmware-image-juno:do_install,
     # xen:do_deploy and xen-devicetree:do_deploy when
     # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 10cd0d681863..7409213d9433 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,10 +1,10 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend_autonomy-host_fvp-base := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend:autonomy-host:fvp-base := "${THISDIR}/${PN}:"
 
 #
 # FVP BASE
 #
-SRC_URI_append_autonomy-host_fvp-base = " file://xen_u-boot_kernel_addr.patch"
+SRC_URI:append:autonomy-host:fvp-base = " file://xen_u-boot_kernel_addr.patch"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index af632e24d453..34e40b4be251 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -1,23 +1,23 @@
 # Platform dependent parameters
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 # Add a dtb snippet to turn off iommu in dom0 on Juno board
-SRC_URI_append_juno = " file://xen-juno.dtsi"
-XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
+SRC_URI:append:juno = " file://xen-juno.dtsi"
+XEN_DEVICETREE_DTSI_MERGE:append:juno = " xen-juno.dtsi"
 
 # Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
-SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
-XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
+SRC_URI:append:n1sdp = " file://xen-n1sdp.dtsi"
+XEN_DEVICETREE_DTSI_MERGE:append:n1sdp = " xen-n1sdp.dtsi"
 # For N1SDP, the XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables are
 # being set in meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
 
 # Board specific configs
-XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
-XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
+XEN_DEVICETREE_DOM0_BOOTARGS:append:juno = " root=/dev/sda1 rootwait"
+XEN_DEVICETREE_XEN_BOOTARGS:append:juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
-XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda2 rootwait"
-XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
+XEN_DEVICETREE_DOM0_BOOTARGS:append:n1sdp = " root=/dev/sda2 rootwait"
+XEN_DEVICETREE_XEN_BOOTARGS:append:n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
-XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda1"
-XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
+XEN_DEVICETREE_DOM0_BOOTARGS:append:fvp-base = " root=/dev/vda1"
+XEN_DEVICETREE_XEN_BOOTARGS:append:fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
index ef3cc2324e24..1581ae670c9d 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -1,15 +1,15 @@
 # FVP Base support
-COMPATIBLE_MACHINE_fvp-base = "fvp-base"
-FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files:"
-SRC_URI_append_fvp-base = " file://early-printk.cfg"
+COMPATIBLE_MACHINE:fvp-base = "fvp-base"
+FILESEXTRAPATHS:prepend:fvp-base := "${THISDIR}/files:"
+SRC_URI:append:fvp-base = " file://early-printk.cfg"
 
 # Juno support
-COMPATIBLE_MACHINE_juno = "juno"
-FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
-SRC_URI_append_juno = " file://early-printk.cfg"
+COMPATIBLE_MACHINE:juno = "juno"
+FILESEXTRAPATHS:prepend:juno := "${THISDIR}/files:"
+SRC_URI:append:juno = " file://early-printk.cfg"
 
 # N1SDP support
-COMPATIBLE_MACHINE_n1sdp = "n1sdp"
-FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/files:"
-SRC_URI_append_n1sdp = " file://n1sdp.cfg \
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/files:"
+SRC_URI:append:n1sdp = " file://n1sdp.cfg \
                          file://early-printk.cfg"
diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
index e88edfd2d4d4..675acea92bfb 100644
--- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
+++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
@@ -1,3 +1,3 @@
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-GRUB_BUILDIN_append_autonomy-host = " xen_boot"
+GRUB_BUILDIN:append:autonomy-host = " xen_boot"
diff --git a/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb b/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
index 3fea50822f0e..04115f7339e0 100644
--- a/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
+++ b/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
@@ -25,7 +25,7 @@ INITSCRIPT_PARAMS = "start 30 2 3 4 5 ."
 INITSCRIPT_NAME = "import_containers.sh"
 
 S = "${WORKDIR}"
-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 755 import_containers.sh ${D}${sysconfdir}/init.d
 
diff --git a/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb b/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
index 2cbff9c2769b..f78cc9f85e59 100644
--- a/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
+++ b/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "The minimal set of packages required for running Docker"
 
 inherit packagegroup
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     docker-ce \
     docker-ce-contrib \
     kernel-module-xt-nat \
diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
index 36c456919e7e..9bf929e1075e 100644
--- a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
@@ -1,8 +1,8 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend:autonomy-host := "${THISDIR}/${PN}:"
 
 # The --exclude flag in Busybox tar is required by xenguest-mkimage
-SRC_URI_append_autonomy-host = " file://feature_tar_long_options.cfg"
+SRC_URI:append:autonomy-host = " file://feature_tar_long_options.cfg"
diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index a4edd05e75d9..64c26a890365 100644
--- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -3,9 +3,9 @@
 # configuration by adding network network interface configuration file under
 # interfaces.d directory.
 
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-do_install_append_autonomy-host() {
+do_install:append:autonomy-host() {
     # Add scan of interfaces.d to interfaces file
     cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
     echo "source-directory ${sysconfdir}/network/interfaces.d/" \
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
index 085f952bd400..20573cb5a600 100644
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
@@ -2,7 +2,7 @@
 QEMU_TARGETS = "i386"
 
 PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
-PACKAGECONFIG_append = " noaudio"
-PACKAGECONFIG_remove = "fdt sdl kvm"
+PACKAGECONFIG:append = " noaudio"
+PACKAGECONFIG:remove = "fdt sdl kvm"
 
 require recipes-devtools/qemu/qemu-package-split.inc
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index 61fb62492ba6..223e2377e64d 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -16,7 +16,7 @@ DESCRIPTION = "Add entries in DTB for Xen and Dom0"
 # customizable parameters
 # kernel size is passed to xen via xen.dtb so we need to add
 # 'virtual/kernel:do_deploy' as a dependency
-XEN_DEVICETREE_DEPEND_append = " virtual/kernel:do_deploy"
+XEN_DEVICETREE_DEPEND:append = " virtual/kernel:do_deploy"
 XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
 XEN_DEVICETREE_XEN_BOOTARGS ?= "noreboot dom0_mem=${XEN_DEVICETREE_DOM0_MEM}"
 XEN_DEVICETREE_DOM0_MEM ?= "1024M,max:1024M"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
index f2284b07caab..d1f5610ed998 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
@@ -1,4 +1,4 @@
-PACKAGECONFIG_remove = "\
+PACKAGECONFIG:remove = "\
     ${@bb.utils.contains('DISTRO_FEATURES', \
                          'arm-autonomy-host', \
                          'sdl', '', d)}"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
index 21192c3586b7..3f8004aef4c6 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
@@ -1,7 +1,7 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
+FILESEXTRAPATHS:prepend:autonomy-host := "${THISDIR}/${PN}-4.14:"
 
-SRC_URI_append_autonomy-host = " file://0001-vif-nat-fix-hostname.patch"
+SRC_URI:append:autonomy-host = " file://0001-vif-nat-fix-hostname.patch"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index 4871ef816c37..36e0236fcd9c 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -1,10 +1,10 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
 # Make Xen machine specific
 # This ensures that sstate is properly handled and that each machine can have
 # its own configuration
 PACKAGE_ARCH_autonomy-host = "${MACHINE_ARCH}"
 
-PACKAGECONFIG_remove_autonomy-host = "sdl"
+PACKAGECONFIG:remove:autonomy-host = "sdl"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
index 5e9ff856e07f..8ac9f0e4b4ba 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
@@ -1,9 +1,9 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
+OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 
-FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
+FILESEXTRAPATHS:prepend:autonomy-host := "${THISDIR}/${PN}-4.14:"
 
-SRC_URI_append_autonomy-host = " \
+SRC_URI:append:autonomy-host = " \
     file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
     "
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
index 73278e5e675a..d3efed14d813 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -46,7 +46,7 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
 
 # Add xen files
 # Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES should
-# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
+# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES:append.
 # The kea-subnet4.json holds the kea dhcp4 subnet configuration for Dom0.
 # And it is used when XENGUEST_IMAGE_NETWORK_TYPE="nat".
 # Any customizations to it should be performed by replacing it
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
index fff6f6c13b14..ac5818494a6a 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
@@ -67,7 +67,7 @@ do_install() {
 
 do_install[vardeps] += "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
 
-FILES_${PN} += "${XENGUEST_MANAGER_GUEST_DIR}"
+FILES:${PN} += "${XENGUEST_MANAGER_GUEST_DIR}"
 
 # In a multiconfig build this variable will hold a dependency string, which
 # differs based on whether the guest has initramfs or not.  It may have a space
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index aaf6cdeaaf00..83ff95d041f6 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -56,8 +56,8 @@ do_install() {
 }
 
 # Things that we need on the target
-RDEPENDS_${PN} += "bash xenguest-mkimage lvm2 xen-tools parted e2fsprogs \
+RDEPENDS:${PN} += "bash xenguest-mkimage lvm2 xen-tools parted e2fsprogs \
                    dosfstools logrotate"
 
-FILES_${PN} += "${bindir}/xenguest-manager \
+FILES:${PN} += "${bindir}/xenguest-manager \
                ${sysconfdir}/xenguest"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
index 548e7c37e797..91344aa19497 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
@@ -31,6 +31,6 @@ do_install() {
 }
 
 # We need bash
-RDEPENDS_${PN} = "bash"
-FILES_${PN} = "${bindir}/xenguest-mkimage"
+RDEPENDS:${PN} = "bash"
+FILES:${PN} = "${bindir}/xenguest-mkimage"
 
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 65ab8aaca95e..66c6f267a4b7 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -31,13 +31,13 @@ PACKAGES =+ "${PN}-kea-dhcp4"
 # Prefix with a_ to make sure it is executed in runlevel 01 before others
 # run start script before ifupdown and run stop script after ifupdown
 INITSCRIPT_PACKAGES = "${PN} ${PN}-kea-dhcp4"
-INITSCRIPT_NAME_${PN} = "a_xenguest-network-bridge"
-INITSCRIPT_PARAMS_${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
+INITSCRIPT_NAME:${PN} = "a_xenguest-network-bridge"
+INITSCRIPT_PARAMS:${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
 
 # Kea configuration needs to be restored before kea init scripts:
 # Kea dhcp4 server is 30, so lets use 20, to have higher priority
-INITSCRIPT_NAME_${PN}-kea-dhcp4 = "kea-restore-default-config"
-INITSCRIPT_PARAMS_${PN}-kea-dhcp4 = "defaults 20"
+INITSCRIPT_NAME:${PN}-kea-dhcp4 = "kea-restore-default-config"
+INITSCRIPT_PARAMS:${PN}-kea-dhcp4 = "defaults 20"
 
 inherit allarch update-rc.d
 
@@ -77,7 +77,7 @@ do_install() {
         ${D}${sysconfdir}/kea/kea-dhcp4.conf.original
 }
 
-RDEPENDS_${PN} += "bridge-utils \
+RDEPENDS:${PN} += "bridge-utils \
                    iptables \
                    kea \
                    ${PN}-kea-dhcp4 \
@@ -87,10 +87,10 @@ RDEPENDS_${PN} += "bridge-utils \
                    kernel-module-xt-nat \
                    kernel-module-xt-masquerade \
                   "
-FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
-FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
-FILES_${PN} += "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
+FILES:${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
+FILES:${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
+FILES:${PN} += "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
 
-FILES_${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
-FILES_${PN}-kea-dhcp4 += "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
-FILES_${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/init.post/xenguest-network-init-post.sh"
+FILES:${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
+FILES:${PN}-kea-dhcp4 += "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
+FILES:${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/init.post/xenguest-network-init-post.sh"
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 5361e750f62a..588856c3fc15 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -1,11 +1,11 @@
 # Add arm-autonomy specific features to the kernel
 
-FILESEXTRAPATHS_prepend := "${THISDIR}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}:"
 
 #
 # arm-autonomy kmeta
 #
-SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
+SRC_URI:append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
 
 # Add common Xen (host and guest) configs and patches
 KERNEL_FEATURES += "${@bb.utils.contains_any('DISTRO_FEATURES', \
@@ -27,8 +27,8 @@ KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
 
 
 # Add support for arm64-autonomy-guest machine
-COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
-KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
+COMPATIBLE_MACHINE:arm64-autonomy-guest = "arm64-autonomy-guest"
+KMACHINE:arm64-autonomy-guest = "arm64-autonomy-guest"
 
 # Add Minimal Kernel Configs for Docker runtime
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 40905ad8253f..d20793025003 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -13,8 +13,8 @@ LAYERSERIES_COMPAT_meta-arm-bsp = "hardknott honister"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
-LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
-LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"
+LAYERDEPENDS_meta-arm-bsp:append:musca-b1 = " meta-python"
+LAYERDEPENDS_meta-arm-bsp:append:musca-s1 = " meta-python"
 
 # Additional license directories.
 LICENSE_PATH += "${LAYERDIR}/custom-licenses"
diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
index 2ee3b521e8d9..6056b36df106 100644
--- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -6,7 +6,7 @@ require conf/machine/include/corstone700.inc
 
 # default feature used: eth_lan91c111
 # add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES_remove = "eth_lan91c111"
+# MACHINE_FEATURES:remove = "eth_lan91c111"
 MACHINE_FEATURES += "eth_lan91c111"
 
 TFA_TARGET_PLATFORM = "fvp"
diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
index 9aaa17c472ea..916ba0e4c330 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -6,12 +6,12 @@ require conf/machine/include/corstone700.inc
 
 # default feature used: eth_lan9115
 # add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES_remove = "eth_lan9115"
+# MACHINE_FEATURES:remove = "eth_lan9115"
 MACHINE_FEATURES += "eth_lan9115"
 
 # default feature used: usb_host
 # add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES_remove = "usb_host"
+# MACHINE_FEATURES:remove = "usb_host"
 MACHINE_FEATURES += "usb_host"
 
 TFA_TARGET_PLATFORM = "fpga"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 29dd66267985..aeb23a400ea1 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -22,7 +22,7 @@ WKS_FILE ?= "fvp-base.wks"
 # As this is a virtual target that will not be used in the real world there is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
 # initialise) and install the pre-generated keys.
-PACKAGECONFIG_remove_pn-openssh = "rng-tools"
+PACKAGECONFIG:remove:pn-openssh = "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
 
 FVP_EXTRA_ARGS = "-a cluster0*=${DEPLOY_DIR_IMAGE}/linux-system.axf"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 72dae6596b22..2579d94ae5bd 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -23,5 +23,5 @@ EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 # As this is a virtual target that will not be used in the real world there is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
 # initialise) and install the pre-generated keys.
-PACKAGECONFIG_remove_pn-openssh = "rng-tools"
+PACKAGECONFIG:remove:pn-openssh = "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
index 739550d0051b..e7ca665a029f 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
@@ -14,6 +14,6 @@ require conf/machine/include/arm/arch-armv5.inc
 
 # Little Endian
 AVAILTUNES += "armv6m"
-ARMPKGARCH_tune-armv6m             = "armv6m"
-TUNE_FEATURES_tune-armv6m          = "armv6m"
-PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
+ARMPKGARCH:tune-armv6m             = "armv6m"
+TUNE_FEATURES:tune-armv6m          = "armv6m"
+PACKAGE_EXTRA_ARCHS:tune-armv6m    = "armv6m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
index 197286fd8f96..adcab272edab 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
@@ -12,6 +12,6 @@ TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
 require conf/machine/include/arm/arch-armv7m.inc
 
 AVAILTUNES                            += "armv7em"
-ARMPKGARCH_tune-armv7em                = "armv7em"
-TUNE_FEATURES_tune-armv7em             = "armv7em"
-PACKAGE_EXTRA_ARCHS_tune-armv7em       = "armv7em"
+ARMPKGARCH:tune-armv7em                = "armv7em"
+TUNE_FEATURES:tune-armv7em             = "armv7em"
+PACKAGE_EXTRA_ARCHS:tune-armv7em       = "armv7em"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
index c659e8bfd88a..a36c265bc123 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
@@ -12,6 +12,6 @@ TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
 require conf/machine/include/arm/arch-armv6m.inc
 
 AVAILTUNES                            += "armv7m"
-ARMPKGARCH_tune-armv7m                 = "armv7m"
-TUNE_FEATURES_tune-armv7m              = "armv7m"
-PACKAGE_EXTRA_ARCHS_tune-armv7m        = "armv7m"
+ARMPKGARCH:tune-armv7m                 = "armv7m"
+TUNE_FEATURES:tune-armv7m              = "armv7m"
+PACKAGE_EXTRA_ARCHS:tune-armv7m        = "armv7m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
index fc8add4d3774..9171b31c9001 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
@@ -13,6 +13,6 @@ TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
 require conf/machine/include/arm/arch-armv8m-main.inc
 
 AVAILTUNES                            += "armv8-1m-main"
-ARMPKGARCH_tune-armv8-1m-main          = "armv8-1m-main"
-TUNE_FEATURES_tune-armv8-1m-main       = "armv8-1m-main"
-PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main = "armv8-1m-main"
+ARMPKGARCH:tune-armv8-1m-main          = "armv8-1m-main"
+TUNE_FEATURES:tune-armv8-1m-main       = "armv8-1m-main"
+PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main = "armv8-1m-main"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
index 0af949edc171..3bfe0d5e83a9 100644
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
@@ -8,11 +8,11 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
 require conf/machine/include/arm/arch-armv8a.inc
 
 AVAILTUNES += "armv8-2a armv8-2a-crypto"
-ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
-ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
-TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
-TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
-PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
-BASE_LIB_tune-armv8-2a                       = "lib64"
-BASE_LIB_tune-armv8-2a-crypto                = "lib64"
+ARMPKGARCH:tune-armv8-2a                    ?= "armv8-2a"
+ARMPKGARCH:tune-armv8-2a-crypto             ?= "armv8-2a"
+TUNE_FEATURES:tune-armv8-2a                  = "aarch64 armv8-2a"
+TUNE_FEATURES:tune-armv8-2a-crypto           = "${TUNE_FEATURES:tune-armv8-2a} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-2a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} armv8-2a-crypto"
+BASE_LIB:tune-armv8-2a                       = "lib64"
+BASE_LIB:tune-armv8-2a-crypto                = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
index a4f2ca2bb425..2dc04b6d7224 100644
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
@@ -9,11 +9,11 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv8-4a armv8-4a-crypto"
-ARMPKGARCH_tune-armv8-4a                    ?= "armv8-4a"
-ARMPKGARCH_tune-armv8-4a-crypto             ?= "armv8-4a"
-TUNE_FEATURES_tune-armv8-4a                  = "aarch64 armv8-4a"
-TUNE_FEATURES_tune-armv8-4a-crypto           = "${TUNE_FEATURES_tune-armv8-4a} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8-4a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-4a"
-PACKAGE_EXTRA_ARCHS_tune-armv8-4a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-4a} armv8-4a-crypto"
-BASE_LIB_tune-armv8-4a                       = "lib64"
-BASE_LIB_tune-armv8-4a-crypto                = "lib64"
+ARMPKGARCH:tune-armv8-4a                    ?= "armv8-4a"
+ARMPKGARCH:tune-armv8-4a-crypto             ?= "armv8-4a"
+TUNE_FEATURES:tune-armv8-4a                  = "aarch64 armv8-4a"
+TUNE_FEATURES:tune-armv8-4a-crypto           = "${TUNE_FEATURES:tune-armv8-4a} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-4a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-4a"
+PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-4a} armv8-4a-crypto"
+BASE_LIB:tune-armv8-4a                       = "lib64"
+BASE_LIB:tune-armv8-4a-crypto                = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
index 04cdf7d740a7..d9a341c66e13 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
@@ -12,6 +12,6 @@ TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
 require conf/machine/include/arm/arch-armv7m.inc
 
 AVAILTUNES                          += "armv8m-base"
-ARMPKGARCH_tune-armv8m-base          = "armv8m-base"
-TUNE_FEATURES_tune-armv8m-base       = "armv8m-base"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-base = "armv8m-base"
+ARMPKGARCH:tune-armv8m-base          = "armv8m-base"
+TUNE_FEATURES:tune-armv8m-base       = "armv8m-base"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-base = "armv8m-base"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
index f2e078d09c90..27f552b2d726 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
@@ -22,15 +22,15 @@ TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-s
 MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
 
 AVAILTUNES                                      += "armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
-ARMPKGARCH_tune-armv8m-main                      = "armv8m-main"
-ARMPKGARCH_tune-armv8m-maine                     = "armv8m-main"
-ARMPKGARCH_tune-armv8m-main-vfpv5spd16           = "armv8m-main"
-ARMPKGARCH_tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
-TUNE_FEATURES_tune-armv8m-main                   = "armv8m-main"
-TUNE_FEATURES_tune-armv8m-maine                  = "${TUNE_FEATURES_tune-armv8m-main} dsp"
-TUNE_FEATURES_tune-armv8m-main-vfpv5spd16        = "${TUNE_FEATURES_tune-armv8m-main} vfpv5spd16"
-TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16       = "${TUNE_FEATURES_tune-armv8m-main-vfpv5spd16} dsp"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-main             = "armv8m-main"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-maine            = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-main-vfpv5spd16  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-main-fpv5-spd16"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16 = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine-fpv5-spd16"
+ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
+ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
+ARMPKGARCH:tune-armv8m-main-vfpv5spd16           = "armv8m-main"
+ARMPKGARCH:tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
+TUNE_FEATURES:tune-armv8m-main                   = "armv8m-main"
+TUNE_FEATURES:tune-armv8m-maine                  = "${TUNE_FEATURES:tune-armv8m-main} dsp"
+TUNE_FEATURES:tune-armv8m-main-vfpv5spd16        = "${TUNE_FEATURES:tune-armv8m-main} vfpv5spd16"
+TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16       = "${TUNE_FEATURES:tune-armv8m-main-vfpv5spd16} dsp"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-main             = "armv8m-main"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-maine            = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-main-vfpv5spd16  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-main-fpv5-spd16"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16 = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
index 92bfa3138ac3..f9383fce2a53 100644
--- a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
@@ -12,15 +12,15 @@ require conf/machine/include/arm/arch-arm64.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv8r armv8r-crc armv8r-crypto"
-ARMPKGARCH_tune-armv8r                    ?= "armv8r"
-ARMPKGARCH_tune-armv8r-crc                ?= "armv8r"
-ARMPKGARCH_tune-armv8r-crypto             ?= "armv8r"
-TUNE_FEATURES_tune-armv8r                  = "aarch64 armv8r"
-TUNE_FEATURES_tune-armv8r-crc              = "${TUNE_FEATURES_tune-armv8r} crc"
-TUNE_FEATURES_tune-armv8r-crypto           = "${TUNE_FEATURES_tune-armv8r} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8r            = "aarch64 armv8r"
-PACKAGE_EXTRA_ARCHS_tune-armv8r-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crc"
-PACKAGE_EXTRA_ARCHS_tune-armv8r-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crypto"
-BASE_LIB_tune-armv8r                       = "lib64"
-BASE_LIB_tune-armv8r-crc                   = "lib64"
-BASE_LIB_tune-armv8r-crypto                = "lib64"
+ARMPKGARCH:tune-armv8r                    ?= "armv8r"
+ARMPKGARCH:tune-armv8r-crc                ?= "armv8r"
+ARMPKGARCH:tune-armv8r-crypto             ?= "armv8r"
+TUNE_FEATURES:tune-armv8r                  = "aarch64 armv8r"
+TUNE_FEATURES:tune-armv8r-crc              = "${TUNE_FEATURES:tune-armv8r} crc"
+TUNE_FEATURES:tune-armv8r-crypto           = "${TUNE_FEATURES:tune-armv8r} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8r            = "aarch64 armv8r"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto"
+BASE_LIB:tune-armv8r                       = "lib64"
+BASE_LIB:tune-armv8r-crc                   = "lib64"
+BASE_LIB:tune-armv8r-crypto                = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 228fdd293b79..229a22629cea 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -8,7 +8,7 @@ TFA_PLATFORM = "corstone700"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0"
 
-PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.6%"
 
 PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
@@ -24,7 +24,7 @@ EXTRA_IMAGEDEPENDS += " \
                       virtual/control-processor-firmware  \
                       "
 
-WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "arm-reference-image.corstone700.wks"
 
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
index 7849ff6baabd..5b296003fab7 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex
 require conf/machine/include/arm/arch-armv6m.inc
 
 AVAILTUNES                            += "cortexm0"
-ARMPKGARCH_tune-cortexm0               = "cortexm0"
-TUNE_FEATURES_tune-cortexm0            = "${TUNE_FEATURES_tune-armv6m} cortexm0"
-PACKAGE_EXTRA_ARCHS_tune-cortexm0      = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0"
+ARMPKGARCH:tune-cortexm0               = "cortexm0"
+TUNE_FEATURES:tune-cortexm0            = "${TUNE_FEATURES:tune-armv6m} cortexm0"
+PACKAGE_EXTRA_ARCHS:tune-cortexm0      = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
index 83f8cac379ee..1a3bee4e13fa 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=c
 require conf/machine/include/arm/arch-armv6m.inc
 
 AVAILTUNES                            += "cortexm0-plus"
-ARMPKGARCH_tune-cortexm0-plus          = "cortexm0-plus"
-TUNE_FEATURES_tune-cortexm0-plus       = "${TUNE_FEATURES_tune-armv6m} cortexm0-plus"
-PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0-plus"
+ARMPKGARCH:tune-cortexm0-plus          = "cortexm0-plus"
+TUNE_FEATURES:tune-cortexm0-plus       = "${TUNE_FEATURES:tune-armv6m} cortexm0-plus"
+PACKAGE_EXTRA_ARCHS:tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0-plus"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
index ed36361bf238..16661f3a26d0 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex
 require conf/machine/include/arm/arch-armv6m.inc
 
 AVAILTUNES                            += "cortexm1"
-ARMPKGARCH_tune-cortexm1               = "cortexm1"
-TUNE_FEATURES_tune-cortexm1            = "${TUNE_FEATURES_tune-armv6m} cortexm1"
-PACKAGE_EXTRA_ARCHS_tune-cortexm1      = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm1"
+ARMPKGARCH:tune-cortexm1               = "cortexm1"
+TUNE_FEATURES:tune-cortexm1            = "${TUNE_FEATURES:tune-armv6m} cortexm1"
+PACKAGE_EXTRA_ARCHS:tune-cortexm1      = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm1"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
index e2e0a34580a6..25780bc08026 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8m-base.inc
 
 AVAILTUNES                          += "cortexm23"
-ARMPKGARCH_tune-cortexm23            = "cortexm23"
-TUNE_FEATURES_tune-cortexm23         = "${TUNE_FEATURES_tune-armv8m-base} cortexm23"
-PACKAGE_EXTRA_ARCHS_tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-base} cortexm23"
+ARMPKGARCH:tune-cortexm23            = "cortexm23"
+TUNE_FEATURES:tune-cortexm23         = "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
+PACKAGE_EXTRA_ARCHS:tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
index f837ad2cf349..a6cb566387a8 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex
 require conf/machine/include/arm/arch-armv7m.inc
 
 AVAILTUNES                            += "cortexm3"
-ARMPKGARCH_tune-cortexm3               = "cortexm3"
-TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m} cortexm3"
-PACKAGE_EXTRA_ARCHS_tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3"
+ARMPKGARCH:tune-cortexm3               = "cortexm3"
+TUNE_FEATURES:tune-cortexm3            = "${TUNE_FEATURES:tune-armv7m} cortexm3"
+PACKAGE_EXTRA_ARCHS:tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS:tune-armv7m} cortexm3"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
index 105a60582728..04d1fe2bde80 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
@@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
 # optional.  So forcing below so that compiling works, but this should
 # be fixed in GCC
 AVAILTUNES                          += "cortexm33"
-ARMPKGARCH_tune-cortexm33            = "cortexm33"
-TUNE_FEATURES_tune-cortexm33         = "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm33"
-PACKAGE_EXTRA_ARCHS_tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
+ARMPKGARCH:tune-cortexm33            = "cortexm33"
+TUNE_FEATURES:tune-cortexm33         = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
+PACKAGE_EXTRA_ARCHS:tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
index 7d734216e4bf..60e978facdce 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
@@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
 # optional.  So forcing below so that compiling works, but this should
 # be fixed in GCC
 AVAILTUNES                          += "cortexm35p"
-ARMPKGARCH_tune-cortexm35p           = "cortexm35p"
-TUNE_FEATURES_tune-cortexm35p        = "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm35p"
-PACKAGE_EXTRA_ARCHS_tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
+ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
+TUNE_FEATURES:tune-cortexm35p        = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
+PACKAGE_EXTRA_ARCHS:tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
index 8f498f50541d..e86622ff3da0 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex
 require conf/machine/include/arm/arch-armv7em.inc
 
 AVAILTUNES                            += "cortexm4"
-ARMPKGARCH_tune-cortexm4               = "cortexm4"
-TUNE_FEATURES_tune-cortexm4            = "${TUNE_FEATURES_tune-armv7em} cortexm4"
-PACKAGE_EXTRA_ARCHS_tune-cortexm4      = "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm4"
+ARMPKGARCH:tune-cortexm4               = "cortexm4"
+TUNE_FEATURES:tune-cortexm4            = "${TUNE_FEATURES:tune-armv7em} cortexm4"
+PACKAGE_EXTRA_ARCHS:tune-cortexm4      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
index b92aff15aede..493ad67b21d0 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8-1m-main.inc
 
 AVAILTUNES                            += "cortexm55"
-ARMPKGARCH_tune-cortexm55              = "cortexm55"
-TUNE_FEATURES_tune-cortexm55           = "${TUNE_FEATURES_tune-armv8-1m-main} cortexm55"
-PACKAGE_EXTRA_ARCHS_tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main} cortexm55"
+ARMPKGARCH:tune-cortexm55              = "cortexm55"
+TUNE_FEATURES:tune-cortexm55           = "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
+PACKAGE_EXTRA_ARCHS:tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
index 21b7c0115a55..6434ec63983d 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
@@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex
 require conf/machine/include/arm/arch-armv7em.inc
 
 AVAILTUNES                            += "cortexm7"
-ARMPKGARCH_tune-cortexm7               = "cortexm7"
-TUNE_FEATURES_tune-cortexm7            = "${TUNE_FEATURES_tune-armv7em} cortexm7"
-PACKAGE_EXTRA_ARCHS_tune-cortexm7      = "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm7"
+ARMPKGARCH:tune-cortexm7               = "cortexm7"
+TUNE_FEATURES:tune-cortexm7            = "${TUNE_FEATURES:tune-armv7em} cortexm7"
+PACKAGE_EXTRA_ARCHS:tune-cortexm7      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm7"
diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
index 04e28ee71e0c..6999805b1937 100644
--- a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
@@ -8,7 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 
 # Little Endian base configs
 AVAILTUNES += "neoversen1"
-ARMPKGARCH_tune-neoversen1             = "neoversen1"
-TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
-BASE_LIB_tune-neoversen1               = "lib64"
+ARMPKGARCH:tune-neoversen1             = "neoversen1"
+TUNE_FEATURES:tune-neoversen1          = "aarch64 neoversen1 crc crypto"
+PACKAGE_EXTRA_ARCHS:tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} neoversen1"
+BASE_LIB:tune-neoversen1               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index ecef03aee5e3..76fe8c8793b3 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -23,6 +23,6 @@ QB_RNG = ""
 # Zephyr RTOS settings
 ZEPHYR_BOARD = "v2m_musca_b1"
 ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH_musca-b1 = "arm"
+ARCH:musca-b1 = "arm"
 
 TFM_PLATFORM = "musca_b1/sse_200"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 2126cc198e8b..e80580d3637f 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Set default WKS
 WKS_FILE ?= "n1sdp-efidisk.wks"
 IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
-WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index cf91266c2e19..82009f3f0d9b 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -26,4 +26,4 @@ MACHINE_FEATURES += "efi"
 IMAGE_FSTYPES += "cpio.gz wic"
 
 WKS_FILE ?= "sgi575-efidisk.wks"
-WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
index c48e5860ad78..cfcb98dec744 100644
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
+++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
@@ -50,10 +50,10 @@ do_install() {
         --out ${D}/firmware/spitoc.bin
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} = "textrel"
+INSANE_SKIP:${PN} = "textrel"
 
 do_deploy() {
     # Copy the images to deploy directory
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index bd8e9935fed1..f1bf61408d88 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
@@ -1,7 +1,7 @@
 COMPATIBLE_MACHINE = "fvp-baser-aemv8r64"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
-SRC_URI_append = " \
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/${MACHINE}:"
+SRC_URI:append = " \
     file://0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch \
     file://0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch \
     file://0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch \
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
index 91098ad6f144..c2e7e6e3ffb7 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
@@ -1,4 +1,4 @@
 MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE ?= ""
-MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE_fvp-baser-aemv8r64 ?= "boot-wrapper-aarch64-fvp-baser-aemv8r64.inc"
+MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE:fvp-baser-aemv8r64 ?= "boot-wrapper-aarch64-fvp-baser-aemv8r64.inc"
 
 require ${MACHINE_BOOT_WRAPPER_AARCH64_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index a8052c6e1509..1ab745e86e3f 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -34,7 +34,7 @@ do_install() {
     install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/firmware.bin ${D}/firmware/es_flashfw.bin
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 
 inherit deploy
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
index a6e6874de1e3..dc82a940a7d3 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_HAFNIUM_REQUIRE ?= ""
-MACHINE_HAFNIUM_REQUIRE_tc0 = "hafnium-tc0.inc"
+MACHINE_HAFNIUM_REQUIRE:tc0 = "hafnium-tc0.inc"
 
 require ${MACHINE_HAFNIUM_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
index 1551ac99c0f2..228ed927e282 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
@@ -24,7 +24,7 @@ do_install() {
     cp -Rp --no-preserve=ownership ${S}/* ${D}${INSTALL_DIR}
 }
 
-FILES_${PN} = "${INSTALL_DIR}"
+FILES:${PN} = "${INSTALL_DIR}"
 SYSROOT_DIRS += "${INSTALL_DIR}"
 
 do_deploy() {
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index 9e1e1c2549b2..a72cbd938544 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -4,4 +4,4 @@ COMPATIBLE_MACHINE = "juno"
 
 SCP_PLATFORM = "juno"
 FW_TARGETS = "scp"
-FW_INSTALL_append = " romfw_bypass"
+FW_INSTALL:append = " romfw_bypass"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 077236476740..506eeec21bc5 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,18 +3,18 @@
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"
 
-SRC_URI_append = " \
+SRC_URI:append = " \
    file://enabling-coresight-debug-non-secure-access.patch \
    "
 
-COMPATIBLE_MACHINE_n1sdp = "n1sdp"
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 
 DEPENDS += "fiptool-native"
 DEPENDS += "virtual/trusted-firmware-a"
 
-do_install_append() {
+do_install:append() {
    fiptool \
        create \
        --scp-fw "${D}/firmware/scp_ramfw.bin" \
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
index a2dab3b95b44..0a3d6112ae3e 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -3,7 +3,7 @@
 SCP_PLATFORM  = "sgi575"
 SCP_LOG_LEVEL = "INFO"
 
-COMPATIBLE_MACHINE_sgi575 = "sgi575"
+COMPATIBLE_MACHINE:sgi575 = "sgi575"
 
 do_install() {
     install -d ${D}/firmware
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 62a0e25e14b8..761a370055bc 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -5,7 +5,7 @@ SRCREV = "67a3612716ad3b839da4209a173404692607c5a1"
 PV = "2.8+git${SRCPV}"
 
 # This is incorporated into the SRCREV above
-SRC_URI_remove = " \
+SRC_URI:remove = " \
     file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch \
     "
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
index b419064f48a9..398b04930009 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbappend
@@ -2,9 +2,9 @@
 
 MACHINE_SCP_REQUIRE ?= ""
 
-MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
-MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
-MACHINE_SCP_REQUIRE_sgi575 = "scp-firmware-sgi575.inc"
-MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE:juno = "scp-firmware-juno.inc"
+MACHINE_SCP_REQUIRE:n1sdp = "scp-firmware-n1sdp.inc"
+MACHINE_SCP_REQUIRE:sgi575 = "scp-firmware-sgi575.inc"
+MACHINE_SCP_REQUIRE:tc0 = "scp-firmware-tc0.inc"
 
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
index 4d3432cbc5ad..acd9e3dbfbf0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
@@ -7,7 +7,7 @@ TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "all fip"
 TFA_INSTALL_TARGET = "bl1.bin fip.bin"
 
-EXTRA_OEMAKE_append = " \
+EXTRA_OEMAKE:append = " \
                     ARCH=aarch32 \
                     FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
                     ARM_ARCH_MAJOR=7 \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
index 5755005f7794..d600de992fe7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
@@ -7,7 +7,7 @@ TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "all fip"
 TFA_INSTALL_TARGET = "fip.bin"
 
-EXTRA_OEMAKE_append = " \
+EXTRA_OEMAKE:append = " \
                         ARCH=aarch32 \
                         TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
                         AARCH32_SP=sp_min \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
index 117c25fbeede..fdaadb9fc62c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
@@ -5,7 +5,7 @@ TFA_PLATFORM = "fvp"
 TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "dtbs bl1 bl32 fip"
 
-EXTRA_OEMAKE_append = " \
+EXTRA_OEMAKE:append = " \
     ARCH=aarch32 \
     AARCH32_SP=sp_min \
     "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index 3aa8520b8da3..c7293c0db17b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -10,4 +10,4 @@ TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
 # Juno needs the System Control Processor Firmware
 DEPENDS += "virtual/control-processor-firmware"
 
-EXTRA_OEMAKE_append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
+EXTRA_OEMAKE:append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
index e5b10ff3b024..f317cb8c6af7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
@@ -1,3 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"
 
 # Don't put machine customisation in here, use a versioned append.
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
index 827c0b915c3b..dcec1b12a623 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
@@ -1,13 +1,13 @@
 # Machine specific TFAs
 
 MACHINE_TFA_REQUIRE ?= ""
-MACHINE_TFA_REQUIRE_corstone500 = "trusted-firmware-a-corstone500.inc"
-MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
-MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
-MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
-MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
-MACHINE_TFA_REQUIRE_sgi575 = "trusted-firmware-a-sgi575.inc"
-MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
+MACHINE_TFA_REQUIRE:corstone500 = "trusted-firmware-a-corstone500.inc"
+MACHINE_TFA_REQUIRE:corstone700 = "trusted-firmware-a-corstone700.inc"
+MACHINE_TFA_REQUIRE:fvp-base = "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE:fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
+MACHINE_TFA_REQUIRE:juno = "trusted-firmware-a-juno.inc"
+MACHINE_TFA_REQUIRE:n1sdp = "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE:sgi575 = "trusted-firmware-a-sgi575.inc"
+MACHINE_TFA_REQUIRE:tc0 = "trusted-firmware-a-tc0.inc"
 
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 692b4ebc334d..e4746dec2035 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,13 +1,13 @@
 # Machine specific u-boot
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 #
 # FVP BASE
 #
-SRC_URI_append_fvp-base = " file://bootargs.cfg"
+SRC_URI:append:fvp-base = " file://bootargs.cfg"
 
 #
 # FVP BASE ARM32
 #
-SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
+SRC_URI:append:fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
index 00b40e555136..113cde525eb5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
@@ -1,8 +1,8 @@
 #
 # Corstone700 KMACHINE
 #
-FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/${BP}/corstone700:"
-SRC_URI_append_corstone700 = " file://0001-arm-Add-corstone700-platform.patch \
+FILESEXTRAPATHS:prepend:corstone700 := "${THISDIR}/${BP}/corstone700:"
+SRC_URI:append:corstone700 = " file://0001-arm-Add-corstone700-platform.patch \
                                file://0002-boot-add-bootx-command-to-start-XiP-images.patch \
                                file://0003-boot-starting-the-XIP-kernel-using-bootx-command.patch \
                                file://0004-arm-enabling-the-arch_timer-driver.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index add6a7825405..9f44ec7be173 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -1,16 +1,16 @@
 # Machine specific u-boot
 
 THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
+FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
 
 #
 # Corstone-500 MACHINE
 #
-SRC_URI_append_corstone500 = " \
+SRC_URI:append:corstone500 = " \
                    file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
                    file://0002-board-arm-add-corstone500-board.patch"
 
 #
 # Juno KMACHINE
 #
-SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
+SRC_URI:append:juno = " file://u-boot_vexpress_uenv.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
index ad6147f4dde8..409f4b43b35f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
@@ -1,12 +1,12 @@
 # Machine specific u-boot
 
 THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
+FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
 
 #
 # TC0 MACHINE
 #
-SRC_URI_append_tc0 = " \
+SRC_URI:append:tc0 = " \
     file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
     file://0002-cmd-part-Correct-error-handling.patch \
     file://bootargs.cfg \
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 0009e851786b..3749d01ecd7f 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
-SRC_URI_append = " file://Add-mem-regions-to-support.patch;patchdir=${S}/edk2-platforms \
+SRC_URI:append = " file://Add-mem-regions-to-support.patch;patchdir=${S}/edk2-platforms \
                    file://Introduce-platform-DXE-driver.patch;patchdir=${S}/edk2-platforms \
                    file://Enable-N1SDP-platform-specific-configs.patch;patchdir=${S}/edk2-platforms \
                    file://Configuration-Manager-for-N1SDP.patch;patchdir=${S}/edk2-platforms "
@@ -19,7 +19,7 @@ COMPATIBLE_MACHINE = "n1sdp"
 EFIDIR             = "/EFI/BOOT"
 EFI_BOOT_IMAGE     = "bootaa64.efi"
 
-do_deploy_append() {
+do_deploy:append() {
     EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
     printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" > ${DEPLOYDIR}/startup.nsh
 }
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
index 1f4c28b6df78..bb3845d1646b 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
@@ -2,8 +2,8 @@
 
 MACHINE_EDK2_REQUIRE ?= ""
 
-MACHINE_EDK2_REQUIRE_fvp-base = "edk2-firmware-fvp-base.inc"
-MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
-MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
+MACHINE_EDK2_REQUIRE:fvp-base = "edk2-firmware-fvp-base.inc"
+MACHINE_EDK2_REQUIRE:sgi575 = "edk2-firmware-sgi575.inc"
+MACHINE_EDK2_REQUIRE:n1sdp = "edk2-firmware-n1sdp.inc"
 
 require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 2c5f61a41103..65e37d8e7c61 100644
--- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -5,4 +5,4 @@
 #
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index ef87fd6fb7f0..5c547b7e2854 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -13,43 +13,43 @@ ARMBSPFILESPATHS := "${THISDIR}:${THISDIR}/files:"
 
 # Arm platforms kmeta
 SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
-SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
-SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
-SRC_URI_append_juno = " ${SRC_URI_KMETA}"
-SRC_URI_append_n1sdp = " ${SRC_URI_KMETA}"
-SRC_URI_append_fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
-SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
+SRC_URI:append:fvp-base = " ${SRC_URI_KMETA}"
+SRC_URI:append:fvp-base-arm32 = " ${SRC_URI_KMETA}"
+SRC_URI:append:juno = " ${SRC_URI_KMETA}"
+SRC_URI:append:n1sdp = " ${SRC_URI_KMETA}"
+SRC_URI:append:fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
+SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
 # Corstone-500 KMACHINE
 #
-COMPATIBLE_MACHINE_corstone500 = "corstone500"
+COMPATIBLE_MACHINE:corstone500 = "corstone500"
 
 #
 # FVP BASE KMACHINE
 #
-COMPATIBLE_MACHINE_fvp-base = "fvp-base"
-KMACHINE_fvp-base = "fvp"
-FILESEXTRAPATHS_prepend_fvp-base := "${ARMBSPFILESPATHS}"
+COMPATIBLE_MACHINE:fvp-base = "fvp-base"
+KMACHINE:fvp-base = "fvp"
+FILESEXTRAPATHS:prepend:fvp-base := "${ARMBSPFILESPATHS}"
 
 #
 # FVP BASE ARM32 KMACHINE
 #
-COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
-KMACHINE_fvp-base-arm32 = "fvp-arm32"
-FILESEXTRAPATHS_prepend_fvp-base-arm32 := "${ARMBSPFILESPATHS}"
-SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
+COMPATIBLE_MACHINE:fvp-base-arm32 = "fvp-base-arm32"
+KMACHINE:fvp-base-arm32 = "fvp-arm32"
+FILESEXTRAPATHS:prepend:fvp-base-arm32 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
                                   file://0001-ARM-vexpress-enable-GICv3.patch"
 
 #
 # Juno KMACHINE
 #
-COMPATIBLE_MACHINE_juno = "juno"
-KMACHINE_juno = "juno"
-KBUILD_DEFCONFIG_juno = "defconfig"
-KCONFIG_MODE_juno = "--alldefconfig"
-FILESEXTRAPATHS_prepend_juno := "${ARMBSPFILESPATHS}"
-SRC_URI_append_juno = " \
+COMPATIBLE_MACHINE:juno = "juno"
+KMACHINE:juno = "juno"
+KBUILD_DEFCONFIG:juno = "defconfig"
+KCONFIG_MODE:juno = "--alldefconfig"
+FILESEXTRAPATHS:prepend:juno := "${ARMBSPFILESPATHS}"
+SRC_URI:append:juno = " \
     file://0001-mailbox-add-support-for-doorbell-signal-mode-control.patch \
     file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch \
     file://0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch \
@@ -63,19 +63,19 @@ SRC_URI_append_juno = " \
 #
 # SGI575 KMACHINE
 #
-COMPATIBLE_MACHINE_sgi575 = "sgi575"
-KMACHINE_sgi575 = "sgi575"
-KBUILD_DEFCONFIG_sgi575 = "defconfig"
-KCONFIG_MODE_sgi575 = "--alldefconfig"
+COMPATIBLE_MACHINE:sgi575 = "sgi575"
+KMACHINE:sgi575 = "sgi575"
+KBUILD_DEFCONFIG:sgi575 = "defconfig"
+KCONFIG_MODE:sgi575 = "--alldefconfig"
 
 #
 # Total Compute KMACHINE
 #
-COMPATIBLE_MACHINE_tc0 = "tc0"
-KMACHINE_tc0 = "tc0"
-KCONFIG_MODE_tc0 = "--alldefconfig"
-FILESEXTRAPATHS_prepend_tc0 := "${ARMBSPFILESPATHS}"
-SRC_URI_append_tc0 = " \
+COMPATIBLE_MACHINE:tc0 = "tc0"
+KMACHINE:tc0 = "tc0"
+KCONFIG_MODE:tc0 = "--alldefconfig"
+FILESEXTRAPATHS:prepend:tc0 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:tc0 = " \
     file://defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
     file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch \
@@ -103,12 +103,12 @@ SRC_URI_append_tc0 = " \
 #
 # N1SDP KMACHINE
 #
-FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
-COMPATIBLE_MACHINE_n1sdp = "n1sdp"
-KBUILD_DEFCONFIG_n1sdp = "defconfig"
-KCONFIG_MODE_n1sdp = "--alldefconfig"
-FILESEXTRAPATHS_prepend_n1sdp := "${ARMBSPFILESPATHS}"
-SRC_URI_append_n1sdp = " \
+FILESEXTRAPATHS:prepend:n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
+KBUILD_DEFCONFIG:n1sdp = "defconfig"
+KCONFIG_MODE:n1sdp = "--alldefconfig"
+FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
+SRC_URI:append:n1sdp = " \
     file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
@@ -121,17 +121,17 @@ SRC_URI_append_n1sdp = " \
     "
 # Since we use the intree defconfig and the preempt-rt turns off some configs
 # do_kernel_configcheck will display warnings. So, lets disable it.
-KCONF_AUDIT_LEVEL_n1sdp_pn-linux-yocto-rt = "0"
+KCONF_AUDIT_LEVEL:n1sdp:pn-linux-yocto-rt = "0"
 
 #
 # Musca B1/S2 can't run Linux
 #
-COMPATIBLE_MACHINE_musca-b1 = "(^$)"
-COMPATIBLE_MACHINE_musca-s1 = "(^$)"
+COMPATIBLE_MACHINE:musca-b1 = "(^$)"
+COMPATIBLE_MACHINE:musca-s1 = "(^$)"
 
 #
 # FVP BaseR AEMv8r64 Machine
 #
-COMPATIBLE_MACHINE_fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
-FILESEXTRAPATHS_prepend_fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
-SRC_URI_append_fvp-baser-aemv8r64 = " file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
+COMPATIBLE_MACHINE:fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
+FILESEXTRAPATHS:prepend:fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
+SRC_URI:append:fvp-baser-aemv8r64 = " file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
index 55dac3760c9b..e2f9145c47fe 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
@@ -1,5 +1,5 @@
 # Machine specific configurations
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BP}:"
 
 require linux-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
index eb584e5592bf..e21f059d389d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
 
 COMPATIBLE_MACHINE = "${MACHINE}"
 
@@ -31,12 +31,12 @@ KERNEL_IMAGETYPE = "xipImage"
 
 KCONFIG_MODE = "--alldefconfig"
 
-SRC_URI_append = " ${SRC_URI_KMETA}"
+SRC_URI:append = " ${SRC_URI_KMETA}"
 
 KERNEL_EXTRA_FEATURES = "bsp/arm-platforms/corstone700-bsp.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
 
-KERNEL_FEATURES_append_corstone700-fvp = " \
+KERNEL_FEATURES:append:corstone700-fvp = " \
     ${@bb.utils.contains('MACHINE_FEATURES', \
                          'eth_lan91c111', \
                          'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
@@ -44,7 +44,7 @@ KERNEL_FEATURES_append_corstone700-fvp = " \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
                           d)}"
 
-KERNEL_FEATURES_append_corstone700-mps3 = " \
+KERNEL_FEATURES:append:corstone700-mps3 = " \
     ${@bb.utils.contains('MACHINE_FEATURES', \
                          'eth_lan9115', \
                          'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
index 14da805d4b1c..8994c241ec37 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
@@ -1,6 +1,6 @@
 # Only enable linux-yocto-rt for n1sdp and the Armv8-R AArch64 AEM FVP
 LINUX_YOCTO_RT_REQUIRE ?= ""
-LINUX_YOCTO_RT_REQUIRE_n1sdp = "linux-arm-platforms.inc"
-LINUX_YOCTO_RT_REQUIRE_fvp-baser-aemv8r64 = "linux-arm-platforms.inc"
+LINUX_YOCTO_RT_REQUIRE:n1sdp = "linux-arm-platforms.inc"
+LINUX_YOCTO_RT_REQUIRE:fvp-baser-aemv8r64 = "linux-arm-platforms.inc"
 
 require ${LINUX_YOCTO_RT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
index f931d7d16a44..498ef1d8343b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.3:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.3:"
 
-SRC_URI_append = " file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch \
+SRC_URI:append = " file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch \
                    file://0002-perf-tests-bp_account-Make-global-variable-static.patch \
                    file://0003-perf-bench-Share-some-global-variables-to-fix-build-.patch \
                    file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
index c4c55ad1d785..02fbf05996f8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
@@ -1,12 +1,12 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.6:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.6:"
 
-SRC_URI_append = " file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
+SRC_URI:append = " file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
                    file://0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
 
 #
 # Corstone700 KMACHINE
 #
 MACHINE_KERNEL_REQUIRE ?= ""
-MACHINE_KERNEL_REQUIRE_corstone700 = "linux-yocto-corstone700.inc"
+MACHINE_KERNEL_REQUIRE:corstone700 = "linux-yocto-corstone700.inc"
 
 require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
index 607a50e5fb36..03ce8e96c880 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
@@ -1,5 +1,5 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.7:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.7:"
 
-SRC_URI_append = " file://coresight-traceid.patch \
+SRC_URI:append = " file://coresight-traceid.patch \
                    file://defconfig.patch \
                  "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
index fa4fd690c452..e03a83d6535c 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_CLIENT_REQUIRE ?= ""
-MACHINE_OPTEE_CLIENT_REQUIRE_tc0 = "optee-client-tc0.inc"
+MACHINE_OPTEE_CLIENT_REQUIRE:tc0 = "optee-client-tc0.inc"
 
 require ${MACHINE_OPTEE_CLIENT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
index c48cc6c79bf0..4d2889cfa5ea 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -5,8 +5,8 @@
 SRCREV = "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
 PV = "3.14.0+git${SRCPV}"
 
-FILESEXTRAPATHS_prepend_tc0 := "${THISDIR}/files/optee-os/tc0:"
-SRC_URI_append = " \
+FILESEXTRAPATHS:prepend:tc0 := "${THISDIR}/files/optee-os/tc0:"
+SRC_URI:append = " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
     "
@@ -27,7 +27,7 @@ EXTRA_OEMAKE += " CFG_WITH_STATS=y"
 EXTRA_OEMAKE += " CFG_CORE_SEL2_SPMC=y"
 
 # Copy optee manifest file
-do_install_append() {
+do_install:append() {
     install -d ${D}${nonarch_base_libdir}/firmware/
     install -m 644 ${WORKDIR}/sp_layout.json ${D}${nonarch_base_libdir}/firmware/
     install -m 644 \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
index 7b96a4d97d50..f3cbc2951bad 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE_tc0 = "optee-os-tc0.inc"
+MACHINE_OPTEE_OS_REQUIRE:tc0 = "optee-os-tc0.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
index 4fd1cdeec7b7..19768cb48504 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
@@ -1,6 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_TEST_REQUIRE ?= ""
-MACHINE_OPTEE_TEST_REQUIRE_tc0 = "optee-test-tc0.inc"
+MACHINE_OPTEE_TEST_REQUIRE:tc0 = "optee-test-tc0.inc"
 
 require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 7d5aeccca9d9..a3ea26fd230c 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -7,16 +7,16 @@ EXTERNAL_TOOLCHAIN ?= "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
 TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
 PATH =. "${TOOLCHAIN_PATH_ADD}"
 
-EAT_TARGET_SYS_arm ?= "${@ 'arm-none-linux-gnueabihf' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc') else 'arm-linux-gnueabihf'}"
-EAT_TARGET_SYS_aarch64 ?= "${@ 'aarch64-none-linux-gnu' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else 'aarch64-linux-gnu'}"
+EAT_TARGET_SYS:arm ?= "${@ 'arm-none-linux-gnueabihf' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc') else 'arm-linux-gnueabihf'}"
+EAT_TARGET_SYS:aarch64 ?= "${@ 'aarch64-none-linux-gnu' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else 'aarch64-linux-gnu'}"
 EAT_TARGET_SYS = "${TARGET_SYS}"
 TARGET_PREFIX = "${EAT_TARGET_SYS}-"
 
-EAT_LIBDIR_arm = "lib"
-EAT_LIBDIR_aarch64 = "lib64"
+EAT_LIBDIR:arm = "lib"
+EAT_LIBDIR:aarch64 = "lib64"
 
-GCCMULTILIB_forcevariable = "--disable-multilib"
-IMAGE_LINGUAS_forcevariable = ""
+GCCMULTILIB:forcevariable = "--disable-multilib"
+IMAGE_LINGUAS:forcevariable = ""
 
 # Blacklist toolchain recipes as a belt-and-suspenders way to use the external toolchain
 PNBLACKLIST[glibc] = "Using external toolchain"
@@ -62,7 +62,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
 ENABLE_BINARY_LOCALE_GENERATION = "0"
 GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
 LIBCOVERRIDE = ":libc-glibc"
-LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
+LIBC_DEPENDENCIES:remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
 
 ERROR_QA[type] ?= "list"
 python toolchain_metadata_setup () {
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 04486d497e63..b4232df8f565 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -12,10 +12,10 @@ BBFILE_PRIORITY_arm-toolchain = "5"
 LICENSE_PATH += "${LAYERDIR}/custom-licenses"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "hardknott"
+LAYERSERIES_COMPAT_arm-toolchain = "honister"
 
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 # These variables are used for armcompiler license
-BB_HASHBASE_WHITELIST_append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
+BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index 046ab6287b89..f237454c7432 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -1,6 +1,6 @@
 INHIBIT_DEFAULT_DEPS = "1"
 
-FILES_${PN} = "${datadir} ${bindir}"
+FILES:${PN} = "${datadir} ${bindir}"
 
 BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
 
@@ -15,7 +15,7 @@ do_install() {
     done
 }
 
-INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
+INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
 
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
index 4f0adce608a3..138245d1051f 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -15,9 +15,9 @@ EXCLUDE_FROM_SHLIBS = "1"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Skip packaging QA checks for prebuilt binaries
-INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
-INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
-INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
+INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
+INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
 
 # Skip file dependencies in RPM for prebuilt binaries
 SKIP_FILEDEPS = "1"
@@ -41,7 +41,7 @@ libexecdir = "${exec_prefix}/libexec"
 datadir = "${exec_prefix}/share"
 gcclibdir = "${libdir}/gcc"
 
-FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
 	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
 	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
@@ -54,12 +54,12 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${libexecdir}/* \
 "
 
-FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${bindir}/${TARGET_PREFIX}gdb* \
 	${datadir}/gdb/* \
 "
 
-FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
+FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
 	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
 	${prefix}/${EAT_TARGET_SYS}/bin/strip \
@@ -85,17 +85,17 @@ FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
 	${bindir}/${TARGET_PREFIX}size \
 "
 
-DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
-DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
-DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
+DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
+DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
+DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
 
-LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
-LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
-LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
+LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
+LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
+LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
 
-PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
-PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
-PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
+PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
+PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
+PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
 
 do_install() {
 	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index c506c419041f..a58eeb47a1ef 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -322,132 +322,132 @@ PACKAGES += "\
 	${PN}-staticdev \
 "
 
-INSANE_SKIP_${PN}-dbg = "staticdev"
-INSANE_SKIP_${PN}-utils += "ldflags"
-INSANE_SKIP_libstdc++ += "ldflags"
-INSANE_SKIP_libgfortran += "ldflags"
-INSANE_SKIP_libgcc += "ldflags dev-deps"
-INSANE_SKIP_libgcc-dev += "staticdev"
-INSANE_SKIP_libgfortran += "ldflags dev-deps"
-INSANE_SKIP_libstdc++ += "ldflags dev-deps"
-INSANE_SKIP_libatomic += "ldflags"
-INSANE_SKIP_libasan += "ldflags"
-INSANE_SKIP_libubsan += "ldflags"
-INSANE_SKIP_libssp += "ldflags"
-INSANE_SKIP_libgomp += "ldflags"
-INSANE_SKIP_libitm += "ldflags"
-INSANE_SKIP_gdbserver += "ldflags"
+INSANE_SKIP:${PN}-dbg = "staticdev"
+INSANE_SKIP:${PN}-utils += "ldflags"
+INSANE_SKIP:libstdc++ += "ldflags"
+INSANE_SKIP:libgfortran += "ldflags"
+INSANE_SKIP:libgcc += "ldflags dev-deps"
+INSANE_SKIP:libgcc-dev += "staticdev"
+INSANE_SKIP:libgfortran += "ldflags dev-deps"
+INSANE_SKIP:libstdc++ += "ldflags dev-deps"
+INSANE_SKIP:libatomic += "ldflags"
+INSANE_SKIP:libasan += "ldflags"
+INSANE_SKIP:libubsan += "ldflags"
+INSANE_SKIP:libssp += "ldflags"
+INSANE_SKIP:libgomp += "ldflags"
+INSANE_SKIP:libitm += "ldflags"
+INSANE_SKIP:gdbserver += "ldflags"
 
 # OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
-RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
+RPROVIDES:${PN} = "glibc rtld(GNU_HASH)"
 # Add runtime provides for the other libc* packages as well
-RPROVIDES_${PN}-dev = "glibc-dev"
-RPROVIDES_${PN}-doc = "glibc-doc"
-RPROVIDES_${PN}-dbg = "glibc-dbg"
-RPROVIDES_${PN}-pic = "glibc-pic"
-RPROVIDES_${PN}-utils = "glibc-utils"
-RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
-
-PKG_${PN} = "glibc"
-PKG_${PN}-dev = "glibc-dev"
-PKG_${PN}-doc = "glibc-doc"
-PKG_${PN}-dbg = "glibc-dbg"
-PKG_${PN}-pic = "glibc-pic"
-PKG_${PN}-utils = "glibc-utils"
-PKG_${PN}-mtrace = "glibc-mtrace"
-PKG_${PN}-gconv = "glibc-gconv"
-PKG_${PN}-extra-nss = "glibc-extra-nss"
-PKG_${PN}-thread-db = "glibc-thread-db"
-PKG_${PN}-pcprofile = "glibc-pcprofile"
-PKG_${PN}-staticdev = "glibc-staticdev"
+RPROVIDES:${PN}-dev = "glibc-dev"
+RPROVIDES:${PN}-doc = "glibc-doc"
+RPROVIDES:${PN}-dbg = "glibc-dbg"
+RPROVIDES:${PN}-pic = "glibc-pic"
+RPROVIDES:${PN}-utils = "glibc-utils"
+RPROVIDES:${PN}-mtrace = "glibc-mtrace libc-mtrace"
+
+PKG:${PN} = "glibc"
+PKG:${PN}-dev = "glibc-dev"
+PKG:${PN}-doc = "glibc-doc"
+PKG:${PN}-dbg = "glibc-dbg"
+PKG:${PN}-pic = "glibc-pic"
+PKG:${PN}-utils = "glibc-utils"
+PKG:${PN}-mtrace = "glibc-mtrace"
+PKG:${PN}-gconv = "glibc-gconv"
+PKG:${PN}-extra-nss = "glibc-extra-nss"
+PKG:${PN}-thread-db = "glibc-thread-db"
+PKG:${PN}-pcprofile = "glibc-pcprofile"
+PKG:${PN}-staticdev = "glibc-staticdev"
 
 PKGV = "${EAT_VER_LIBC}"
-PKGV_${PN} = "${EAT_VER_LIBC}"
-PKGV_${PN}-dev = "${EAT_VER_LIBC}"
-PKGV_${PN}-doc = "${EAT_VER_LIBC}"
-PKGV_${PN}-dbg = "${EAT_VER_LIBC}"
-PKGV_${PN}-pic = "${EAT_VER_LIBC}"
-PKGV_${PN}-utils = "${EAT_VER_LIBC}"
-PKGV_${PN}-mtrace = "${EAT_VER_LIBC}"
-PKGV_${PN}-gconv = "${EAT_VER_LIBC}"
-PKGV_${PN}-extra-nss = "${EAT_VER_LIBC}"
-PKGV_${PN}-thread-db = "${EAT_VER_LIBC}"
-PKGV_${PN}-pcprofile = "${EAT_VER_LIBC}"
-PKGV_${PN}-staticdev = "${EAT_VER_LIBC}"
-PKGV_catchsegv = "${EAT_VER_LIBC}"
-PKGV_glibc-extra-nss = "${EAT_VER_LIBC}"
-PKGV_glibc-thread-db = "${EAT_VER_LIBC}"
-
-PKGV_libmemusage = "${EAT_VER_LIBC}"
-PKGV_libsegfault = "${EAT_VER_LIBC}"
-PKGV_libsotruss = "${EAT_VER_LIBC}"
-PKGV_sln = "${EAT_VER_LIBC}"
-PKGV_nscd = "${EAT_VER_LIBC}"
-PKGV_ldd = "${EAT_VER_LIBC}"
-
-PKGV_libasan-dev = "${EAT_VER_GCC}"
-PKGV_libasan = "${EAT_VER_GCC}"
-PKGV_libasan-staticdev = "${EAT_VER_GCC}"
-PKGV_libatomic-dev = "${EAT_VER_GCC}"
-PKGV_libatomic = "${EAT_VER_GCC}"
-PKGV_libatomic-staticdev = "${EAT_VER_GCC}"
-PKGV_libg2c-dev = "${EAT_VER_GCC}"
-PKGV_libg2c = "${EAT_VER_GCC}"
-PKGV_libgcc-dev = "${EAT_VER_GCC}"
-PKGV_libgcc = "${EAT_VER_GCC}"
-PKGV_libgfortran-dbg = "${EAT_VER_GCC}"
-PKGV_libgfortran-dev = "${EAT_VER_GCC}"
-PKGV_libgfortran = "${EAT_VER_GCC}"
-PKGV_libgfortran-staticdev = "${EAT_VER_GCC}"
-PKGV_libgomp-dev = "${EAT_VER_GCC}"
-PKGV_libgomp = "${EAT_VER_GCC}"
-PKGV_libgomp-staticdev = "${EAT_VER_GCC}"
-PKGV_libitm-dev = "${EAT_VER_GCC}"
-PKGV_libitm = "${EAT_VER_GCC}"
-PKGV_libitm-staticdev = "${EAT_VER_GCC}"
-PKGV_liblsan-dev = "${EAT_VER_GCC}"
-PKGV_liblsan = "${EAT_VER_GCC}"
-PKGV_liblsan-staticdev = "${EAT_VER_GCC}"
-PKGV_libmudflap-dev = "${EAT_VER_GCC}"
-PKGV_libmudflap = "${EAT_VER_GCC}"
-PKGV_libmudflap-staticdev = "${EAT_VER_GCC}"
-PKGV_libquadmath-dev = "${EAT_VER_GCC}"
-PKGV_libquadmath = "${EAT_VER_GCC}"
-PKGV_libquadmath-staticdev = "${EAT_VER_GCC}"
-PKGV_libssp-dev = "${EAT_VER_GCC}"
-PKGV_libssp = "${EAT_VER_GCC}"
-PKGV_libssp-staticdev = "${EAT_VER_GCC}"
-PKGV_libstdc++-dbg = "${EAT_VER_GCC}"
-PKGV_libstdc++-dev = "${EAT_VER_GCC}"
-PKGV_libstdc++ = "${EAT_VER_GCC}"
-PKGV_libstdc++-precompile-dev = "${EAT_VER_GCC}"
-PKGV_libstdc++-staticdev = "${EAT_VER_GCC}"
-PKGV_libtsan-dev = "${EAT_VER_GCC}"
-PKGV_libtsan = "${EAT_VER_GCC}"
-PKGV_libtsan-staticdev = "${EAT_VER_GCC}"
-PKGV_libubsan-dev = "${EAT_VER_GCC}"
-PKGV_libubsan = "${EAT_VER_GCC}"
-PKGV_libubsan-staticdev = "${EAT_VER_GCC}"
-
-PKGV_linux-libc-headers-dev = "${EAT_VER_KERNEL}"
-PKGV_linux-libc-headers = "${EAT_VER_KERNEL}"
-
-PKGV_gdbserver = "${EAT_VER_GDBSERVER}"
-
-ALLOW_EMPTY_${PN}-mtrace = "1"
-FILES_${PN}-mtrace = "${bindir}/mtrace"
-
-FILES_libgcov-staticdev = "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov.a"
-
-FILES_libsegfault = "${base_libdir}/libSegFault*"
-
-FILES_catchsegv = "${bindir}/catchsegv"
-RDEPENDS_catchsegv = "libsegfault"
+PKGV:${PN} = "${EAT_VER_LIBC}"
+PKGV:${PN}-dev = "${EAT_VER_LIBC}"
+PKGV:${PN}-doc = "${EAT_VER_LIBC}"
+PKGV:${PN}-dbg = "${EAT_VER_LIBC}"
+PKGV:${PN}-pic = "${EAT_VER_LIBC}"
+PKGV:${PN}-utils = "${EAT_VER_LIBC}"
+PKGV:${PN}-mtrace = "${EAT_VER_LIBC}"
+PKGV:${PN}-gconv = "${EAT_VER_LIBC}"
+PKGV:${PN}-extra-nss = "${EAT_VER_LIBC}"
+PKGV:${PN}-thread-db = "${EAT_VER_LIBC}"
+PKGV:${PN}-pcprofile = "${EAT_VER_LIBC}"
+PKGV:${PN}-staticdev = "${EAT_VER_LIBC}"
+PKGV:catchsegv = "${EAT_VER_LIBC}"
+PKGV:glibc-extra-nss = "${EAT_VER_LIBC}"
+PKGV:glibc-thread-db = "${EAT_VER_LIBC}"
+
+PKGV:libmemusage = "${EAT_VER_LIBC}"
+PKGV:libsegfault = "${EAT_VER_LIBC}"
+PKGV:libsotruss = "${EAT_VER_LIBC}"
+PKGV:sln = "${EAT_VER_LIBC}"
+PKGV:nscd = "${EAT_VER_LIBC}"
+PKGV:ldd = "${EAT_VER_LIBC}"
+
+PKGV:libasan-dev = "${EAT_VER_GCC}"
+PKGV:libasan = "${EAT_VER_GCC}"
+PKGV:libasan-staticdev = "${EAT_VER_GCC}"
+PKGV:libatomic-dev = "${EAT_VER_GCC}"
+PKGV:libatomic = "${EAT_VER_GCC}"
+PKGV:libatomic-staticdev = "${EAT_VER_GCC}"
+PKGV:libg2c-dev = "${EAT_VER_GCC}"
+PKGV:libg2c = "${EAT_VER_GCC}"
+PKGV:libgcc-dev = "${EAT_VER_GCC}"
+PKGV:libgcc = "${EAT_VER_GCC}"
+PKGV:libgfortran-dbg = "${EAT_VER_GCC}"
+PKGV:libgfortran-dev = "${EAT_VER_GCC}"
+PKGV:libgfortran = "${EAT_VER_GCC}"
+PKGV:libgfortran-staticdev = "${EAT_VER_GCC}"
+PKGV:libgomp-dev = "${EAT_VER_GCC}"
+PKGV:libgomp = "${EAT_VER_GCC}"
+PKGV:libgomp-staticdev = "${EAT_VER_GCC}"
+PKGV:libitm-dev = "${EAT_VER_GCC}"
+PKGV:libitm = "${EAT_VER_GCC}"
+PKGV:libitm-staticdev = "${EAT_VER_GCC}"
+PKGV:liblsan-dev = "${EAT_VER_GCC}"
+PKGV:liblsan = "${EAT_VER_GCC}"
+PKGV:liblsan-staticdev = "${EAT_VER_GCC}"
+PKGV:libmudflap-dev = "${EAT_VER_GCC}"
+PKGV:libmudflap = "${EAT_VER_GCC}"
+PKGV:libmudflap-staticdev = "${EAT_VER_GCC}"
+PKGV:libquadmath-dev = "${EAT_VER_GCC}"
+PKGV:libquadmath = "${EAT_VER_GCC}"
+PKGV:libquadmath-staticdev = "${EAT_VER_GCC}"
+PKGV:libssp-dev = "${EAT_VER_GCC}"
+PKGV:libssp = "${EAT_VER_GCC}"
+PKGV:libssp-staticdev = "${EAT_VER_GCC}"
+PKGV:libstdc++-dbg = "${EAT_VER_GCC}"
+PKGV:libstdc++-dev = "${EAT_VER_GCC}"
+PKGV:libstdc++ = "${EAT_VER_GCC}"
+PKGV:libstdc++-precompile-dev = "${EAT_VER_GCC}"
+PKGV:libstdc++-staticdev = "${EAT_VER_GCC}"
+PKGV:libtsan-dev = "${EAT_VER_GCC}"
+PKGV:libtsan = "${EAT_VER_GCC}"
+PKGV:libtsan-staticdev = "${EAT_VER_GCC}"
+PKGV:libubsan-dev = "${EAT_VER_GCC}"
+PKGV:libubsan = "${EAT_VER_GCC}"
+PKGV:libubsan-staticdev = "${EAT_VER_GCC}"
+
+PKGV:linux-libc-headers-dev = "${EAT_VER_KERNEL}"
+PKGV:linux-libc-headers = "${EAT_VER_KERNEL}"
+
+PKGV:gdbserver = "${EAT_VER_GDBSERVER}"
+
+ALLOW_EMPTY:${PN}-mtrace = "1"
+FILES:${PN}-mtrace = "${bindir}/mtrace"
+
+FILES:libgcov-staticdev = "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov.a"
+
+FILES:libsegfault = "${base_libdir}/libSegFault*"
+
+FILES:catchsegv = "${bindir}/catchsegv"
+RDEPENDS:catchsegv = "libsegfault"
 
 # From libgfortran.inc:
 
-FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = "\
+FILES:libgfortran = "${libdir}/libgfortran.so.*"
+FILES:libgfortran-dev = "\
     ${libdir}/libgfortran*.so \
     ${libdir}/libgfortran.spec \
     ${libdir}/libgfortran.la \
@@ -455,49 +455,49 @@ FILES_libgfortran-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
 "
-FILES_libgfortran-staticdev = "${libdir}/libgfortran.a"
+FILES:libgfortran-staticdev = "${libdir}/libgfortran.a"
 
 
 # From gcc-sanitizers.inc:
 
-FILES_libasan += "${libdir}/libasan.so.*"
-FILES_libasan-dev += "\
+FILES:libasan += "${libdir}/libasan.so.*"
+FILES:libasan-dev += "\
     ${libdir}/libasan_preinit.o \
     ${libdir}/libasan.so \
     ${libdir}/libasan.la \
 "
-FILES_libasan-staticdev += "${libdir}/libasan.a"
+FILES:libasan-staticdev += "${libdir}/libasan.a"
 
-FILES_libubsan += "${libdir}/libubsan.so.*"
-FILES_libubsan-dev += "\
+FILES:libubsan += "${libdir}/libubsan.so.*"
+FILES:libubsan-dev += "\
     ${libdir}/libubsan.so \
     ${libdir}/libubsan.la \
 "
-FILES_libubsan-staticdev += "${libdir}/libubsan.a"
+FILES:libubsan-staticdev += "${libdir}/libubsan.a"
 
-FILES_liblsan += "${libdir}/liblsan.so.*"
-FILES_liblsan-dev += "\
+FILES:liblsan += "${libdir}/liblsan.so.*"
+FILES:liblsan-dev += "\
     ${libdir}/liblsan.so \
     ${libdir}/liblsan.la \
     ${libdir}/liblsan_preinit.o \
 "
-FILES_liblsan-staticdev += "${libdir}/liblsan.a"
+FILES:liblsan-staticdev += "${libdir}/liblsan.a"
 
-FILES_libtsan += "${libdir}/libtsan.so.*"
-FILES_libtsan-dev += "\
+FILES:libtsan += "${libdir}/libtsan.so.*"
+FILES:libtsan-dev += "\
     ${libdir}/libtsan.so \
     ${libdir}/libtsan.la \
     ${libdir}/libtsan_*.o \
 "
-FILES_libtsan-staticdev += "${libdir}/libtsan.a"
+FILES:libtsan-staticdev += "${libdir}/libtsan.a"
 
-FILES_gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
+FILES:gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
 
 # From libgcc.inc:
 
-FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
+FILES:libgcc = "${base_libdir}/libgcc_s.so.1"
 
-FILES_libgcc-dev = "\
+FILES:libgcc-dev = "\
     ${base_libdir}/libgcc*.so \
     ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
@@ -505,8 +505,8 @@ FILES_libgcc-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
 "
 
-FILES_linux-libc-headers = ""
-FILES_linux-libc-headers-dev = "\
+FILES:linux-libc-headers = ""
+FILES:linux-libc-headers-dev = "\
 	${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
@@ -515,7 +515,7 @@ FILES_linux-libc-headers-dev = "\
 	${includedir}/sound \
 	${includedir}/video \
 "
-FILES_${PN} += "\
+FILES:${PN} += "\
 	${libdir}/bin \
 	${libdir}/locale \
 	${libdir}/gconv/gconv-modules \
@@ -563,112 +563,112 @@ FILES_${PN} += "\
 	${base_libdir}/libpcprofile.so \
     "
 
-FILES_${PN}-dbg += "${base_libdir}/debug"
+FILES:${PN}-dbg += "${base_libdir}/debug"
 
 # From gcc-runtime.inc
 
 # include python debugging scripts
-FILES_gcc-runtime-dbg += "\
+FILES:gcc-runtime-dbg += "\
     ${libdir}/libstdc++.so.*-gdb.py \
     ${datadir}/gcc-${BINV}/python/libstdcxx \
 "
 
-FILES_libg2c = "${target_libdir}/libg2c.so.*"
-SUMMARY_libg2c = "Companion runtime library for g77"
-FILES_libg2c-dev = "\
+FILES:libg2c = "${target_libdir}/libg2c.so.*"
+SUMMARY:libg2c = "Companion runtime library for g77"
+FILES:libg2c-dev = "\
     ${libdir}/libg2c.so \
     ${libdir}/libg2c.a \
     ${libdir}/libfrtbegin.a \
 "
-SUMMARY_libg2c-dev = "Companion runtime library for g77 - development files"
+SUMMARY:libg2c-dev = "Companion runtime library for g77 - development files"
 
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-SUMMARY_libstdc++ = "GNU standard C++ library"
-FILES_libstdc++-dev = "\
+FILES:libstdc++ = "${libdir}/libstdc++.so.*"
+SUMMARY:libstdc++ = "GNU standard C++ library"
+FILES:libstdc++-dev = "\
     /include/c++ \
     ${includedir}/c++/ \
     ${libdir}/libstdc++.so \
     ${libdir}/libstdc++*.la \
     ${libdir}/libsupc++.la \
 "
-SUMMARY_libstdc++-dev = "GNU standard C++ library - development files"
+SUMMARY:libstdc++-dev = "GNU standard C++ library - development files"
 
-FILES_libstdc++-staticdev = "\
+FILES:libstdc++-staticdev = "\
     ${libdir}/libstdc++*.a \
     ${libdir}/libsupc++.a \
 "
-SUMMARY_libstdc++-staticdev = "GNU standard C++ library - static development files"
+SUMMARY:libstdc++-staticdev = "GNU standard C++ library - static development files"
 
-FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
-SUMMARY_libstdc++-precompile-dev = "GNU standard C++ library - precompiled header files"
+FILES:libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
+SUMMARY:libstdc++-precompile-dev = "GNU standard C++ library - precompiled header files"
 
-FILES_libssp = "${libdir}/libssp.so.*"
-SUMMARY_libssp = "GNU stack smashing protection library"
-FILES_libssp-dev = "\
+FILES:libssp = "${libdir}/libssp.so.*"
+SUMMARY:libssp = "GNU stack smashing protection library"
+FILES:libssp-dev = "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
     ${libdir}/libssp*.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
 "
-SUMMARY_libssp-dev = "GNU stack smashing protection library - development files"
-FILES_libssp-staticdev = "${libdir}/libssp*.a"
-SUMMARY_libssp-staticdev = "GNU stack smashing protection library - static development files"
+SUMMARY:libssp-dev = "GNU stack smashing protection library - development files"
+FILES:libssp-staticdev = "${libdir}/libssp*.a"
+SUMMARY:libssp-staticdev = "GNU stack smashing protection library - static development files"
 
-FILES_libquadmath = "${libdir}/libquadmath*.so.*"
-SUMMARY_libquadmath = "GNU quad-precision math library"
-FILES_libquadmath-dev = "\
+FILES:libquadmath = "${libdir}/libquadmath*.so.*"
+SUMMARY:libquadmath = "GNU quad-precision math library"
+FILES:libquadmath-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
     ${libdir}/libquadmath*.so \
     ${libdir}/libquadmath.la \
 "
-SUMMARY_libquadmath-dev = "GNU quad-precision math library - development files"
-FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
-SUMMARY_libquadmath-staticdev = "GNU quad-precision math library - static development files"
+SUMMARY:libquadmath-dev = "GNU quad-precision math library - development files"
+FILES:libquadmath-staticdev = "${libdir}/libquadmath.a"
+SUMMARY:libquadmath-staticdev = "GNU quad-precision math library - static development files"
 
 # NOTE: mudflap has been removed as of gcc 4.9 and has been superseded by the address sanitiser
-FILES_libmudflap = "${libdir}/libmudflap*.so.*"
-SUMMARY_libmudflap = "Pointer debugging library for gcc"
-FILES_libmudflap-dev = "\
+FILES:libmudflap = "${libdir}/libmudflap*.so.*"
+SUMMARY:libmudflap = "Pointer debugging library for gcc"
+FILES:libmudflap-dev = "\
     ${libdir}/libmudflap*.so \
     ${libdir}/libmudflap.la \
 "
-SUMMARY_libmudflap-dev = "Pointer debugging library for gcc - development files"
-FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
-SUMMARY_libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
+SUMMARY:libmudflap-dev = "Pointer debugging library for gcc - development files"
+FILES:libmudflap-staticdev = "${libdir}/libmudflap.a"
+SUMMARY:libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
 
-FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
-SUMMARY_libgomp = "GNU OpenMP parallel programming library"
-FILES_libgomp-dev = "\
+FILES:libgomp = "${libdir}/libgomp*${SOLIBS}"
+SUMMARY:libgomp = "GNU OpenMP parallel programming library"
+FILES:libgomp-dev = "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
-SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library - development files"
-FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
-SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library - static development files"
+SUMMARY:libgomp-dev = "GNU OpenMP parallel programming library - development files"
+FILES:libgomp-staticdev = "${libdir}/libgomp*.a"
+SUMMARY:libgomp-staticdev = "GNU OpenMP parallel programming library - static development files"
 
-FILES_libatomic = "${libdir}/libatomic.so.*"
-SUMMARY_libatomic = "GNU C++11 atomics support library"
-FILES_libatomic-dev = "\
+FILES:libatomic = "${libdir}/libatomic.so.*"
+SUMMARY:libatomic = "GNU C++11 atomics support library"
+FILES:libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
 "
-SUMMARY_libatomic-dev = "GNU C++11 atomics support library - development files"
-FILES_libatomic-staticdev = "${libdir}/libatomic.a"
-SUMMARY_libatomic-staticdev = "GNU C++11 atomics support library - static development files"
+SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a"
+SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
-FILES_libitm = "${libdir}/libitm.so.*"
-SUMMARY_libitm = "GNU transactional memory support library"
-FILES_libitm-dev = "\
+FILES:libitm = "${libdir}/libitm.so.*"
+SUMMARY:libitm = "GNU transactional memory support library"
+FILES:libitm-dev = "\
     ${libdir}/libitm.so \
     ${libdir}/libitm.la \
     ${libdir}/libitm.spec \
 "
-SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
-FILES_libitm-staticdev = "${libdir}/libitm.a"
-SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
+SUMMARY:libitm-dev = "GNU transactional memory support library - development files"
+FILES:libitm-staticdev = "${libdir}/libitm.a"
+SUMMARY:libitm-staticdev = "GNU transactional memory support library - static development files"
 
 EAT_VER_MAIN ??= ""
 
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 91caee13da8f..fabe1b161a56 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
@@ -9,8 +9,8 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
-LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
-LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
+LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
+LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
index fcc9268166cb..67daa413ef46 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -6,74 +6,74 @@ EAT_GDB_LICENSE = "GPL-3.0"
 EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
 EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
 
-LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
-LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
-LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
-LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
-LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-dev = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-doc = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-dbg = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-pic = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-utils = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-mtrace = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-gconv = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-thread-db = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
+LICENSE:${PN}-staticdev = "${EAT_LIBC_LICENSE}"
+LICENSE:catchsegv = "${EAT_LIBC_LICENSE}"
+LICENSE:glibc-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE:glibc-thread-db = "${EAT_LIBC_LICENSE}"
 
-LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
-LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
-LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
-LICENSE_sln = "${EAT_LIBC_LICENSE}"
-LICENSE_nscd = "${EAT_LIBC_LICENSE}"
-LICENSE_ldd = "${EAT_LIBC_LICENSE}"
+LICENSE:libmemusage = "${EAT_LIBC_LICENSE}"
+LICENSE:libsegfault = "${EAT_LIBC_LICENSE}"
+LICENSE:libsotruss = "${EAT_LIBC_LICENSE}"
+LICENSE:sln = "${EAT_LIBC_LICENSE}"
+LICENSE:nscd = "${EAT_LIBC_LICENSE}"
+LICENSE:ldd = "${EAT_LIBC_LICENSE}"
 
-LICENSE_libasan-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libasan = "${EAT_GCC_LICENSE}"
-LICENSE_libasan-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libatomic-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libatomic = "${EAT_GCC_LICENSE}"
-LICENSE_libatomic-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libg2c-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libg2c = "${EAT_GCC_LICENSE}"
-LICENSE_libgcc-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libgcc = "${EAT_GCC_LICENSE}"
-LICENSE_libgfortran-dbg = "${EAT_GCC_LICENSE}"
-LICENSE_libgfortran-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libgfortran = "${EAT_GCC_LICENSE}"
-LICENSE_libgfortran-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libgomp-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libgomp = "${EAT_GCC_LICENSE}"
-LICENSE_libgomp-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libitm-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libitm = "${EAT_GCC_LICENSE}"
-LICENSE_libitm-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_liblsan-dev = "${EAT_GCC_LICENSE}"
-LICENSE_liblsan = "${EAT_GCC_LICENSE}"
-LICENSE_liblsan-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libmudflap-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libmudflap = "${EAT_GCC_LICENSE}"
-LICENSE_libmudflap-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libquadmath-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libquadmath = "${EAT_GCC_LICENSE}"
-LICENSE_libquadmath-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libssp-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libssp = "${EAT_GCC_LICENSE}"
-LICENSE_libssp-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libstdc++-dbg = "${EAT_GCC_LICENSE}"
-LICENSE_libstdc++-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libstdc++ = "${EAT_GCC_LICENSE}"
-LICENSE_libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libstdc++-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libtsan-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libtsan = "${EAT_GCC_LICENSE}"
-LICENSE_libtsan-staticdev = "${EAT_GCC_LICENSE}"
-LICENSE_libubsan-dev = "${EAT_GCC_LICENSE}"
-LICENSE_libubsan = "${EAT_GCC_LICENSE}"
-LICENSE_libubsan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libasan-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libasan = "${EAT_GCC_LICENSE}"
+LICENSE:libasan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libatomic-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libatomic = "${EAT_GCC_LICENSE}"
+LICENSE:libatomic-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libg2c-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libg2c = "${EAT_GCC_LICENSE}"
+LICENSE:libgcc-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libgcc = "${EAT_GCC_LICENSE}"
+LICENSE:libgfortran-dbg = "${EAT_GCC_LICENSE}"
+LICENSE:libgfortran-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libgfortran = "${EAT_GCC_LICENSE}"
+LICENSE:libgfortran-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libgomp-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libgomp = "${EAT_GCC_LICENSE}"
+LICENSE:libgomp-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libitm-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libitm = "${EAT_GCC_LICENSE}"
+LICENSE:libitm-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:liblsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE:liblsan = "${EAT_GCC_LICENSE}"
+LICENSE:liblsan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libmudflap-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libmudflap = "${EAT_GCC_LICENSE}"
+LICENSE:libmudflap-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libquadmath-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libquadmath = "${EAT_GCC_LICENSE}"
+LICENSE:libquadmath-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libssp-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libssp = "${EAT_GCC_LICENSE}"
+LICENSE:libssp-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libstdc++-dbg = "${EAT_GCC_LICENSE}"
+LICENSE:libstdc++-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libstdc++ = "${EAT_GCC_LICENSE}"
+LICENSE:libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libstdc++-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libtsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libtsan = "${EAT_GCC_LICENSE}"
+LICENSE:libtsan-staticdev = "${EAT_GCC_LICENSE}"
+LICENSE:libubsan-dev = "${EAT_GCC_LICENSE}"
+LICENSE:libubsan = "${EAT_GCC_LICENSE}"
+LICENSE:libubsan-staticdev = "${EAT_GCC_LICENSE}"
 
-LICENSE_linux-libc-headers-dev = "GPLv2"
-LICENSE_linux-libc-headers = "GPLv2"
+LICENSE:linux-libc-headers-dev = "GPLv2"
+LICENSE:linux-libc-headers = "GPLv2"
 
-LICENSE_gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LICENSE:gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
index 2a8229309efa..dc611c3348ce 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
@@ -82,7 +82,7 @@ FORTRAN = ""
 JAVA = ""
 
 SSP ?= "--disable-libssp"
-SSP_mingw32 = "--enable-libssp"
+SSP:mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${SSP} \
@@ -112,7 +112,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-libssp \
 "
 
-EXTRA_OECONF_append_aarchilp32 = " --with-abi=ilp32"
+EXTRA_OECONF:append_aarchilp32 = " --with-abi=ilp32"
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
index 392c57fe02e7..d7cc4e7b6e2d 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -9,7 +9,7 @@
 # copy the file for target build in recipe-specific sysroot, in external-arm
 # toolchain mode and if the required file does not exist already.
 
-do_install_prepend_class-target () {
+do_install:prepend:class-target () {
 	if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
 		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
 		install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
@@ -20,7 +20,7 @@ do_install_prepend_class-target () {
 # gcc installs additional aliases as ${TARGET_SYS}-${EAT_TARGET_SYS}-gcc, etc.
 # Since those are not packaged and not too useful, let's remove them to avoid
 # QA issues
-do_install_append () {
+do_install:append () {
 	for f in g++ gcc gcc-ar gcc-ranlib gcc-nm; do
 		rm -f ${D}${bindir}/${TARGET_SYS}-${EAT_TARGET_SYS}-$f
 	done
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
index 9c41e926107e..e88ebe1adc15 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
@@ -3,5 +3,5 @@ require recipes-devtools/gcc/gcc-sanitizers.inc
 
 # Building with thumb enabled on armv4t armv5t fails with
 # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
index 51a087720252..92967301d497 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
@@ -5,11 +5,11 @@ require recipes-devtools/gcc/gcc-arm-common.inc
 # Building with thumb enabled on armv4t armv5t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
 
-ARMFPARCHEXT_armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
-ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
-ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT:armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT:armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT:armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
index 32f3dc09ceec..ca1159c5ba0b 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/libgcc-initial.inc
 
 # Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET_armv6 = "arm"
+ARM_INSTRUCTION_SET:armv6 = "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
index 572bab185d0e..35ac5dfe1d63 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/libgcc.inc
 
 # Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET_armv6 = "arm"
+ARM_INSTRUCTION_SET:armv6 = "arm"
diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
index b247d6edf718..84663d4715fb 100644
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -20,4 +20,4 @@ QB_RNG = ""
 # Zephyr RTOS settings
 ZEPHYR_BOARD = "qemu_cortex_m0"
 ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH_qemu-cortex-m0 = "arm"
+ARCH:qemu-cortex-m0 = "arm"
diff --git a/meta-arm/conf/machine/qemu-cortex-a53.conf b/meta-arm/conf/machine/qemu-cortex-a53.conf
index 228002cd5a20..294c65f549ce 100644
--- a/meta-arm/conf/machine/qemu-cortex-a53.conf
+++ b/meta-arm/conf/machine/qemu-cortex-a53.conf
@@ -16,4 +16,4 @@ QB_OPT_APPEND = "-nographic -vga none"
 # Zephyr RTOS settings
 ZEPHYR_BOARD = "qemu_cortex_a53"
 ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH_qemu-cortex-a53 = "aarch64"
+ARCH:qemu-cortex-a53 = "aarch64"
diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
index 3e4751e3dbbf..c7235173adc0 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
@@ -52,7 +52,7 @@ EXTRA_OEMAKE += "'KERNEL_IMAGE=${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_KERNEL
 EXTRA_OEMAKE += "'CMDLINE=${BOOT_WRAPPER_AARCH64_CMDLINE}'"
 
 
-do_configure_prepend() {
+do_configure:prepend() {
     # Create dummy files to make configure happy.
     # We will pass the generated ones directly to make.
     mkdir -p ${WORKDIR}/kernel/arch/arm64/boot
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
index 6d8bb3f51616..be510a12c6a8 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -33,7 +33,7 @@ DEPENDS = "bison-native bc-native openssl-native"
 # set project to build
 EXTRA_OEMAKE += "PROJECT=${HAFNIUM_PROJECT}"
 
-do_compile_prepend() {
+do_compile:prepend() {
     # Hafnium expects 'python'. Create symlink python to python3
     real=$(which ${PYTHON})
     ln -snf $real $(dirname $real)/python
@@ -64,10 +64,10 @@ do_install() {
     done
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 # skip QA tests: {'ldflags'}
-INSANE_SKIP_${PN} = "ldflags"
+INSANE_SKIP:${PN} = "ldflags"
 
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
index ca7017a3a99b..d40d82db4100 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
@@ -67,12 +67,12 @@ do_install() {
      done
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 
-FILES_${PN}-dbg += "/firmware/*.elf"
+FILES:${PN}-dbg += "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN}-dbg = "arch textrel"
+INSANE_SKIP:${PN}-dbg = "arch textrel"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 57f1438a6a40..a1e59d8889d5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -48,12 +48,12 @@ SRC_URI_MBEDTLS ??= ""
 # This should be set to MBEDTLS LIC FILES checksum
 LIC_FILES_CHKSUM_MBEDTLS ??= ""
 # add MBEDTLS to our sources if activated
-SRC_URI_append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
+SRC_URI:append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
 # Update license variables
-LICENSE_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '', d)}"
-LIC_FILES_CHKSUM_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+LICENSE:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '', d)}"
+LIC_FILES_CHKSUM:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
-SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
+SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
 
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
@@ -82,12 +82,12 @@ LD[unexport] = "1"
 do_configure[noexec] = "1"
 
 # Baremetal, just need a compiler
-DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
 DEPENDS = "dtc-native openssl-native"
-DEPENDS_append_toolchain-clang = " compiler-rt"
+DEPENDS:append:toolchain-clang = " compiler-rt"
 
 # CC and LD introduce arguments which conflict with those otherwise provided by
 # this recipe. The heads of these variables excluding those arguments
@@ -217,12 +217,12 @@ do_install() {
     done
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 
-FILES_${PN}-dbg = "/firmware/*.elf"
+FILES:${PN}-dbg = "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN}-dbg = "textrel"
+INSANE_SKIP:${PN}-dbg = "textrel"
 
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index dd74cd537099..5b5a04978997 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,26 +1,26 @@
-COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
 
-TFA_PLATFORM_qemuarm64-secureboot = "qemu"
-TFA_PLATFORM_qemuarm64-sbsa = "qemu_sbsa"
+TFA_PLATFORM:qemuarm64-secureboot = "qemu"
+TFA_PLATFORM:qemuarm64-sbsa = "qemu_sbsa"
 
-TFA_SPD_qemuarm64-secureboot = "opteed"
+TFA_SPD:qemuarm64-secureboot = "opteed"
 
-TFA_UBOOT_qemuarm64-secureboot = "1"
-TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
+TFA_UBOOT:qemuarm64-secureboot = "1"
+TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
 
-TFA_INSTALL_TARGET_qemuarm64-secureboot = "flash.bin"
-TFA_INSTALL_TARGET_qemuarm64-sbsa = "bl1 fip"
+TFA_INSTALL_TARGET:qemuarm64-secureboot = "flash.bin"
+TFA_INSTALL_TARGET:qemuarm64-sbsa = "bl1 fip"
 
-DEPENDS_append_aarch64_qemuall = " optee-os"
+DEPENDS:append:aarch64:qemuall = " optee-os"
 
-EXTRA_OEMAKE_append_aarch64_qemuall = " \
+EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
     BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
     BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
     BL32_RAM_LOCATION=tdram \
     "
 
-do_compile_append_qemuarm64-secureboot() {
+do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
     # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
     dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
index c954e0222201..7c850b0141da 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
@@ -118,7 +118,7 @@ do_install() {
     install -m 0644 ${B}/bin/* ${D}/firmware/
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 
 addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
index afcd70a947ff..f72515669ce1 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,3 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
+SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index c5ab48c1a021..4b4408600043 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -38,7 +38,7 @@ EDK2_EXTRA_BUILD   = ""
 EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
 
 # Baremetal, no need for a C library
-DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 DEPENDS += "util-linux-native iasl-native"
 
 inherit deploy
@@ -63,9 +63,9 @@ export CONF_PATH           = "${S}/Conf"
 export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
 
 EDK_COMPILER ?= "GCC5"
-EDK_COMPILER_toolchain-clang = "CLANG38"
+EDK_COMPILER:toolchain-clang = "CLANG38"
 
-do_configure_prepend() {
+do_configure:prepend() {
     sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
 }
 
@@ -95,10 +95,10 @@ do_install() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/${EDK2_BIN_NAME} ${D}/firmware/uefi.bin
 }
 
-FILES_${PN} = "/firmware"
+FILES:${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} = "textrel"
+INSANE_SKIP:${PN} = "textrel"
 
 do_deploy() {
     # Copy the images to deploy directory
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 8330ac9423d4..fbdec1fb5bb8 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,25 +1,25 @@
 COMPATIBLE_MACHINE = "qemuarm64"
 
-DEPENDS_append_qemuarm64-sbsa = " virtual/trusted-firmware-a"
+DEPENDS:append:qemuarm64-sbsa = " virtual/trusted-firmware-a"
 
-EDK2_BUILD_RELEASE_aarch64_qemuall = "1"
-EDK2_ARCH_aarch64_qemuall          = "AARCH64"
+EDK2_BUILD_RELEASE:aarch64:qemuall = "1"
+EDK2_ARCH:aarch64:qemuall          = "AARCH64"
 
-EDK2_PLATFORM_qemuarm64-sbsa      = "SbsaQemu"
-EDK2_PLATFORM_DSC_qemuarm64-sbsa  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
-EDK2_BIN_NAME_qemuarm64-sbsa      = "SBSA_FLASH0.fd"
+EDK2_PLATFORM:qemuarm64-sbsa      = "SbsaQemu"
+EDK2_PLATFORM_DSC:qemuarm64-sbsa  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
+EDK2_BIN_NAME:qemuarm64-sbsa      = "SBSA_FLASH0.fd"
 
-EDK2_PLATFORM_qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
-EDK2_PLATFORM_DSC_qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
-EDK2_BIN_NAME_qemuarm64-secureboot      = "QEMU_EFI.fd"
+EDK2_PLATFORM:qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
+EDK2_PLATFORM_DSC:qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
+EDK2_BIN_NAME:qemuarm64-secureboot      = "QEMU_EFI.fd"
 
-do_compile_prepend_qemuarm64-sbsa() {
+do_compile:prepend:qemuarm64-sbsa() {
     mkdir -p ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
 }
 
-do_install_append_qemuarm64-sbsa() {
+do_install:append:qemuarm64-sbsa() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin
     /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
index c0d8e914d12d..14f6606e2d53 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -1,6 +1,6 @@
 require recipes-bsp/uefi/edk2-firmware_202102.bb
 
-PROVIDES_remove = "virtual/uefi-firmware"
+PROVIDES:remove = "virtual/uefi-firmware"
 
 LICENSE += "& Apache-2.0"
 LIC_FILES_CHKSUM += "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/recipes-devtools/fvp/fvp-common.inc
index ec8225116013..d6fbf871fffc 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -21,12 +21,12 @@ fvp_link_binaries() {
     rm -f ${D}${bindir}/*.so
 }
 
-FILES_${PN} = "${bindir} ${FVPDIR}"
+FILES:${PN} = "${bindir} ${FVPDIR}"
 
 # Prebuilt binaries are already stripped
-INSANE_SKIP_${PN} += "already-stripped"
+INSANE_SKIP:${PN} += "already-stripped"
 # FVP can optionally have a GUI, but we can use the host libraries in native/nativesdk
-INSANE_SKIP_${PN} += "file-rdeps"
+INSANE_SKIP:${PN} += "file-rdeps"
 
 # FVP brings its own standard library so don't let it be used as a shlib provider
 PRIVATE_LIBS = "libgcc_s.so.1 libstdc++.so.6"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index 0ba899261b5a..d215d8b55a00 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -1,19 +1,19 @@
 ARMFILESPATHS := "${THISDIR}/${PN}:"
 
-COMPATIBLE_MACHINE_generic-arm64 = "generic-arm64"
-FILESEXTRAPATHS_prepend_generic-arm64 = "${ARMFILESPATHS}"
-SRC_URI_append_generic-arm64 = " \
+COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
+FILESEXTRAPATHS:prepend:generic-arm64 = "${ARMFILESPATHS}"
+SRC_URI:append:generic-arm64 = " \
     file://defconfig.patch \
     file://tcpci.cfg \
     "
 
-FILESEXTRAPATHS_prepend_qemuarm64-sbsa = "${ARMFILESPATHS}"
-SRC_URI_append_qemuarm64-sbsa = " \
+FILESEXTRAPATHS:prepend:qemuarm64-sbsa = "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm64-sbsa = " \
     file://defconfig.patch \
     "
 
-FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
-SRC_URI_append_qemuarm64-secureboot = " \
+FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm64-secureboot = " \
     file://zone_dma_revert.patch \
     file://tee.cfg \
     "
diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 65c9a447f7eb..1642b0d0093b 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -21,9 +21,9 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     -DCFG_TEE_FS_PARENT_PATH='${localstatedir}/lib/tee' \
 "
-EXTRA_OECMAKE_append_toolchain-clang = " -DCFG_WERROR=0"
+EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
 
-do_install_append() {
+do_install:append() {
     install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
     install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
 
@@ -33,8 +33,8 @@ do_install_append() {
               ${D}${sysconfdir}/init.d/tee-supplicant
 }
 
-SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
+SYSTEMD_SERVICE:${PN} = "tee-supplicant.service"
 
 INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME_${PN} = "tee-supplicant"
-INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
+INITSCRIPT_NAME:${PN} = "tee-supplicant"
+INITSCRIPT_PARAMS:${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index f2e53f3d59c7..b74344ac7666 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -39,7 +39,7 @@ do_install () {
     install -D -p -m0444 ${B}/plugins/* ${D}${libdir}/tee-supplicant/plugins
 }
 
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
+FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/ \
                 ${libdir}/tee-supplicant/plugins/ \
                "
 
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 483b797df0d5..3d707acff712 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -12,7 +12,7 @@ CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
 
 DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
 
-DEPENDS_append_toolchain-clang = " compiler-rt"
+DEPENDS:append:toolchain-clang = " compiler-rt"
 
 SRC_URI = "git://github.com/OP-TEE/optee_os.git"
 
@@ -65,12 +65,12 @@ addtask deploy before do_build after do_install
 
 SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
 
-FILES_${PN} = "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev = "${includedir}/optee/"
+FILES:${PN} = "${nonarch_base_libdir}/firmware/"
+FILES:${PN}-dev = "${includedir}/optee/"
 
 # note: "textrel" is not triggered on all archs
-INSANE_SKIP_${PN} = "textrel"
-INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP:${PN} = "textrel"
+INSANE_SKIP:${PN}-dev = "staticdev"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
index 3289e2cdb7e8..95d82bb32684 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
@@ -2,7 +2,7 @@ require optee-os.inc
 
 SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
 
-SRC_URI_append = " \
+SRC_URI:append = " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
 "
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index bcbcc0689162..0a8e56ca71a0 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -43,7 +43,7 @@ do_install () {
     install -D -p -m0444 ${B}/supp_plugin/*.plugin ${D}${libdir}/tee-supplicant/plugins/
 }
 
-FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
+FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/ \
                 ${libdir}/tee-supplicant/plugins/ \
                "
 
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index d093b48cecbf..d498b00aad71 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,15 +1,15 @@
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 COMPATIBLE_MACHINE ?= "invalid"
-COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
 # Please add supported machines below or set it in .bbappend or .conf
 
 OPTEEMACHINE ?= "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
+OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
 
 OPTEE_ARCH = "null"
-OPTEE_ARCH_armv7a = "arm32"
-OPTEE_ARCH_aarch64 = "arm64"
+OPTEE_ARCH:armv7a = "arm32"
+OPTEE_ARCH:aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 
 OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
index 5194ce1ac8c8..6607f0f8b759 100644
--- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
+++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
@@ -1,6 +1,6 @@
 require recipes-devtools/atp/atp-source_3.1.inc
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
 
 SRC_URI += "${ATP_SRC};destsuffix=git/atp;name=atp \
             file://start-gem5-atp.sh"
@@ -11,14 +11,14 @@ LIC_FILES_CHKSUM += "file://atp/LICENSE;md5=${ATP_LIC_MD5}"
 
 EXTRA_OESCONS += "EXTRAS=${S}/atp"
 
-do_install_append() {
+do_install:append() {
     # baremetal_atp.py machine configuration and sample stream.atp file
     install -m 644 ${B}/atp/gem5/baremetal_atp.py \
                    ${B}/atp/configs/stream.atp \
                    ${D}${datadir}/gem5/configs
 }
 
-do_deploy_append() {
+do_deploy:append() {
     # start-gem5-atp.sh launch script
     install -m 755 ${WORKDIR}/start-gem5-atp.sh ${DEPLOYDIR}
 }
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
index 34024bf16aff..3ba0c3cacd8c 100644
--- a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
+++ b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
@@ -1,6 +1,6 @@
 inherit update-rc.d
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
 
 # Add startup script calling m5 readfile for automatic checkpoint and restore
 SRC_URI += "file://m5-readfile.sh"
@@ -8,7 +8,7 @@ SRC_URI += "file://m5-readfile.sh"
 INITSCRIPT_NAME = "m5-readfile.sh"
 INITSCRIPT_PARAMS = "defaults 99"
 
-do_install_append() {
+do_install:append() {
     install -d ${D}/${INIT_D_DIR}
     install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
 }
diff --git a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
index 9820a9db0ce9..0bf4949b6ff6 100644
--- a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
@@ -12,11 +12,11 @@ ATP_MOD_DIR = "linux"
 EXTRA_OEMAKE += "-C ${ATP_MOD_DIR}"
 
 PROVIDES = "kernel-module-atp"
-RPROVIDES_${PN} = "kernel-module-atp"
+RPROVIDES:${PN} = "kernel-module-atp"
 KERNEL_MODULE_AUTOLOAD += "atp_buffer_manager atp_device"
 MODULES_MODULE_SYMVERS_LOCATION = "${ATP_MOD_DIR}"
 
-do_install_append() {
+do_install:append() {
     install -d ${D}${includedir}/linux
     install -m 644 ${ATP_MOD_DIR}/atp_buffer_manager_user.h \
                    ${ATP_MOD_DIR}/atp_device_user.h \
diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
index c3f3caa34f81..5a3097e0a604 100644
--- a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
@@ -18,4 +18,4 @@ do_install() {
 }
 
 DEPENDS = "atp-uapi cppunit"
-RDEPENDS_${PN} = "atp-uapi"
+RDEPENDS:${PN} = "atp-uapi"
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
index 701499b6a1e2..c8352206aa3c 100644
--- a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -1,2 +1,2 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-5.4:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-5.4:"
 SRC_URI += "file://no_ftrace.cfg file://smmuv3.cfg"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 7c7a52acfe47..0ab704ff0b5d 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -16,4 +16,4 @@ BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
 "
 
-DISTRO_FEATURES_NATIVE_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'xen', d)}"
+DISTRO_FEATURES_NATIVE:append = " ${@bb.utils.filter('DISTRO_FEATURES', 'xen', d)}"
diff --git a/meta-gem5/conf/machine/gem5-arm64.conf b/meta-gem5/conf/machine/gem5-arm64.conf
index 3e97682533bc..fa931da87038 100644
--- a/meta-gem5/conf/machine/gem5-arm64.conf
+++ b/meta-gem5/conf/machine/gem5-arm64.conf
@@ -50,5 +50,5 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
 # As this is a virtual target that will not be used in the real world there is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
 # initialise) and install the pre-generated keys.
-PACKAGECONFIG_remove_pn-openssh = "rng-tools"
+PACKAGECONFIG:remove:pn-openssh = "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
index 3b93b3b7e1c9..0cd28c266c1e 100644
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
@@ -1,6 +1,6 @@
 # Use OVERRIDES to minimize the usage of
 # ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
-OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
+OVERRIDES:append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
 
 # Xen image to put in the image
 # This should point to a file in the deploy image directory
@@ -9,21 +9,21 @@ BOOT_WRAPPER_AARCH64_XEN ??= "xen-${MACHINE}"
 # Xen command line for the image
 BOOT_WRAPPER_AARCH64_XEN_CMDLINE ??= "noreboot dom0_mem=256M"
 
-BOOT_WRAPPER_AARCH64_XEN_CMDLINE_gem5-arm64 = "noreboot dom0_mem=256M console=dtuart \
+BOOT_WRAPPER_AARCH64_XEN_CMDLINE:gem5-arm64 = "noreboot dom0_mem=256M console=dtuart \
     dtuart=/uart@1c090000 bootscrub=0"
 
 # Fix command line in the axf file for gem5-arm64 when Xen is present
-BOOT_WRAPPER_AARCH64_CMDLINE_xen_gem5-arm64 = "console=hvc0 root=/dev/vda rw"
+BOOT_WRAPPER_AARCH64_CMDLINE_xen:gem5-arm64 = "console=hvc0 root=/dev/vda rw"
 
 # Image generated by boot wrapper when Xen is present
 BOOT_WRAPPER_AARCH64_IMAGE_xen ?= "xen-system.axf"
 
-EXTRA_OECONF_append_xen = " \
+EXTRA_OECONF:append:xen = " \
 --with-xen=${WORKDIR}/kernel/arch/arm64/boot/Image \
 --with-xen-cmdline="" \
 "
 
-EXTRA_OEMAKE_append_xen = " \
+EXTRA_OEMAKE:append:xen = " \
 XEN_IMAGE=${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN} \
 XEN_CMDLINE="${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}" \
 "
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
index 8239a40195e0..5c38bdd66886 100644
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
@@ -1,6 +1,6 @@
 # When booting gem5-arm64 with Xen we need to set the cpu as Cortex A53 and
 # remove support for pointer authentification
-GEM5_RUN_EXTRA_append = " \
+GEM5_RUN_EXTRA:append = " \
 ${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'xen', \
 '--param=system.cpu_cluster[0].cpus[0].isa[0].midr=0x410fd030 \
 --param=system.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=0x0', \
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
index ef42c5204628..6ee4dbde218d 100644
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
@@ -1,4 +1,4 @@
 # gem5-arm64 support
-COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
-FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}/files:"
-SRC_URI_append_gem5-arm64 = " file://early-printk.cfg"
+COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
+FILESEXTRAPATHS:prepend:gem5-arm64 := "${THISDIR}/files:"
+SRC_URI:append:gem5-arm64 = " file://early-printk.cfg"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
index 5d3b52c7086b..7ff3fe2b1284 100644
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
@@ -1,14 +1,14 @@
-FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
+FILESEXTRAPATHS:prepend:gem5-arm64 := "${THISDIR}:"
 
 #
 # virtualization kmeta extra
 #
-SRC_URI_append_gem5-arm64 = " file://virtualization-kmeta-extra-gem5;type=kmeta;name=virtualization-kmeta-extra-gem5;destsuffix=virtualization-kmeta-extra-gem5"
+SRC_URI:append:gem5-arm64 = " file://virtualization-kmeta-extra-gem5;type=kmeta;name=virtualization-kmeta-extra-gem5;destsuffix=virtualization-kmeta-extra-gem5"
 
 # We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
 # Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
 # register.
-LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE_gem5-arm64 = "${@bb.utils.contains('DISTRO_FEATURES', \
+LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE:gem5-arm64 = "${@bb.utils.contains('DISTRO_FEATURES', \
                                          'xen', ' features/disable-arm64-sve.scc','',d)}"
 
-KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE}"
+KERNEL_FEATURES:append:gem5-arm64 = "${LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE}"
diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
index d890d1bc7b30..57e6b53f4d1c 100644
--- a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
+++ b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
@@ -1,13 +1,13 @@
 # Gem5 aarch64 support
-COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
+COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
 
-PROVIDES_gem5-arm64 += "virtual/gem5-bootloader"
+PROVIDES:gem5-arm64 += "virtual/gem5-bootloader"
 
 # For gem5 we use the dtb generated by gem5 directly
-DEPENDS_append_gem5-arm64 = " gem5-aarch64-dtb"
-BOOT_WRAPPER_AARCH64_DEVICETREE_gem5-arm64 = "gem5-aarch64.dtb"
+DEPENDS:append:gem5-arm64 = " gem5-aarch64-dtb"
+BOOT_WRAPPER_AARCH64_DEVICETREE:gem5-arm64 = "gem5-aarch64.dtb"
 
 # The dtb must be generated for us to generate the axf
 DEPLOY_DEPEND_LIST ?= ""
-DEPLOY_DEPEND_LIST_gem5-arm64 = " gem5-aarch64-dtb:do_deploy"
+DEPLOY_DEPEND_LIST:gem5-arm64 = " gem5-aarch64-dtb:do_deploy"
 do_deploy[depends] += "${DEPLOY_DEPEND_LIST}"
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 79cf9105b805..057aad878c6a 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -8,13 +8,13 @@ require gem5-aarch64-native.inc
 require gem5-native.inc
 
 # Get rid of compiler errors when building protobuf
-GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable' --verbose"
+GEM5_SCONS_ARGS:append = " CCFLAGS_EXTRA='-Wno-error=unused-variable' --verbose"
 
 # Get rid of linker errors and have a faster link process
-GEM5_SCONS_ARGS_append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
+GEM5_SCONS_ARGS:append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
 MARSHAL_LDFLAGS_EXTRA='${BUILD_LDFLAGS}' --force-lto "
 
-do_compile_prepend() {
+do_compile:prepend() {
     # Gem5 expect to have python in the path (can be python2 or 3)
     # Create a link named python to python3
     real=$(which ${PYTHON})
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
index 1462b4e1ea45..a719f72605b7 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -45,8 +45,8 @@ do_install() {
     done
 }
 
-FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
-INSANE_SKIP_${PN} += "already-stripped"
-RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native libpng-native"
+FILES:${PN} = "${datadir}/gem5/* ${bindir}/*"
+INSANE_SKIP:${PN} += "already-stripped"
+RDEPENDS:${PN} += "python3-native hdf5-native protobuf-native libpng-native"
 
 addtask addto_recipe_sysroot before do_build
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
index 7913f611bb6c..be570ab79548 100644
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -1,11 +1,11 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
-KMACHINE_gem5-arm64 = "gem5-arm64"
-SRC_URI_append_gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
+COMPATIBLE_MACHINE:gem5-arm64 = "gem5-arm64"
+KMACHINE:gem5-arm64 = "gem5-arm64"
+SRC_URI:append:gem5-arm64 = " file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
                               file://dts/gem5-arm64;subdir=add-files"
 
-do_patch_append_gem5-arm64() {
+do_patch:append:gem5-arm64() {
     tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
         tar -C arch/arm64/boot/dts -xf -
 }
-- 
2.20.1

