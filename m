Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF60DC41513
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 14:25:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.135431.1692109517839274436
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 07:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9871063;
	Tue, 15 Aug 2023 07:25:59 -0700 (PDT)
Received: from PW04GXMM.cambridge.arm.com (PW04GXMM.arm.com [10.1.32.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F00E3F6C4;
	Tue, 15 Aug 2023 07:25:16 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-m: corstone1000: add unique firmware GUID
Date: Tue, 15 Aug 2023 15:24:50 +0100
Message-Id: <20230815142450.545-3-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
References: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Aug 2023 14:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4962

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Add new Corstone-1000 firmware GUID and remove previous u-boot GUID to be=
 updated into ESRT table.
SR-IR 2.0 requires the capsule GUID to be unique.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 ...orstone1000-add-unique-firmware-GUID.patch | 35 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-corstone1000-add-unique-firmware-GUID.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-corstone1000-add-unique-firmware-GUID.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corsto=
ne1000-add-unique-firmware-GUID.patch
new file mode 100644
index 00000000..2f5ba04b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-corstone1000-add-unique-firmware-GUID.patch
@@ -0,0 +1,35 @@
+From 3004fda909079ebebd62c495a4e49e64d6c8a85f Mon Sep 17 00:00:00 2001
+From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+Date: Tue, 8 Aug 2023 10:58:01 +0000
+Subject: [PATCH] Platform corstone1000 add unique firmware GUID
+
+Add unique Corstone-1000 firmware GUID
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
+---
+ .../target/arm/corstone1000/fw_update_agent/fwu_agent.c   | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index f564f2902c..9c31aeee9d 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -113,10 +113,10 @@ enum fwu_agent_state_t {
+ };
+=20
+ struct efi_guid full_capsule_image_guid =3D {
+-    .time_low =3D 0xe2bb9c06,
+-    .time_mid =3D 0x70e9,
+-    .time_hi_and_version =3D 0x4b14,
+-    .clock_seq_and_node =3D {0x97, 0xa3, 0x5a, 0x79, 0x13, 0x17, 0x6e, =
0x3f}
++    .time_low =3D 0x989f3a4e,
++    .time_mid =3D 0x46e0,
++    .time_hi_and_version =3D 0x4cd0,
++    .clock_seq_and_node =3D {0x98, 0x77, 0xa2, 0x5c, 0x70, 0xc0, 0x13, =
0x29}
+ };
+=20
+=20
+--=20
+2.38.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 0831ed0e..a259390a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -32,6 +32,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch \
     file://0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.pat=
ch \
     file://0004-arm-trusted-firmware-m-disable-fatal-warnings.patch \
+    file://0005-Platform-corstone1000-add-unique-firmware-GUID.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.34.1


