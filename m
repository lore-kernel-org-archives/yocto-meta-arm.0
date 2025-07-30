Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC006C87FD6
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33469.1753876432952683973
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DDB82573;
	Wed, 30 Jul 2025 04:53:44 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB4623F66E;
	Wed, 30 Jul 2025 04:53:51 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 03/13] arm-bsp/trusted-firmware-m: corstone-1000: Increase PS_MAX_ASSET_SIZE and CRYPTO_IOVEC_BUFFER_SIZE for EFI variable support
Date: Wed, 30 Jul 2025 12:53:17 +0100
Message-Id: <20250730115327.3671160-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6640

Increase `PS_MAX_ASSET_SIZE` and `CRYPTO_IOVEC_BUFFER_SIZE` for the
Corstone-1000 platform to support large EFI variable storage required
by the UEFI firmware update flow and to pass Arm Architecture Compliance
Suite (ACS) tests.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...m-Corstone1000-Increase-buffer-sizes.patch | 40 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0028-Platform-Corstone1000-Increase-buffer-sizes.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0028-Platform-Corstone1000-Increase-buffer-sizes.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0028-Platform-Corstone1=
000-Increase-buffer-sizes.patch
new file mode 100644
index 00000000..2aaa4fcd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0028=
-Platform-Corstone1000-Increase-buffer-sizes.patch
@@ -0,0 +1,40 @@
+From e3d94988f14b3004606c247b39bda5ade119545f Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 12 Mar 2025 13:10:47 +0000
+Subject: [PATCH 2/2] Platform: Corstone1000: Increase buffer sizes
+
+Increase PSA_MAX_ASSET_SIZE and CRYPTO_IOVEC_BUFFER_SIZE
+to accommodate large size EFI variables set by new U-Boot version.
+
+This change is required to pass ACS tests related to Set/Get
+EFI variables. These ACS tests started failing after introducing new
+version of U-Boot, Trusted-Services and Trusted-Firmware-M while
+implementing PSA FWU support.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39517/1]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index 0b410dfd4..a65305bd4 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -24,11 +24,11 @@
+ #define ITS_MAX_ASSET_SIZE   2048
+=20
+ /* The maximum asset size to be stored in the Protected Storage */
+-#define PS_MAX_ASSET_SIZE   2592
++#define PS_MAX_ASSET_SIZE   3500
+=20
+ /* This is needed to be able to process the EFI variables during PS wri=
tes. */
+ #define CRYPTO_ENGINE_BUF_SIZE 0x5000
+=20
+ /* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
+-#define CRYPTO_IOVEC_BUFFER_SIZE    6000
++#define CRYPTO_IOVEC_BUFFER_SIZE    7200
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 87302069..562abb7c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -46,6 +46,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.pat=
ch \
     file://0026-Platform-CS1000-Enable-FWU-partition.patch \
     file://0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
+    file://0028-Platform-Corstone1000-Increase-buffer-sizes.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

