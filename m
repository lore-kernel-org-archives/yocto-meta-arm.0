Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D6EC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 18:03:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55412.1638813797868673075
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 10:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4A911FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Dec 2021 10:03:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF59A3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Dec 2021 10:03:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/scp-firmware: update for 2.9
Date: Mon,  6 Dec 2021 18:03:12 +0000
Message-Id: <20211206180312.1712721-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206180312.1712721-1-ross.burton@arm.com>
References: <20211206180312.1712721-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 18:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2549

Use a generic wildcard in the arm-bsp bbappend to avoid needing to rename
in the future.

Remove the N1SDP patch as this has now been merged upstream (c5e45a7).

Remove TC? overrides which pinned it to an intermediate SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ng-coresight-debug-non-secure-access.patch | 38 -------------------
 .../scp-firmware/scp-firmware-n1sdp.inc       |  6 ---
 .../scp-firmware/scp-firmware-tc.inc          | 10 -----
 ..._2.8%.bbappend =3D> scp-firmware_%.bbappend} |  0
 4 files changed, 54 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/ena=
bling-coresight-debug-non-secure-access.patch
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_2.8%.bbappend=
 =3D> scp-firmware_%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-c=
oresight-debug-non-secure-access.patch b/meta-arm-bsp/recipes-bsp/scp-fir=
mware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
deleted file mode 100644
index 713f4a5e..00000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresigh=
t-debug-non-secure-access.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] n1sdp: Enabling CoreSight debug non-secure access
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From 194e6239737272c3fadb202deb8015cb6e8df6ec Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Thu, 22 Apr 2021 15:48:02 +0100
-Subject: [PATCH] n1sdp: Enabling CoreSight debug non-secure access
-
-This patch enables coresight to work with n1sdp c2c profile.
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
----
- product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c b/=
product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
-index 70e2ec3f..ff380ae2 100644
---- a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
-+++ b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
-@@ -466,6 +466,12 @@ static int n1sdp_system_init_primary_core(void)
-             return status;
-     }
-=20
-+    else {
-+        /* Enable non-secure CoreSight debug access */
-+        FWK_LOG_INFO("N1SDP SYSTEM] Enabling CoreSight debug non-secure=
 access");
-+        *(volatile uint32_t *)(AP_SCP_SRAM_OFFSET +
-+                               NIC_400_SEC_0_CSAPBM_OFFSET) =3D 0xFFFFF=
FFF;
-+    }
-     return FWK_SUCCESS;
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 506eeec2..1af68dde 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,12 +3,6 @@
 SCP_PLATFORM  =3D "n1sdp"
 SCP_LOG_LEVEL =3D "INFO"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
-
-SRC_URI:append =3D " \
-   file://enabling-coresight-debug-non-secure-access.patch \
-   "
-
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
=20
 DEPENDS +=3D "fiptool-native"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 8751315a..cdf1bb6a 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,15 +1,5 @@
 # TC0 specific SCP configuration
=20
-# Intermediate SHA with 2.8 baseline version
-SRCREV =3D "26c858b46824a8d74a7593325a0124c163de65d6"
-
-PV =3D "2.8.0+git${SRCPV}"
-
-# This is incorporated into the SRCREV above
-SRC_URI:remove =3D " \
-    file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.pat=
ch \
-    "
-
 COMPATIBLE_MACHINE =3D "(tc?)"
=20
 SCP_PLATFORM:tc0 =3D "tc0"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.8%.bbapp=
end
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
--=20
2.25.1


