Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF15C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23378.1713889985985368957
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A087339;
	Tue, 23 Apr 2024 09:33:33 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 915323F7BD;
	Tue, 23 Apr 2024 09:33:04 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 1/9] arm/trusted-services: Update FFA TEE driver to v2.0.0
Date: Tue, 23 Apr 2024 18:31:57 +0200
Message-ID: <20240423163205.5885-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5586

From: Gyorgy Szing <Gyorgy.Szing@arm.com>

- Update driver version to v2.0.0
- Follow up the name change. The driver has been renamed from
  arm_ffa_tee to arm_tstee.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 documentation/trusted-services.md                         | 2 +-
 meta-arm-bsp/documentation/corstone1000/user-guide.rst    | 6 +++---
 .../arm-ffa-tee_1.1.2.bb =3D> arm-tstee/arm-tstee_2.0.0.bb} | 8 ++++----
 .../{arm-ffa-tee =3D> arm-tstee}/files/Makefile             | 2 +-
 meta-arm/recipes-security/trusted-services/libts_git.bb   | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-arm/recipes-kernel/{arm-ffa-tee/arm-ffa-tee_1.1.2.bb =3D> ar=
m-tstee/arm-tstee_2.0.0.bb} (74%)
 rename meta-arm/recipes-kernel/{arm-ffa-tee =3D> arm-tstee}/files/Makefi=
le (92%)

diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index 70826f68..a3732713 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -28,7 +28,7 @@ Other steps depend on your machine/platform definition:
=20
 1. For communications between Secure and Normal Words Linux kernel optio=
n `CONFIG_ARM_FFA_TRANSPORT=3Dy`
    is required. If your platform doesn't include it already you can add =
`arm-ffa` into MACHINE_FEATURES.
-   (Please see ` meta-arm/recipes-kernel/arm-ffa-tee`.)
+   (Please see ` meta-arm/recipes-kernel/arm-tstee`.)
=20
    For running the `uefi-test` or the `xtest -t ffa_spmc` tests under Li=
nux the `arm-ffa-user` drivel is required. This is
    enabled if the `ts-smm-gateway` and/or the `optee-spmc-test` machine =
features are enabled.
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 06353b5d..073ea213 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1295,19 +1295,19 @@ First, load FF-A TEE kernel module:
=20
 ::
=20
-  insmod /lib/modules/*-yocto-standard/updates/arm-ffa-tee.ko
+  insmod /lib/modules/6.1.32-yocto-standard/extra/arm-tstee.ko
=20
 Then, check whether the FF-A TEE driver is loaded correctly by using the=
 following command:
=20
 ::
=20
-  cat /proc/modules | grep arm_ffa_tee
+  cat /proc/modules | grep arm_tstee
=20
 The output should be:
=20
 ::
=20
-   arm_ffa_tee <ID> - - Live <address> (O)
+   arm_tstee 16384 - - Live 0xffffffc000510000 (O)
=20
 Now, run the PSA API tests in the following order:
=20
diff --git a/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb b/m=
eta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
similarity index 74%
rename from meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb
rename to meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
index 5790d00f..44608b1d 100644
--- a/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb
+++ b/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
@@ -10,13 +10,13 @@ SRC_URI =3D "git://gitlab.arm.com/linux-arm/linux-tru=
sted-services;protocol=3Dhttps;
           "
 S =3D "${WORKDIR}/git"
=20
-# Tag tee-v1.1.2
-SRCREV =3D "8a81f5d2406f146b15a705d49b256efaa5fa3ba9"
+# Tag tee-v2.0.0
+SRCREV =3D "a2d7349a96c3b3afb44bf1555d53f1c46e45a23d"
=20
 COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
-KERNEL_MODULE_AUTOLOAD +=3D "arm-ffa-tee"
+KERNEL_MODULE_AUTOLOAD +=3D "arm-tstee"
=20
 do_install:append() {
     install -d ${D}${includedir}
-    install -m 0644 ${S}/uapi/arm_ffa_tee.h ${D}${includedir}/
+    install -m 0644 ${S}/uapi/arm_tstee.h ${D}${includedir}/
 }
diff --git a/meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile b/meta-ar=
m/recipes-kernel/arm-tstee/files/Makefile
similarity index 92%
rename from meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile
rename to meta-arm/recipes-kernel/arm-tstee/files/Makefile
index 40a6e474..6d781d15 100644
--- a/meta-arm/recipes-kernel/arm-ffa-tee/files/Makefile
+++ b/meta-arm/recipes-kernel/arm-tstee/files/Makefile
@@ -1,4 +1,4 @@
-obj-m :=3D arm-ffa-tee.o
+obj-m :=3D arm-tstee.o
=20
 SRC :=3D $(shell pwd)
=20
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index aafe8516..789bde7c 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -10,8 +10,8 @@ SRC_URI +=3D "file://tee-udev.rules \
=20
 OECMAKE_SOURCEPATH=3D"${S}/deployments/libts/${TS_ENV}"
=20
-DEPENDS           +=3D "arm-ffa-tee arm-ffa-user"
-RRECOMMENDS:${PN} +=3D "arm-ffa-tee"
+DEPENDS           +=3D "arm-tstee arm-ffa-user"
+RRECOMMENDS:${PN} +=3D "arm-tstee"
=20
 # Unix group name for dev/tee* ownership.
 TEE_GROUP_NAME ?=3D "teeclnt"
--=20
2.43.1


