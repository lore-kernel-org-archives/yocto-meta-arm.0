Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53139C4167D
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 15:48:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.124852.1699544923710471935
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 07:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A926112FC;
	Thu,  9 Nov 2023 07:49:27 -0800 (PST)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.29.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAB2C3F64C;
	Thu,  9 Nov 2023 07:48:42 -0800 (PST)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH] arm-bsp/corstone1000: Remove inappropriate kernel delay patch
Date: Thu,  9 Nov 2023 15:48:27 +0000
Message-Id: <20231109154827.4103-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Nov 2023 15:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5221

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

When booting, the tee driver from kernel side
invokes a yielding call to OP-TEE, which gets
stuck because OP-TEE never sends Done response:
OPTEE_FFA_YIELDING_CALL_RETURN_DONE
This issue was previously resolved by introducing
an inappropriate patch to the kernel with 1 ms delay
in ffa_msg_send_direct_req.
Further investigation proved that OP-TEE doesn't
get enough processing time and is constantly interrupted
by the kernel requests. To remove this patch, TF-A logging
level is lowered to default (40 in debug builds and
20 in release builds), which eliminates the time consumed
previously by TF-A VERBOSE logs (giving OP-TEE more
processing time).

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 .../trusted-firmware-a-corstone1000.inc       | 11 +++++-
 ...dds-workaround-for-cs1k-specific-bug.patch | 37 -------------------
 .../linux/linux-arm-platforms.inc             |  1 -
 3 files changed, 10 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-Adds-workaround-for-cs1k-specific-bug.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index ee071371..8673199d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -24,6 +24,16 @@ TFA_SPMD_SPM_AT_SEL2 =3D "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS +=3D "optee-os"
=20
+# Note: Regarding the build option: LOG_LEVEL.=20
+# There seems to be an issue when setting it
+# to 50 (LOG_LEVEL_VERBOSE), where the kernel=20
+# tee driver sends yielding requests to OP-TEE
+# at a faster pace than OP-TEE processes them,
+# as the processing time is consumed by logging=20
+# in TF-A. When this issue occurs, booting halts=20
+# as soon as optee driver starts initialization.
+# Therefore, it's not currently recommended to
+# set LOG_LEVEL to 50 at all.
 EXTRA_OEMAKE:append =3D " \
                         ARCH=3Daarch64 \
                         TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM} \
@@ -41,5 +51,4 @@ EXTRA_OEMAKE:append =3D " \
                         ERRATA_A35_855472=3D1 \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
-                        LOG_LEVEL=3D50 \
                         "
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Ad=
ds-workaround-for-cs1k-specific-bug.patch b/meta-arm-bsp/recipes-kernel/l=
inux/files/corstone1000/0002-Adds-workaround-for-cs1k-specific-bug.patch
deleted file mode 100644
index 4fbeb23e..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Adds-work=
around-for-cs1k-specific-bug.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 555ac46f6f5157741a6fd8f21f74beb1340ed941 Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Thu, 13 Oct 2022 20:53:42 +0100
-Subject: [PATCH] Adds workaround for cs1k specific bug
-
-Adds a temporary workaround to solve a possible
-race-conditioning issue in the tee driver
-for corstone1000.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/firmware/arm_ffa/driver.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 2109cd178ff7..c15b3a83c720 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -32,6 +32,7 @@
- #include <linux/scatterlist.h>
- #include <linux/slab.h>
- #include <linux/uuid.h>
-+#include <linux/delay.h>
-=20
- #include "common.h"
-=20
-@@ -282,7 +283,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
- {
- 	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
- 	ffa_value_t ret;
--
-+	msleep(1);
- 	if (mode_32bit) {
- 		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
- 		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 045c8568..6c132c97 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -30,7 +30,6 @@ LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
 KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
            file://defconfig  \
-           file://0002-Adds-workaround-for-cs1k-specific-bug.patch \
         "
=20
 SRC_URI:append:corstone1000 =3D " ${@bb.utils.contains('MACHINE_FEATURES=
', \
--=20
2.34.1


