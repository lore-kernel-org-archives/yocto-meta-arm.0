Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB6CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9940.1755868695398387920
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F9027DC
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:06 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB6CC3F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/gn: disable uninitialized variable warning
Date: Fri, 22 Aug 2025 09:18:09 -0400
Message-Id: <20250822131813.93724-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
References: <20250822131813.93724-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6673

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


