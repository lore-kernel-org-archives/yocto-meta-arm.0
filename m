Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048C8C71141
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 13:05:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12393.1749733543224234510
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14E81C0A
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 06:05:22 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96B183F59E
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 06:05:42 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-services: use zero padding for unions
Date: Thu, 12 Jun 2025 09:05:41 -0400
Message-Id: <20250612130541.88191-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250612130541.88191-1-jon.mason@arm.com>
References: <20250612130541.88191-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 13:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6547

GCC15 changed the behavior with how unions are initalized, which is
causing an issue with mbedtls in TS.  Change the behavior to the
previous way of doing things until the fix has been released.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/trusted-services/ts-sp-common.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index eb89127b766c..85109f06e48b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -31,6 +31,10 @@ INSANE_SKIP:${PN}-dev +=3D "ldflags"
=20
 # Trusted Services SPs do not compile with clang
 TOOLCHAIN =3D "gcc"
+# FIXME - there is an issue with mbedtls unions and gcc15.  It has been
+# fixed in commit 4c26d7d54cf5f5dc1e63e0dd0b902fda05e7063f but that has
+# not been released yet.  Work around this issue here until that is out
+TARGET_CFLAGS +=3D "-fzero-init-padding-bits=3Dunions"
=20
 # FORTIFY_SOURCE is a glibc feature. Disable it for all SPs as these do =
not use glibc.
 TARGET_CFLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
--=20
2.39.5 (Apple Git-154)


