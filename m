Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C97C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:14:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4714.1652879650173666024
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9D2123A;
	Wed, 18 May 2022 06:14:09 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.2.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BC213F73D;
	Wed, 18 May 2022 06:14:08 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	emeara01 <emekcan.aras@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-a: corstone1000: fix FF-A
 Version in SPMC manifest
Date: Wed, 18 May 2022 14:13:55 +0100
Message-Id: <20220518131356.86191-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518131356.86191-1-emekcan.aras@arm.com>
References: <20220518131356.86191-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3434

From: emeara01 <emekcan.aras@arm.com>

FF-A version is defined 1.1 in corstone1000_spmc_manifest.dts. However, S=
PMC
does not support FF-A version 1.1 at the moment. This commit fixes FF-A v=
ersion
issue by defining 1.0 again.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 ...01-Fix-FF-A-version-in-SPMC-manifest.patch | 34 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0001-Fix-FF-A-version-in-SPMC-manifest.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0001-Fix-FF-A-version-in-SPMC-manifest.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-a/files/corstone1000/0001-Fix-FF-A-version-in-SPMC-man=
ifest.patch
new file mode 100644
index 00000000..016de8d3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Fix-FF-A-version-in-SPMC-manifest.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From a31aee0988ef64724ec5866f10709f51f8cb3237 Mon Sep 17 00:00:00 2001
+From: emeara01 <emekcan.aras@arm.com>
+Date: Wed, 11 May 2022 14:37:06 +0100
+Subject: [PATCH] Fix FF-A version in SPMC manifest
+
+OPTEE does not support FF-A version 1.1 in SPMC at the moment.
+This commit corrects the FF-A version in corstone1000_spmc_manifest.dts.
+This patch will not be upstreamed and will be dropped once
+OPTEE version is updated for Corstone1000.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+---
+ .../corstone1000/common/fdts/corstone1000_spmc_manifest.dts     | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_m=
anifest.dts b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_m=
anifest.dts
+index 8e49ab83f..5baa1b115 100644
+--- a/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest=
.dts
++++ b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest=
.dts
+@@ -20,7 +20,7 @@
+ 	attribute {
+ 		spmc_id =3D <0x8000>;
+ 		maj_ver =3D <0x1>;
+-		min_ver =3D <0x1>;
++		min_ver =3D <0x0>;
+ 		exec_state =3D <0x0>;
+ 		load_address =3D <0x0 0x2002000>;
+ 		entrypoint =3D <0x0 0x2002000>;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index ac4a412c..bf5d2759 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -6,6 +6,10 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1=
000:"
 SRCREV_tfa =3D "cf89fd57ed3286d7842eef41cd72a3977eb6d317"
 PV =3D "2.6+git${SRCPV}"
=20
+SRC_URI:append =3D " \=20
+	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
+	"
+
 SRC_URI:remove =3D " \
      file://ssl.patch \
      " =20
--=20
2.25.1


