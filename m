Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158E4C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23052.1684495467507558475
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1C051FB;
	Fri, 19 May 2023 04:25:11 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A2A53F762;
	Fri, 19 May 2023 04:24:26 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 06/16] optee-test: backport SWd ABI compatibility changes
Date: Fri, 19 May 2023 13:23:50 +0200
Message-Id: <20230519112400.340-6-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4670

The ABI used by the arm-ffa-user driver to call into the SWd changed.
The change was driven by the MM over FF-A ABI implementation which is
used by SmmGW SP and uefi-test. uefi-test uses the same arm-ffa-user
driver as xtest hence xtest needs to be updated to use the new driver.
This xtest change is already merged up-stream but after v3.20, which is
used here.
This change adds backported xtest changes as carried patches.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 ...pdate-arm_ffa_user-driver-dependency.patch |  39 +++++
 ..._ffa_user-driver-compatibility-check.patch | 163 ++++++++++++++++++
 .../optee/optee-test_3.20.0.bb                |   2 +
 3 files changed, 204 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/Update-arm=
_ffa_user-driver-dependency.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test/ffa_spmc-A=
dd-arm_ffa_user-driver-compatibility-check.patch

diff --git a/meta-arm/recipes-security/optee/optee-test/Update-arm_ffa_us=
er-driver-dependency.patch b/meta-arm/recipes-security/optee/optee-test/U=
pdate-arm_ffa_user-driver-dependency.patch
new file mode 100644
index 00000000..e889f740
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/Update-arm_ffa_user-driv=
er-dependency.patch
@@ -0,0 +1,39 @@
+From 7e15470f3dd45c844f0e0901f0c85c46a0882b8b Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 3 Mar 2023 12:23:45 +0100
+Subject: [PATCH 1/2] Update arm_ffa_user driver dependency
+
+Updating arm-ffa-user to v5.0.1 to get the following changes:
+ - move to 64 bit direct messages
+ - add Linux Kernel v6.1 compatibility
+The motivation is to update x-test to depend on the same driver
+version as TS uefi-test and thus to enable running these in a single
+configuration.
+Note: arm_ffa_user.h was copied from:
+ - URL:https://git.gitlab.arm.com/linux-arm/linux-trusted-services.git
+ - SHA:18e3be71f65a405dfb5d97603ae71b3c11759861
+
+Upstream-Status: Backport
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/include/uapi/linux/arm_ffa_user.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/xtest/include/uapi/linux/arm_ffa_user.h b/host/xtest/i=
nclude/uapi/linux/arm_ffa_user.h
+index 9ef0be3..0acde4f 100644
+--- a/host/xtest/include/uapi/linux/arm_ffa_user.h
++++ b/host/xtest/include/uapi/linux/arm_ffa_user.h
+@@ -33,7 +33,7 @@ struct ffa_ioctl_ep_desc {
+  * @dst_id:	[in] 16-bit ID of destination endpoint.
+  */
+ struct ffa_ioctl_msg_args {
+-	__u32 args[5];
++	__u64 args[5];
+ 	__u16 dst_id;
+ };
+ #define FFA_IOC_MSG_SEND	_IOWR(FFA_IOC_MAGIC, FFA_IOC_BASE + 1, \
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test/ffa_spmc-Add-arm_=
ffa_user-driver-compatibility-check.patch b/meta-arm/recipes-security/opt=
ee/optee-test/ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch
new file mode 100644
index 00000000..d333e860
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/ffa_spmc-Add-arm_ffa_use=
r-driver-compatibility-check.patch
@@ -0,0 +1,163 @@
+From 6734d14cc249af37705129de7874533df9535cd3 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 3 Mar 2023 12:25:58 +0100
+Subject: [PATCH 2/2] ffa_spmc: Add arm_ffa_user driver compatibility che=
ck
+
+Check the version of the arm_ffa_user Kernel Driver and fail with a
+meaningful message if incompatible driver is detected.
+
+Upstream-Status: Backport
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/ffa_spmc_1000.c | 68 ++++++++++++++++++++++++++++++++++----
+ 1 file changed, 61 insertions(+), 7 deletions(-)
+
+diff --git a/host/xtest/ffa_spmc_1000.c b/host/xtest/ffa_spmc_1000.c
+index 15f4a46..1839d03 100644
+--- a/host/xtest/ffa_spmc_1000.c
++++ b/host/xtest/ffa_spmc_1000.c
+@@ -1,11 +1,12 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2022-2023, Arm Limited and Contributors. All rights re=
served.
+  */
+ #include <fcntl.h>
+ #include <ffa.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <errno.h>
+ #include <sys/ioctl.h>
+ #include <unistd.h>
+ #include "include/uapi/linux/arm_ffa_user.h"
+@@ -17,6 +18,10 @@
+ #define INCORRECT_ENDPOINT_ID 0xffff
+ #define NORMAL_WORLD_ENDPOINT_ID	0
+=20
++#define FFA_USER_REQ_VER_MAJOR 5
++#define FFA_USER_REQ_VER_MINOR 0
++#define FFA_USER_REQ_VER_PATCH 1
++
+ /* Get the 32 least significant bits of a handle.*/
+ #define MEM_SHARE_HANDLE_LOW(x) ((x) & 0xffffffff)
+ /* Get the 32 most significant bits of a handle.*/
+@@ -62,6 +67,50 @@ static struct ffa_ioctl_ep_desc test_endpoint3 =3D {
+ 	.uuid_ptr =3D (uint64_t)test_endpoint3_uuid,
+ };
+=20
++static bool check_ffa_user_version(void)
++{
++	FILE *f =3D NULL;
++	int ver_major =3D -1;
++	int ver_minor =3D -1;
++	int ver_patch =3D -1;
++	int scan_cnt =3D 0;
++
++	f =3D fopen("/sys/module/arm_ffa_user/version", "r");
++	if (f) {
++		scan_cnt =3D fscanf(f, "%d.%d.%d",
++				  &ver_major, &ver_minor, &ver_patch);
++		fclose(f);
++		if (scan_cnt !=3D 3) {
++			printf("error: failed to parse arm_ffa_user version\n");
++			return false;
++		}
++	} else {
++		printf("error: failed to read arm_ffa_user module info - %s\n",
++		       strerror(errno));
++		return false;
++	}
++
++	if (ver_major !=3D FFA_USER_REQ_VER_MAJOR)
++		goto err;
++
++	if (ver_minor < FFA_USER_REQ_VER_MINOR)
++		goto err;
++
++	if (ver_minor =3D=3D FFA_USER_REQ_VER_MINOR)
++		if (ver_patch < FFA_USER_REQ_VER_PATCH)
++			goto err;
++
++	return true;
++
++err:
++	printf("error: Incompatible arm_ffa_user driver detected.");
++	printf("Found v%d.%d.%d wanted >=3D v%d.%d.%d)\n",
++	       ver_major, ver_minor, ver_patch, FFA_USER_REQ_VER_MAJOR,
++		   FFA_USER_REQ_VER_MINOR, FFA_USER_REQ_VER_PATCH);
++
++	return false;
++}
++
+ static void close_debugfs(void)
+ {
+ 	int err =3D 0;
+@@ -76,6 +125,9 @@ static void close_debugfs(void)
+=20
+ static bool init_sp_xtest(ADBG_Case_t *c)
+ {
++	if (!check_ffa_user_version())
++		return false;
++
+ 	if (ffa_fd < 0) {
+ 		ffa_fd =3D open(FFA_DRIVER_FS_PATH, O_RDWR);
+ 		if (ffa_fd < 0) {
+@@ -83,6 +135,7 @@ static bool init_sp_xtest(ADBG_Case_t *c)
+ 			return false;
+ 		}
+ 	}
++
+ 	return true;
+ }
+=20
+@@ -99,7 +152,7 @@ static uint16_t get_endpoint_id(uint64_t endp)
+ 	struct ffa_ioctl_ep_desc sid =3D { .uuid_ptr =3D endp };
+=20
+ 	/* Get ID of destination SP based on UUID */
+-	if(ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
++	if (ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
+ 		return INCORRECT_ENDPOINT_ID;
+=20
+ 	return sid.id;
+@@ -213,14 +266,15 @@ static int set_up_mem(struct ffa_ioctl_ep_desc *en=
dp,
+ 	rc =3D share_mem(endpoint, handle);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+=20
+-	if (!ADBG_EXPECT_TRUE(c, handle !=3D NULL))
+-	     return TEEC_ERROR_GENERIC;
++	if (!ADBG_EXPECT_NOT_NULL(c, handle))
++		return TEEC_ERROR_GENERIC;
+=20
+ 	/* SP will retrieve the memory region. */
+ 	memset(args, 0, sizeof(*args));
+ 	args->dst_id =3D endpoint;
+ 	args->args[MEM_SHARE_HANDLE_LOW_INDEX] =3D MEM_SHARE_HANDLE_LOW(*handl=
e);
+-	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D MEM_SHARE_HANDLE_HIGH(*han=
dle);
++	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D
++		MEM_SHARE_HANDLE_HIGH(*handle);
+ 	args->args[MEM_SHARE_HANDLE_ENDPOINT_INDEX] =3D NORMAL_WORLD_ENDPOINT_=
ID;
+=20
+ 	rc =3D start_sp_test(endpoint, EP_RETRIEVE, args);
+@@ -254,7 +308,7 @@ static void xtest_ffa_spmc_test_1002(ADBG_Case_t *c)
+ 	rc =3D start_sp_test(endpoint1_id, EP_TEST_SP, &args);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+ 	if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_O=
K))
+-	     goto out;
++		goto out;
+=20
+ 	/* Set up memory and have the SP retrieve it. */
+ 	Do_ADBG_BeginSubCase(c, "Test memory set-up");
+@@ -469,7 +523,7 @@ static void xtest_ffa_spmc_test_1005(ADBG_Case_t *c)
+ 	memset(&args, 0, sizeof(args));
+ 	args.args[1] =3D endpoint2;
+ 	args.args[2] =3D endpoint3;
+-	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI,&args);
++	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI, &args);
+ 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
+ 	ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_OK);
+=20
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.20.0.bb
index 95452b6a..50f5afe7 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
@@ -1,6 +1,8 @@
 require optee-test.inc
=20
 SRC_URI:append =3D " \
+    file://Update-arm_ffa_user-driver-dependency.patch \
+    file://ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch \
     file://musl-workaround.patch \
    "
 SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
--=20
2.39.1.windows.1


