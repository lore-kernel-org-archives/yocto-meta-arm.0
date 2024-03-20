Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C912C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 14:49:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.47011.1710946184094653175
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 07:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE2C13D5
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 07:50:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A07403F64C
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 07:49:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/sbsa-acs: update to 7.1.4
Date: Wed, 20 Mar 2024 10:49:42 -0400
Message-Id: <20240320144942.58433-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240320144942.58433-1-jon.mason@arm.com>
References: <20240320144942.58433-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 14:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5465

Update to the latest version.  Also, remove the gcc12 workaround, as
that was added in edk2 commit 206168e83f090, which has been included
since the 202305 release.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../uefi/{sbsa-acs_7.1.2.bb =3D> sbsa-acs_7.1.4.bb}      | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_7.1.2.bb =3D> sbsa-acs_7.1.4.=
bb} (72%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.1.4.bb
similarity index 72%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
index 2cc9372dfe5e..b61658c44bba 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -8,16 +8,10 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-=
libc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://0001-Patch-in-the-paths-to-the-SBSA-test-suite.patch =
\
             file://0002-Enforce-using-good-old-BFD-linker.patch \
-            file://0001-Fix-for-mismatch-in-function-prototype.patch;pat=
chdir=3DShellPkg/Application/sbsa-acs \
             "
=20
-
-SRCREV_acs =3D "23253befbed2aee7304470fd83b78672488a7fc2"
-SRCREV_libc =3D "d3dea661da9ae4a3421a80905e75a8dc77aa980e"
-
-# GCC12 trips on it
-#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetoo=
ls-turn-off-gcc12-warning.patch
-BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
+SRCREV_acs =3D "be169f0008d86341e1e48cb70d524bd1518c3acc"
+SRCREV_libc =3D "4667a82f0d873221f8b25ea701ce57a29270e4cb"
=20
 COMPATIBLE_HOST =3D "aarch64.*-linux"
 COMPATIBLE_MACHINE =3D ""
--=20
2.39.3 (Apple Git-146)


