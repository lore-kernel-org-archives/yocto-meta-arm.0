Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C49C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 09:59:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12386.1706263170845788377
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 01:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82311FB;
	Fri, 26 Jan 2024 02:00:14 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2D233F762;
	Fri, 26 Jan 2024 01:59:29 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] n1sdp:arm arm-bsp: fix tftf tests for n1sdp
Date: Fri, 26 Jan 2024 09:59:22 +0000
Message-Id: <20240126095922.2836205-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240126095922.2836205-1-harsimransingh.tungal@arm.com>
References: <20240126095922.2836205-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 09:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5360

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset fix the tftf tests issue on n1sdp. Before this change, the=
 tftf tests were getting stuck on n1sdp.
The following changes have been done:

1. There were some tftf tests based on multicore which involve powering u=
p the other cores. These tests were creating
issues and the same thing has already been mentioned in the tests-to-skip=
.txt file for n1sdp platform in tftf source.
Those tests are skipped while executing tftf and patch has been created.

2. The TFTF_MODE variable added for tftf v2.10 recipe file, as did earlie=
r for tftf v2.9. With the help of this, we can
enable debug or relase mode. The configuration based on this has been add=
ed for n1sdp in the corresponding bbappend file.

3. Add PREFERRED_VERSION_tf-a-tests for v2.10.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
 .../files/0001-n1sdp-tftf-tests-to-skip.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  8 ++++
 .../trusted-firmware-a/tf-a-tests_2.10.0.bb   |  5 +-
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-n1sdp-tftf-tests-to-skip.patch

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 79604cee..5c4f0537 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -28,6 +28,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-r=
tl8168"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 TFA_PLATFORM =3D "n1sdp"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
=20
 # SCP
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-n1sdp=
-tftf-tests-to-skip.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/f=
iles/0001-n1sdp-tftf-tests-to-skip.patch
new file mode 100644
index 00000000..b31567c4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-n1sdp-tftf-t=
ests-to-skip.patch
@@ -0,0 +1,46 @@
+From cc0153b56d634aa80b740be5afed15bedb94a2c9 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Tue, 23 Jan 2024 14:19:39 +0000
+Subject: [PATCH] n1sdp patch tests to skip
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ plat/arm/n1sdp/tests_to_skip.txt | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/plat/arm/n1sdp/tests_to_skip.txt b/plat/arm/n1sdp/tests_to_=
skip.txt
+index b6e87bf..1848408 100644
+--- a/plat/arm/n1sdp/tests_to_skip.txt
++++ b/plat/arm/n1sdp/tests_to_skip.txt
+@@ -11,7 +11,7 @@ SMMUv3 tests
+ PSCI CPU Suspend in OSI mode
+=20
+ # PSCI is enabled but not tested
+-PSCI STAT/Stats test cases after system suspend
++PSCI STAT
+ PSCI System Suspend Validation
+=20
+ # Disable FF-A Interrupt tests as TWDOG is not supported by TC platform
+@@ -25,9 +25,14 @@ FF-A Interrupt
+ # files in TFTF, since the port was done purely to test the spectre wor=
karound
+ # performance impact. Once that was done no further work was done on th=
e port.
+=20
+-Timer framework Validation/Target timer to a power down cpu
+-Timer framework Validation/Test scenario where multiple CPUs call same =
timeout
+-Timer framework Validation/Stress test the timer framework
++Timer framework Validation
+ PSCI Affinity Info/Affinity info level0 powerdown
+ PSCI CPU Suspend
+-PSCI STAT/for valid composite state CPU suspend
++Framework Validation/NVM serialisation
++Framework Validation/Events API
++Boot requirement tests
++CPU Hotplug
++ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_1 test
++ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_2 test
++ARM_ARCH_SVC/SMCCC_ARCH_WORKAROUND_3 test
++FF-A Power management
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index eef21b93..6421033b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -1,5 +1,7 @@
 # Machine specific TFAs
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRCREV:corstone1000 =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
@@ -7,3 +9,9 @@ EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
 TFTF_MODE:corstone1000 =3D "release"
=20
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
+EXTRA_OEMAKE:append:n1sdp =3D " DEBUG=3D1"
+EXTRA_OEMAKE:append:n1sdp =3D " LOG_LEVEL=3D50"
+TFTF_MODE:n1sdp =3D "debug"
+SRC_URI:append:n1sdp =3D " \
+			file://0001-n1sdp-tftf-tests-to-skip.patch \
+			"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
index f3818b6d..fffdf5d3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
@@ -19,6 +19,9 @@ EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
 EXTRA_OEMAKE +=3D "DEBUG=3D1"
=20
+# Modify mode based on debug or release mode
+TFTF_MODE ?=3D "debug"
+
 # Platform must be set for each machine
 TFA_PLATFORM ?=3D "invalid"
=20
@@ -46,7 +49,7 @@ SYSROOT_DIRS +=3D "/firmware"
=20
 do_install() {
     install -d -m 755 ${D}/firmware
-    install -m 0644 ${B}/${TFA_PLATFORM}/debug/tftf.bin ${D}/firmware/tf=
tf.bin
+    install -m 0644 ${B}/${TFA_PLATFORM}/${TFTF_MODE}/tftf.bin ${D}/firm=
ware/tftf.bin
 }
=20
 do_deploy() {
--=20
2.25.1


