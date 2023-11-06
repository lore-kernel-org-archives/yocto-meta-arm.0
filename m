Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9CAC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:52:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.59931.1699289529126376866
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 08:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99DB01FB;
	Mon,  6 Nov 2023 08:52:52 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.70.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BA283F64C;
	Mon,  6 Nov 2023 08:52:07 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: enable debug-tweaks
Date: Mon,  6 Nov 2023 16:52:01 +0000
Message-Id: <20231106165201.327960-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 16:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5212

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add debug.yml to the build command so the debug-tweaks image feature
is enabled

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 5dfbde6c..838a04f1 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -174,7 +174,7 @@ To build a Corstone-1000 image for MPS3 FPGA, run:
=20
 ::
=20
-    kas build meta-arm/kas/corstone1000-mps3.yml
+    kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml
=20
 Alternatively, to build a Corstone-1000 image for FVP, you need to accep=
t
 the EULA at https://developer.arm.com/downloads/-/arm-ecosystem-fvps/eul=
a
@@ -188,7 +188,7 @@ then run:
=20
 ::
=20
-    kas build meta-arm/kas/corstone1000-fvp.yml
+    kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml
=20
 The initial clean build will be lengthy, given that all host utilities a=
re to
 be built as well as the target images. This includes host executables (p=
ython,
@@ -414,7 +414,7 @@ boot. Run following commands to build such image.
   cd meta-arm
   git apply 0001-embedded-a-corstone1000-clean-secure-flash.patch
   cd ..
-  kas build meta-arm/kas/corstone1000-mps3.yml
+  kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml
=20
 Replace the bl1.bin and cs1000.bin files on the SD card with following f=
iles:
   - The ROM firmware: <_workspace>/build/tmp/deploy/images/corstone1000-=
mps3/bl1.bin
@@ -952,7 +952,7 @@ documentation.
   cd meta-arm
   git am 0001-arm-bsp-u-boot-corstone1000-Skip-the-shim-by-booting.patch
   cd ..
-  kas shell meta-arm/kas/corstone1000-mps3.yml -c=3D"bitbake u-boot trus=
ted-firmware-a corstone1000-image -c cleansstate; bitbake corstone1000-im=
age"
+  kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot trusted-firmware-a corstone1000-image -c cleansstate; bit=
bake corstone1000-image"
=20
 Please update the cs1000.bin on the SD card with the newly generated wic=
 file.
=20
--=20
2.25.1


