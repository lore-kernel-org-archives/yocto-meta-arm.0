Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A54C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:35:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35489.1697193300062949390
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30180139F;
	Fri, 13 Oct 2023 03:35:40 -0700 (PDT)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1804F3F762;
	Fri, 13 Oct 2023 03:34:58 -0700 (PDT)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH mickledore 1/1] arm-bsp/corstone1000: Fix RSA key generation issue
Date: Fri, 13 Oct 2023 11:34:37 +0100
Message-Id: <20231013103437.2624684-2-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013103437.2624684-1-vikas.katariya@arm.com>
References: <20231013103437.2624684-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 10:35:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5116

From: Vikas Katariya <vikas.katariya@arm.com>

This support is for Cassini distro using Corstone-1000 platform.

When running parsec test, it reports an error
`PSA_ERROR_DATA_INVALID (-153)`.

This is related to `ITS_MAX_ASSET_SIZE` configuration which is been
set to 512 on the secure enclave (TF-M), which defines the max asset
size and it overflows when running the parsec tests.

The key is generated, but when it is asked to store via `psa_its_set`
it returns `PSA_ERROR_INVALID_ARGUMENT (-135)`, which then propagates
to `PSA_ERROR_DATA_INVALID (-153)`

Increasing the `ITS_MAX_ASSET_SIZE` to 2048 solves this issue.

Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
---
 ...tone1000-increase-ITS-max-asset-size.patch | 29 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corst=
one1000/0016-platform-corstone1000-increase-ITS-max-asset-size.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000=
/0016-platform-corstone1000-increase-ITS-max-asset-size.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-platform-corstone1=
000-increase-ITS-max-asset-size.patch
new file mode 100644
index 000000000..4d146c226
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-p=
latform-corstone1000-increase-ITS-max-asset-size.patch
@@ -0,0 +1,29 @@
+From ef97f7083279565dab45a550139935d741f159a9 Mon Sep 17 00:00:00 2001=0D
+From: Emekcan Aras <emekcan.aras@arm.com>=0D
+Date: Fri, 29 Sep 2023 09:57:19 +0100=0D
+Subject: [PATCH] platform: corstone1000: Increase ITS max asset size=0D
+=E2=80=8B=0D
+Increases the max asset size for ITS to enable parsec services & tests=0D
+=E2=80=8B=0D
+Upstream-Status: Pending=0D
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>=0D
+Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>=0D
+---=0D
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 5 +++++=0D
+ 1 files changed, 5 insertions(+)=0D
+=E2=80=8B=0D
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/pl=
atform/ext/target/arm/corstone1000/config_tfm_target.h=0D
+index e968366639..3f6e8477e5 100644=0D
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h=0D
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h=0D
+@@ -24,4 +24,9 @@=0D
+ #undef PS_NUM_ASSETS=0D
+ #define PS_NUM_ASSETS        20=0D
+=0D
++/* The maximum size of asset to be stored in the Internal Trusted Storage=
 area. */=0D
++#undef ITS_MAX_ASSET_SIZE=0D
++#define ITS_MAX_ASSET_SIZE        2048=0D
++=0D
++=0D
+ #endif /* __CONFIG_TFM_TARGET_H__ */=0D
+--=20
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m-1.7.0-corstone1000.inc
index 23c8c127b..54efb4401 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-=
corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-=
corstone1000.inc
@@ -52,6 +52,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch        =
      \
     file://0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch=
      \
     file://corstone1000/rwx.patch                                         =
      \
+    file://0016-platform-corstone1000-increase-ITS-max-asset-size.patch   =
      \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


