Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0C7CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 16:54:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2294.1755708866525362031
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 09:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823CE1D31
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Aug 2025 09:54:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8785B3F738
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Aug 2025 09:54:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/gn: disable uninitialized variable warning
Date: Wed, 20 Aug 2025 12:54:23 -0400
Message-Id: <20250820165424.20345-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Aug 2025 16:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6669

An uninitialized variable warning is occurring when compiling gn.
However, since Wall is being used in gn, this is being logged as an
error.  Pass the no-error flag for this case to workaround this issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index d4294bd36aa1..8573cd2ffbd9 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -43,3 +43,4 @@ do_install() {
 BBCLASSEXTEND =3D "native"
=20
 COMPATIBLE_HOST =3D "^(?!riscv32).*"
+CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"
--=20
2.39.5 (Apple Git-154)


