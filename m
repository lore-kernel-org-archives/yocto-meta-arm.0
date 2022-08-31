Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2368AECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:08 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web11.2713.1661971326883558202
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIV9011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 4/7] Trusted Services test/demo NWd tools
Date: Wed, 31 Aug 2022 19:41:54 +0100
Message-Id: <20220831184157.84687-4-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3728

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 ...QEMU-MM-communication-buffer-address.patch | 29 ++++++++++++
 .../trusted-services/libts/tee-udev.rules     |  2 +
 .../trusted-services/libts_git.bb             | 44 +++++++++++++++++++
 .../trusted-services/ts-demo_git.bb           | 21 +++++++++
 .../trusted-services/ts-remote-test_git.bb    | 12 +++++
 .../trusted-services/ts-service-test_git.bb   | 21 +++++++++
 .../trusted-services/ts-uefi-test_git.bb      | 21 +++++++++
 7 files changed, 150 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
 create mode 100644 meta-arm/recipes-security/trusted-services/libts_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-demo_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-service-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb

diff --git a/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch b/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
new file mode 100644
index 00000000..2c21e6f1
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
@@ -0,0 +1,29 @@
+From 1fe74d7d5008aed61feb34a8d5d8b5f9144a58b2 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 16:33:13 +0100
+Subject: [PATCH] Update MM communication buffer address for qemuarm64 machine
+
+Upstream-Status: Inappropriate [qemuarm64 specific change]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ components/rpc/mm_communicate/caller/linux/carveout.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/components/rpc/mm_communicate/caller/linux/carveout.c b/components/rpc/mm_communicate/caller/linux/carveout.c
+index e3cdf16f..62845d30 100644
+--- a/components/rpc/mm_communicate/caller/linux/carveout.c
++++ b/components/rpc/mm_communicate/caller/linux/carveout.c
+@@ -12,8 +12,8 @@
+ #include "carveout.h"
+ 
+ /* Need to be aligned with carve-out used by StMM or smm-gateway. */
+-static const off_t carveout_pa = 0x0000000881000000;
+-static const size_t carveout_len = 0x8000;
++static const off_t carveout_pa = 0x42000000;
++static const size_t carveout_len = 0x1000;
+ 
+ int carveout_claim(uint8_t **buf, size_t *buf_size)
+ {
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
new file mode 100644
index 00000000..216fe993
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
@@ -0,0 +1,2 @@
+# tee devices can only be accessed by the teeclnt group members
+KERNEL=="tee[0-9]*", TAG+="systemd", MODE="0660", GROUP="teeclnt"
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta-arm/recipes-security/trusted-services/libts_git.bb
new file mode 100644
index 00000000..dfcf8ce9
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Trusted Services libts library for the arm-linux enviroment. \
+               Used for locating and accessing services from a Linux userspace client"
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+SRC_URI += "file://tee-udev.rules \
+           "
+
+OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"
+
+DEPENDS           += "arm-ffa-tee arm-ffa-user"
+RRECOMMENDS:${PN} += "arm-ffa-tee"
+
+# arm-ffa-user.h is installed by arm-ffa-user recipe
+EXTRA_OECMAKE += "-DLINUX_FFA_USER_SHIM_INCLUDE_DIR:PATH=/usr/include \
+                 "
+
+# Unix group name for dev/tee* ownership.
+TEE_GROUP_NAME ?= "teeclnt"
+
+do_install:append () {
+    if ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mdev', 'false', 'true', d)}; then
+        install -d ${D}${nonarch_base_libdir}/udev/rules.d/
+        install -m 755 ${WORKDIR}/tee-udev.rules ${D}${nonarch_base_libdir}/udev/rules.d/
+        sed -i -e "s/teeclnt/${TEE_GROUP_NAME}/" ${D}${nonarch_base_libdir}/udev/rules.d/tee-udev.rules
+    fi
+
+    # Move the dynamic libraries into the standard place.
+    # Update a cmake files to use correct paths.
+    install -d ${D}${libdir}
+    mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
+
+    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libtsTargets-noconfig.cmake
+    sed -i -e 's#INTERFACE_INCLUDE_DIRECTORIES.*$#INTERFACE_INCLUDE_DIRECTORIES "\${_IMPORT_PREFIX}/${TS_ENV}/include"#' ${D}${TS_INSTALL}/lib/cmake/libtsTargets.cmake
+}
+
+inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mdev', '', 'useradd', d)}
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system ${TEE_GROUP_NAME}"
+
+FILES:${PN} = "${libdir}/libts.so.* ${nonarch_base_libdir}/udev/rules.d/"
+FILES:${PN}-dev = "${TS_INSTALL}/lib/cmake ${TS_INSTALL}/include ${libdir}/libts.so"
diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
new file mode 100644
index 00000000..b0abb6ff
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Trusted Services ts-demo deployment for arm-linux. \
+               Used for running simple TS demo from Linux user-space \
+               on an Arm platform with real deployments of trusted services."
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+DEPENDS        += "libts"
+RDEPENDS:${PN} += "libts"
+
+OECMAKE_SOURCEPATH="${S}/deployments/ts-demo/${TS_ENV}"
+
+FILES:${PN} = "${bindir}/ts-demo"
+
+do_install:append () {
+    install -d ${D}${bindir}
+    mv ${D}${TS_INSTALL}/bin/ts-demo ${D}${bindir}
+
+    rm -r --one-file-system ${D}${TS_INSTALL}
+}
diff --git a/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
new file mode 100644
index 00000000..203defea
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Trusted Services ts-remote-test deployment for arm-linux."
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+DEPENDS        += "libts"
+RDEPENDS:${PN} += "libts"
+
+OECMAKE_SOURCEPATH = "${S}/deployments/ts-remote-test/${TS_ENV}"
+
+FILES:${PN} = "${bindir}/ts-remote-test"
diff --git a/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb
new file mode 100644
index 00000000..3278c6c6
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Trusted Services ts-service-test deployment for arm-linux. \
+               Used for running service level tests from Linux user-space \
+               on an Arm platform with real deployments of trusted services."
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+DEPENDS        += "libts python3-protobuf-native"
+RDEPENDS:${PN} += "libts"
+
+OECMAKE_SOURCEPATH = "${S}/deployments/ts-service-test/${TS_ENV}"
+
+FILES:${PN} = "${bindir}/ts-service-test"
+
+do_install:append () {
+    install -d ${D}${bindir}
+    mv ${D}${TS_INSTALL}/bin/ts-service-test ${D}${bindir}
+
+    rm -r --one-file-system ${D}${TS_INSTALL}
+}
diff --git a/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb
new file mode 100644
index 00000000..5be436b6
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Trusted Services uefi-test deployment for arm-linux. \
+               Used for running service level tests from Linux user-space \
+               on an Arm platform with real deployments of UEFI SMM services."
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+DEPENDS        += "libts python3-protobuf-native"
+RDEPENDS:${PN} += "libts arm-ffa-user"
+
+OECMAKE_SOURCEPATH = "${S}/deployments/uefi-test/${TS_ENV}"
+
+FILES:${PN} = "${bindir}/uefi-test"
+
+do_install:append () {
+    install -d ${D}${bindir}
+    mv ${D}${TS_INSTALL}/bin/uefi-test ${D}${bindir}
+
+    rm -r --one-file-system ${D}${TS_INSTALL}
+}
-- 
2.25.1


