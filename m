Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC16FC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:29:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11137.1743168544651699286
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E27281688
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:08 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9F3C3F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 06:29:03 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/edk2-firmware: Fix branch name variables
Date: Fri, 28 Mar 2025 09:29:01 -0400
Message-Id: <20250328132903.66472-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6421

In the SRC_URI, the branch name variables are switched for edk2 and
edk2-platforms.  Switch them as appropriate.

Fixes: bf204866e864 ("arm: Use SRC* variables consistently")
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 42668d9d9cd6..5475b0a1bc5c 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -18,8 +18,8 @@ SRC_URI_EDK2_PLATFORMS ?=3D "git://github.com/tianocore=
/edk2-platforms.git;protoco
 SRCBRANCH_edk2 =3D "master"
 SRCBRANCH_edk2_platforms =3D "master"
 SRC_URI =3D "\
-    ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2;des=
tsuffix=3Dedk2 \
-    ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2-pla=
tforms;destsuffix=3Dedk2/edk2-platforms \
+    ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2};name=3Dedk2;destsuffix=3D=
edk2 \
+    ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2_platforms};name=3D=
edk2-platforms;destsuffix=3Dedk2/edk2-platforms \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
--=20
2.39.5 (Apple Git-154)


