Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D45CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2015.1650357689872641295
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 01:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A8C41063;
	Tue, 19 Apr 2022 01:41:29 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.10.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A4A53F5A1;
	Tue, 19 Apr 2022 01:41:28 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux: corstone1000: Handle compatibility with
 different firmware versions
Date: Tue, 19 Apr 2022 09:41:05 +0100
Message-Id: <20220419084105.30820-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419084105.30820-1-emekcan.aras@arm.com>
References: <20220419084105.30820-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3275

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

A kernel patch that fixes FFA version compatibility issues.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 ...e-arm_ffa-Handle-compatibility-with-.patch | 90 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UP=
STREAM-firmware-arm_ffa-Handle-compatibility-with-.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Han=
dle-compatibility-with-.patch
new file mode 100644
index 00000000..a4fd6730
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-=
firmware-arm_ffa-Handle-compatibility-with-.patch
@@ -0,0 +1,90 @@
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3D8e3f9da608f14cfebac2659d8dd8737b79d013=
08]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From a8f3e351c07c48774be2a45e184b9f08dc92f1db Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Wed, 13 Apr 2022 15:43:19 +0100
+Subject: [PATCH] UPSTREAM: firmware: arm_ffa: Handle compatibility with
+ different firmware versions
+
+The driver currently just support v1.0 of Arm FFA specification. It also
+expects the firmware implementation to match the same and bail out if it
+doesn't match. This is causing issue when running with higher version of
+firmware implementation(e.g. v1.1 which will released soon).
+
+In order to support compatibility with different firmware versions, let
+us add additional checks and find the compatible version the driver can
+work with.
+
+Link: https://lore.kernel.org/r/20211013091127.990992-1-sudeep.holla@arm=
.com
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+(cherry picked from commit 8e3f9da608f14cfebac2659d8dd8737b79d01308)
+Change-Id: I7bc9a3b172a9067bfd4e9bb9d50b4729e915b5a5
+Bug: 168585974
+---
+ drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++++++-----
+ 1 file changed, 32 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
+index c9fb56afbcb4..6e0c883ab708 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -167,6 +167,28 @@ struct ffa_drv_info {
+=20
+ static struct ffa_drv_info *drv_info;
+=20
++/*
++ * The driver must be able to support all the versions from the earlies=
t
++ * supported FFA_MIN_VERSION to the latest supported FFA_DRIVER_VERSION=
.
++ * The specification states that if firmware supports a FFA implementat=
ion
++ * that is incompatible with and at a greater version number than speci=
fied
++ * by the caller(FFA_DRIVER_VERSION passed as parameter to FFA_VERSION)=
,
++ * it must return the NOT_SUPPORTED error code.
++ */
++static u32 ffa_compatible_version_find(u32 version)
++{
++	u32 compat_version;
++	u16 major =3D MAJOR_VERSION(version), minor =3D MINOR_VERSION(version)=
;
++	u16 drv_major =3D MAJOR_VERSION(FFA_DRIVER_VERSION);
++	u16 drv_minor =3D MINOR_VERSION(FFA_DRIVER_VERSION);
++
++	if ((major < drv_major) || (major =3D=3D drv_major && minor <=3D drv_m=
inor))
++		return version;
++
++	pr_info("Firmware version higher than driver version, downgrading\n");
++	return FFA_DRIVER_VERSION;
++}
++
+ static int ffa_version_check(u32 *version)
+ {
+ 	ffa_value_t ver;
+@@ -180,15 +202,20 @@ static int ffa_version_check(u32 *version)
+ 		return -EOPNOTSUPP;
+ 	}
+=20
+-	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
+-		pr_err("Incompatible version %d.%d found\n",
+-		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
++	if (ver.a0 < FFA_MIN_VERSION) {
++		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
++		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0),
++		       MAJOR_VERSION(FFA_MIN_VERSION),
++		       MINOR_VERSION(FFA_MIN_VERSION));
+ 		return -EINVAL;
+ 	}
+=20
+-	*version =3D ver.a0;
+-	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
++	pr_info("Driver version %d.%d\n", MAJOR_VERSION(FFA_DRIVER_VERSION),
++		MINOR_VERSION(FFA_DRIVER_VERSION));
++	pr_info("Firmware version %d.%d found\n", MAJOR_VERSION(ver.a0),
+ 		MINOR_VERSION(ver.a0));
++	*version =3D ffa_compatible_version_find(ver.a0);
++
+ 	return 0;
+ }
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 2d232bbc..95715c65 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -40,6 +40,7 @@ LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
 KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
            file://defconfig  \
+           file://0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-wi=
th-.patch  \
         "
=20
 SRC_URI:append:corstone1000 =3D " ${@bb.utils.contains('MACHINE_FEATURES=
', \
--=20
2.25.1


