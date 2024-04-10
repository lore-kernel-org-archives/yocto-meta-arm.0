Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5008BCD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:08:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2307.1712761694749464681
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 08:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F832139F;
	Wed, 10 Apr 2024 08:08:44 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.28.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D45C23F766;
	Wed, 10 Apr 2024 08:08:13 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 2/2] arm-bsp/tf-m:corstone1000: add unique guid for fvp and mps3
Date: Wed, 10 Apr 2024 16:07:44 +0100
Message-Id: <20240410150744.53421-3-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
References: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Apr 2024 15:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5518

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

This patch in TF-M sets unique GUID for Corstone1000 FVP and MPS3

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 ...orstone1000-add-unique-guid-for-mps3.patch | 41 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-platform-corstone1000-add-unique-guid-for-mps3.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-platform-corstone1000-add-unique-guid-for-mps3.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-platform-corsto=
ne1000-add-unique-guid-for-mps3.patch
new file mode 100644
index 00000000..3711b8ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-platform-corstone1000-add-unique-guid-for-mps3.patch
@@ -0,0 +1,41 @@
+From 3d35eb08fe0cea5c4b882c448f44530bb45c05f0 Mon Sep 17 00:00:00 2001
+From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+Date: Tue, 2 Apr 2024 13:04:56 +0000
+Subject: [PATCH] platform: corstone1000: add unique guid for mps3
+
+This patch sets unique GUID for Corstone1000 FVP and MPS3
+
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+---
+ .../target/arm/corstone1000/fw_update_agent/fwu_agent.c   | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 2e6cf80470..be04e0e5df 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -113,13 +113,19 @@ enum fwu_agent_state_t {
+ };
+=20
+ struct efi_guid full_capsule_image_guid =3D {
++#if PLATFORM_IS_FVP
+     .time_low =3D 0x989f3a4e,
+     .time_mid =3D 0x46e0,
+     .time_hi_and_version =3D 0x4cd0,
+     .clock_seq_and_node =3D {0x98, 0x77, 0xa2, 0x5c, 0x70, 0xc0, 0x13, =
0x29}
++#else
++    .time_low =3D 0xdf1865d1,
++    .time_mid =3D 0x90fb,
++    .time_hi_and_version =3D 0x4d59,
++    .clock_seq_and_node =3D {0x9c, 0x38, 0xc9, 0xf2, 0xc1, 0xbb, 0xa8, =
0xcc}
++#endif
+ };
+=20
+-
+ #define IMAGE_ACCEPTED          (1)
+ #define IMAGE_NOT_ACCEPTED      (0)
+ #define BANK_0                  (0)
+--=20
+2.38.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 716d3f1c..e098da72 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -39,6 +39,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0004-platform-corstone1000-align-capsule-update-structs.patch=
 \
     file://0005-platform-corstone1000-fix-synchronization-issue-on-o.pat=
ch \
     file://0006-Platform-Corstone1000-skip-the-first-nv-counter.patch \
+    file://0007-platform-corstone1000-add-unique-guid-for-mps3.patch \  =
 =20
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.34.1


