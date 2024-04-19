Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB005C04FFE
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:12:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20749.1713532322701740929
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9284D339;
	Fri, 19 Apr 2024 06:12:30 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A2123F64C;
	Fri, 19 Apr 2024 06:12:01 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: Fix RSA key generation issue
Date: Fri, 19 Apr 2024 14:11:30 +0100
Message-Id: <20240419131130.1988653-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419131130.1988653-1-adam.johnston@arm.com>
References: <20240419131130.1988653-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Apr 2024 13:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5567

From: Adam Johnston <adam.johnston@arm.com>

A patch was dropped when trusted-firmware-m was updated to 2.0 but it
had not yet been merged upstream (2.0 or master).

Restore the patch to fix regression on Corstone-1000
---
 ...tone1000-Increase-ITS-max-asset-size.patch | 27 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-platform-corstone1000-Increase-ITS-max-asset-size.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-platform-corstone1000-Increase-ITS-max-asset-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-platform-cor=
stone1000-Increase-ITS-max-asset-size.patch
new file mode 100644
index 00000000..e831f034
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-platform-corstone1000-Increase-ITS-max-asset-size.patch
@@ -0,0 +1,27 @@
+From 2edf197735bd0efb1428c1710443dddcb376d930 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 17 Apr 2024 11:34:45 +0000
+Subject: [PATCH] platform: corstone1000: Increase ITS max asset size
+
+Increases the max asset size for ITS to enable parsec services & tests
+=E2=80=8B
+Upstream-Status: Pending
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index 2c7341afd4..2eb0924770 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -20,4 +20,8 @@
+ /* The maximum number of assets to be stored in the Protected Storage a=
rea. */
+ #define PS_NUM_ASSETS        20
+=20
++/* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
++#undef ITS_MAX_ASSET_SIZE
++#define ITS_MAX_ASSET_SIZE   2048
++
+ #endif /* __CONFIG_TFM_TARGET_H__ */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 72aea36f..136337b6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -41,6 +41,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0006-Platform-Corstone1000-skip-the-first-nv-counter.patch \
     file://0007-platform-corstone1000-add-unique-guid-for-mps3.patch \  =
 =20
     file://0008-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
+    file://0009-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied

