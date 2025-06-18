Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FFFC7115C
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:11:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2041.1750234258440478959
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 01:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 511D21BC0;
	Wed, 18 Jun 2025 01:10:37 -0700 (PDT)
Received: from MGC575JXM4.arm.com (unknown [10.57.83.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DE5E3F66E;
	Wed, 18 Jun 2025 01:10:57 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH 1/3] arm-bsp/optee-os: corstone-1000: upgrade to 4.6.0
Date: Wed, 18 Jun 2025 10:10:45 +0200
Message-Id: <20250618081047.34990-2-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250618081047.34990-1-clement.faure@arm.com>
References: <20250618081047.34990-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 08:11:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6565

Add recipes for OP-TEE v4.6.0
Upgrade Corstone-1000 OP-TEE revision from 4.4.0 to 4.6.0
Add patch to fix compilation issue with musl and optee-test 4.6.0.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  4 +-
 .../0001-Handle-logging-syscall.patch         | 32 ------------
 ...rstone1000-increase-CFG_TZDRAM_SIZE.patch} |  0
 .../optee/optee-os-corstone1000-common.inc    |  3 +-
 .../optee/optee-client_4.6.0.bb               |  9 ++++
 .../optee/optee-examples_4.6.0.bb             |  4 ++
 .../optee/optee-os-tadevkit_4.6.0.bb          | 29 +++++++++++
 .../recipes-security/optee/optee-os_4.6.0.bb  | 11 ++++
 ...Re-order-the-include-of-sys-stat.h-h.patch | 51 +++++++++++++++++++
 .../optee/optee-test_4.6.0.bb                 | 19 +++++++
 10 files changed, 126 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-Handle-logging-syscall.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/{=
0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch =3D> 0001-plat-cors=
tone1000-increase-CFG_TZDRAM_SIZE.patch} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.6.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.6.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.6=
.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.6.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-regre=
ssion_1000-Re-order-the-include-of-sys-stat.h-h.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.6.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index bbaeee29..ecaea64d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -14,8 +14,8 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "4.4.%"
-PREFERRED_VERSION_optee-client ?=3D "4.4.%"
+PREFERRED_VERSION_optee-os ?=3D "4.6.%"
+PREFERRED_VERSION_optee-client ?=3D "4.6.%"
=20
 # Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/opt=
ee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch
deleted file mode 100644
index 58ba2afd..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-Handle-logging-syscall.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d6ee50f581b43b16733b8731369b071d609d5048 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 31 Aug 2023 10:51:54 +0100
-Subject: [PATCH] Handle logging syscall
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [upstreamed differently in 280b6a3]
----
- core/arch/arm/kernel/spmc_sp_handler.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kern=
el/spmc_sp_handler.c
-index 1f218a0df..0676e8898 100644
---- a/core/arch/arm/kernel/spmc_sp_handler.c
-+++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -1276,7 +1276,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *=
args,
- 			handle_console_log(args);
- 			sp_enter(args, caller_sp);
- 			break;
--
-+		case 0xdeadbeef:
-+			ts_push_current_session(&caller_sp->ts_sess);
-+			IMSG("%s", (char *)args->a1);
-+			ts_pop_current_session();
-+			sp_enter(args, caller_sp);
-+			break;
- 		default:
- 			EMSG("Unhandled FFA function ID %#"PRIx32,
- 			     (uint32_t)args->a0);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000=
-increase-CFG_TZDRAM_SIZE.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/corstone10=
00/0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000=
/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 3f6452dc..d7fe4c73 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,7 +1,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
 SRC_URI:append =3D " \
-                  file://0001-Handle-logging-syscall.patch \
-                  file://0002-plat-corstone1000-increase-CFG_TZDRAM_SIZE=
.patch \
+                  file://0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE=
.patch \
 		  "
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.6.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.6.0.bb
new file mode 100644
index 00000000..cbd75eb3
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.6.0.bb
@@ -0,0 +1,9 @@
+require recipes-security/optee/optee-client.inc
+
+# v4.6.0
+SRCREV =3D "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
+SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.6.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.6.0.bb
new file mode 100644
index 00000000..8ee4ece9
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.6.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.6.0
+SRCREV =3D "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
new file mode 100644
index 00000000..961d5251
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.6.0.bb
@@ -0,0 +1,29 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
+
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.6.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.6.0.bb
new file mode 100644
index 00000000..c9a6b261
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.6.0.bb
@@ -0,0 +1,11 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+# v4.6.0
+SRCREV =3D "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
+SRC_URI +=3D " \
+    file://0003-optee-enable-clang-support.patch \
+   "
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-regression_1=
000-Re-order-the-include-of-sys-stat.h-h.patch b/meta-arm/recipes-securit=
y/optee/optee-test/0001-regression_1000-Re-order-the-include-of-sys-stat.=
h-h.patch
new file mode 100644
index 00000000..9bc18baf
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-regression_1000-Re-=
order-the-include-of-sys-stat.h-h.patch
@@ -0,0 +1,51 @@
+From a15be9eca1b7e935917d834284726027dffc8cfb Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20Faure?=3D <clement.faure@arm.com>
+Date: Wed, 7 May 2025 13:54:36 +0000
+Subject: [PATCH] regression_1000: Re-order the include of <sys/stat.h> h=
eader
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+With musl, the compilation of optee-test would fail:
+
+|   GEN     optee-test/4.6.0/optee-test-4.6.0/xtest/regression_8100_ca_c=
rt.h
+| python3 ../../scripts/file_to_c.py --inf ../../cert/ca.crt --out optee=
-test/4.6.0/optee-test-4.6.0/xtest/regression_8100_ca_crt.h --name regres=
sion_8100_ca_crt
+| In file included from optee-test/4.6.0/recipe-sysroot/usr/include/sys/=
stat.h:30,
+|                  from optee-test/host/xtest/regression_1000.c:24:
+| optee-test/4.6.0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: =
expected identifier or '(' before '[' token
+|    17 |         unsigned __unused[2];
+|       |                          ^
+
+The defintion of OP-TEE macro __unused conflicts with the musl implement=
ation
+and its use of variables named __unused.
+
+Re-ordering and including <sys/stat.h> before the macro gets defined is
+enough to work around the issue.
+
+Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Upstream-Status: Backport [a15be9eca1b7e935917d834284726027dffc8cfb]
+---
+ host/xtest/regression_1000.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
+index e9d20a8..a427789 100644
+--- a/host/xtest/regression_1000.c
++++ b/host/xtest/regression_1000.c
+@@ -20,11 +20,11 @@
+ #ifdef CFG_SECURE_DATA_PATH
+ #include <sdp_basic.h>
+ #endif
++#include <sys/stat.h>
+ #include <signed_hdr.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <ta_arm_bti.h>
+ #include <ta_concurrent.h>
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-test_4.6.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.6.0.bb
new file mode 100644
index 00000000..ab4b8ae2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.6.0.bb
@@ -0,0 +1,19 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.6.0
+SRCREV =3D "a9e9495f4d57b97022008ad11198195e7e044c5d"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
+
+SRC_URI +=3D " \
+    file://0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch \
+    file://0001-regression_1000-Re-order-the-include-of-sys-stat.h-h.pat=
ch \
+"
+
+# Include ffa_spmc test group if the SPMC test is enabled.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
+
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                              ' arm-ffa-user', '' , d)}"

