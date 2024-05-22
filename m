Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56729C25B79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1232.1716393902333546935
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 117A6DA7;
	Wed, 22 May 2024 09:05:26 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6344B3F766;
	Wed, 22 May 2024 09:05:01 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 5/5] arm-bsp/trusted-firmware-m: corstone1000: increase RSE_COMMS buff size
Date: Wed, 22 May 2024 18:04:43 +0200
Message-Id: <20240522160443.89173-6-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240522160443.89173-1-bence.balogh@arm.com>
References: <20240522160443.89173-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5760

From: Bence Balogh <bence.balogh@arm.com>

The buffer size has to be increased to fit the EFI variables which got
increased metadata sizes.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...latform-corstone1000-Increase-RSE_COMMS-buffer-size.patch} | 4 ++--
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0009-platfo=
rm-corstone1000-Increase-RSE_COMMS-buffer-size.patch} (87%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-platform-corsto=
ne1000-Increase-RSE_COMMS-buffer-size.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
index 6613a415..3269c0e0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
@@ -1,7 +1,7 @@
 From 21b0c9f028b6b04fa2f027510ec90969735f4dd1 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 17 Apr 2024 19:31:03 +0200
-Subject: [PATCH] platform: CS1000: Increase RSE_COMMS buffer size
+Subject: [PATCH] platform: corstone1000: Increase RSE_COMMS buffer size
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Pending
@@ -18,7 +18,7 @@ index 6d79dd3bf..f079f6504 100644
 =20
   /* size suits to fit the largest message too (EFI variables) */
 -#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
-+#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x3B00)
++#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x43C0)
 =20
  /*
   * Allocated for each client request.
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 55cfee5c..eafb1fc7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -25,7 +25,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
     file://0007-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
     file://0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch \
-    file://0009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
+    file://0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.pat=
ch \
     file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
     file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
     "
--=20
2.25.1


