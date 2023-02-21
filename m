Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73365C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:51:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49516.1677001898525774868
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 09:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E301655;
	Tue, 21 Feb 2023 09:52:20 -0800 (PST)
Received: from e126544.cambridge.arm.com (unknown [10.1.199.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 665A33F881;
	Tue, 21 Feb 2023 09:51:37 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-m:corstone1000: Increase number of assets
Date: Tue, 21 Feb 2023 17:51:28 +0000
Message-Id: <20230221175129.308197-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
References: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 17:51:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4434

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

As Corstone1000 stores at boot time few efi variables.
Therefore, number of assets is increased to compansate this early usage.

Note: Adding platform customized configs to config_tfm.h
      More information see:
https://tf-m-user-guide.trustedfirmware.org/configuration/header_file_sys=
tem.html

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...rstone1000-Increase-number-of-assets.patch | 38 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  5 +++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-corstone1000-Increase-number-of-assets.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-corstone1000-Increase-number-of-assets.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corst=
one1000-Increase-number-of-assets.patch
new file mode 100644
index 00000000..f0368b84
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-Increase-number-of-assets.patch
@@ -0,0 +1,38 @@
+From decb355247c4ba4b876997f55c27ec3f55dbacd2 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 23 Jan 2023 13:25:28 +0000
+Subject: [PATCH] Platform: corstone1000: Increase number of assets
+
+As Corstone1000 stores at boot time few efi variables.
+Therefore, number of assets is increased to compansate this early usage.
+
+Note: Adding platform customized configs to config_tfm.h
+      More information see:
+https://tf-m-user-guide.trustedfirmware.org/configuration/header_file_sy=
stem.html
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Pending [Not submitted yet]
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index bf8d2f95f7..e968366639 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -16,4 +16,12 @@
+ #undef PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE
+ #define PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE    256
+=20
++/* The maximum number of assets to be stored in the Internal Trusted St=
orage. */
++#undef ITS_NUM_ASSETS
++#define ITS_NUM_ASSETS       20
++
++/* The maximum number of assets to be stored in the Protected Storage a=
rea. */
++#undef PS_NUM_ASSETS
++#define PS_NUM_ASSETS        20
++
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/t=
rusted-firmware-m-1.7.0-corstone1000.inc
index 279109e0..ee35a253 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
@@ -26,6 +26,11 @@ SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde0=
42966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI:append=3D " \
+    file://0001-Platform-corstone1000-Increase-number-of-assets.patch  \
+           "
+
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
--=20
2.25.1


