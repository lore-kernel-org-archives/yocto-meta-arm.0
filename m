Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AFEC3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:32:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17130.1719581518112941328
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 06:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7B49106F;
	Fri, 28 Jun 2024 06:32:22 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.72.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199AD3F766;
	Fri, 28 Jun 2024 06:31:56 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-services: fix compilation issues for ts-newlib
Date: Fri, 28 Jun 2024 14:31:45 +0100
Message-Id: <20240628133145.1444437-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
References: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Jun 2024 13:32:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5851

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Fix compilation issues with newer GCC version 14.1 for ts-newlib package
by disabling GCC flags for now.
This is just to unblock meta-arm master compilation issues.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../recipes-security/trusted-services/ts-newlib_%.bbappend       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.b=
bappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbap=
pend
index 708f5986..e861426a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -4,5 +4,6 @@ COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000 =3D " \
   file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=3D..=
/newlib \
 "
+export NEWLIB_CFLAGS_TARGET =3D "-Wno-implicit-function-declaration -Wno=
-int-conversion"
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
--=20
2.25.1


