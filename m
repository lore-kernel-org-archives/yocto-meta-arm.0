Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81087CA1011
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 20:15:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.955.1725048897576535890
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 13:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B00BFEC;
	Fri, 30 Aug 2024 13:15:23 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.73.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D8C3F762;
	Fri, 30 Aug 2024 13:14:56 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp,kas: corstone1000: enable External System based on new yml file
Date: Fri, 30 Aug 2024 21:14:48 +0100
Message-Id: <20240830201448.3695005-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830201448.3695005-1-harsimransingh.tungal@arm.com>
References: <20240830201448.3695005-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 20:15:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6045

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Create new yml file "corstone1000-extsys.yml" which adds "corstone1000-ex=
tsys" as
new MACHINE_FEATURE.
Based on this, external system components can be enabled or disabled from=
 the
Linux Kernel and U-Boot.

Reason for change:
DT-schema test is failing for the SystemReady-IR v2.0 certification becau=
se
device tree binding for remoteproc dts node corresponds to external syste=
m has
not been upstreamed in the Linux Kernel yet.
So, it has been decided to make enablement of external system configurabl=
e in
order to make Corstone1000 FVP SystemReady-IR v2.0 certifiable.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 kas/corstone1000-extsys.yml                   |  6 ++++
 .../documentation/corstone1000/user-guide.rst |  7 ++++
 .../u-boot/u-boot-corstone1000.inc            |  2 ++
 ...rstone1000-purge-remoteproc-dts-node.patch | 34 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             | 20 +++++++----
 5 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 kas/corstone1000-extsys.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
051-corstone1000-purge-remoteproc-dts-node.patch

diff --git a/kas/corstone1000-extsys.yml b/kas/corstone1000-extsys.yml
new file mode 100644
index 00000000..0534b09c
--- /dev/null
+++ b/kas/corstone1000-extsys.yml
@@ -0,0 +1,6 @@
+header:
+  version: 14
+
+local_conf_header:
+  extsys: |
+    MACHINE_FEATURES +=3D "corstone1000-extsys"
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 2bdd490f..84c22d8c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -180,6 +180,12 @@ then run:
=20
     kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml
=20
+By default, the external system is disabled. To build the Corstone-1000 =
image with external system enabled, run:
+
+::
+
+    kas build meta-arm/kas/corstone1000-<fvp,mps3>.yml:meta-arm/ci/debug=
.yml:meta-arm/kas/corstone1000-extsys.yml
+
 The initial clean build will be lengthy, given that all host utilities a=
re to
 be built as well as the target images. This includes host executables (p=
ython,
 cmake, etc.) and the required toolchain(s).
@@ -1444,6 +1450,7 @@ The above commands will delete the Platform key (PK=
) and allow the normal system
=20
 Testing the External System
 ---------------------------
+Before testing the external system, please make sure to build the Corsto=
ne-1000 image with external system enabled as mentioned in section `Build=
ing the software stack`_.
=20
 During Linux boot the remoteproc subsystem automatically starts
 the external system.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 427e346f..2470db02 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -66,6 +66,8 @@ SRC_URI:append =3D " \
     file://0048-corstone1000-Enable-UEFI-Secure-boot.patch 			  \
     file://0049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch=
	  \
     file://0050-fwu-Use-metadata-v2.patch	  \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', \
+                         '', 'file://0051-corstone1000-purge-remoteproc-=
dts-node.patch' , d)} \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-cor=
stone1000-purge-remoteproc-dts-node.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0051-corstone1000-purge-remoteproc-dts-node.patch
new file mode 100644
index 00000000..3b0430c8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-corstone10=
00-purge-remoteproc-dts-node.patch
@@ -0,0 +1,34 @@
+From 4e0ab7af882fcf498fd8beb4024ea024e6464cef Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 14 Aug 2024 14:33:50 +0000
+Subject: [PATCH] corstone1000: purge remoteproc DTS node
+
+Purge remoteproc DTS node
+This is done to remove the remote proc node from the DTS passed
+to Linux from U-Boot because the device tree binding for remoteproc
+has not been upstreamed yet. Existence of remoteproc DTS node in Linux=20
+is causing dt-schema test for SystemReady-IR v2.0 certification to fail.
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ board/armltd/corstone1000/corstone1000.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index ef74dc9032..d474fce1b2 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -30,8 +30,7 @@ DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
+ 	{ .node_path =3D "/soc/mhu@1b010000" },
+ 	{ .node_path =3D "/soc/mhu@1b020000" },
+ 	{ .node_path =3D "/soc/mhu@1b030000" },
+-	{ .node_path =3D "/soc/client" },
+-	{ .node_path =3D "/soc/extsys@1A010310" },
++	{ .node_path =3D "/soc/remoteproc@1a010310" },
+ };
+=20
+ #define CORSTONE1000_KERNEL_PARTS 2
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index ae22531f..01803ba2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -35,13 +35,21 @@ SRC_URI:append:corstone1000 =3D " ${@bb.utils.contain=
s('MACHINE_FEATURES', \
                                                             'file://cors=
tone1000_kernel_debug.cfg', \
                                                             '', \
                                                              d)}"
-
 SRC_URI:append:corstone1000 =3D " \
-    file://extsys.cfg \
-    file://0001-remoteproc-Add-Arm-remoteproc-driver.patch \
-    file://0002-arm64-dts-Add-corstone1000-external-system-device-no.pat=
ch \
-    file://0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch \
-    "
+    ${@bb.utils.contains( \
+              'MACHINE_FEATURES', \
+              'corstone1000-extsys', \
+              ' \
+		  file://extsys.cfg \
+		  file://0001-remoteproc-Add-Arm-remoteproc-driver.patch \
+		  file://0002-arm64-dts-Add-corstone1000-external-system-device-no.pat=
ch \
+		  file://0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch \
+              ', \
+              '', \
+              d \
+        ) \
+    } \
+"
=20
 # Default kernel features not needed for corstone1000
 # otherwise the extra kernel modules will increase the rootfs size
--=20
2.25.1


