Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA71CA1008
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:51:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20001.1725033110492771837
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 452091063
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:52:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B244B3F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:51:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: update LICENSE entry
Date: Fri, 30 Aug 2024 11:51:48 -0400
Message-Id: <20240830155148.24392-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6041

As pointed out by Denys Dmytriyenko, the LICENSE entry in
trusted-firmware-a is not accurate.  docs/license.rst specifies the
licenses to be BSD 3 Clause for the project, with code from other
projects imported as:
libc BSD-3-Clause
libfdt BSD-2-Clause
LLVM BSD-3-Clause
zlib BSD-3-Clause
STMicroelectronics platform source code BSD-3-Clause
Linux source  MIT
DICE Apache 2.0

Note: these are the license the code is imported with (according to
license.rst), not a listing of the license(s) of those sources.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 80d41f328afa..f90b588444a4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Trusted Firmware-A"
-LICENSE =3D "BSD-3-Clause & MIT"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
--=20
2.39.3 (Apple Git-146)


