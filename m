Return-Path: <vincent.stehle@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F45C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 14:27:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21391.1707316055443866133
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 06:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vincent.stehle@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BA01FB;
	Wed,  7 Feb 2024 06:28:17 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.8.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29F453F64C;
	Wed,  7 Feb 2024 06:27:34 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: fix typo
Date: Wed,  7 Feb 2024 15:27:26 +0100
Message-ID: <20240207142726.1139751-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Feb 2024 14:27:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5374

Add a couple of missing `bitbake' commands.

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 318cddfd..a308e423 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -658,7 +658,7 @@ If this happens, please apply the following patch, re=
build the software stack fo
   cd meta-arm
   git am 0001-embedded-a-corstone1000-sr-ir-workaround.patch
   cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; cors=
tone1000-image -c cleanall; bitbake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-image -c cleanall; bitbake corstone1000-image"
=20
=20
 Common to FVP and FPGA
@@ -1080,7 +1080,7 @@ On FPGA, please update the cs1000.bin on the SD car=
d with the newly generated wi
   cd <_workspace>/meta-arm
   git reset --hard HEAD~1
   cd ..
-  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; cors=
tone1000-image -c cleanall; bitbake corstone1000-image"
+  kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml -c=3D=
"bitbake u-boot -c cleanall; bitbake trusted-firmware-a -c cleanall; bitb=
ake corstone1000-image -c cleanall; bitbake corstone1000-image"
=20
 *************************************************
 Preparing the Installation Media
--=20
2.43.0


