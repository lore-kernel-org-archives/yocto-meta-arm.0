Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DFAC531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 18:37:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15590.1785091040600084959
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=b5Dtgrk8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0E761476
	for <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 11:37:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F08D43FA21
	for <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785091040; bh=QhaPFYwEEq5gzwR3eUg3YtSUeMq4mOhmzNK5by2nE6o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b5Dtgrk8hzRg1ZV3lsAew1hCIRHUwdwLn8ZPOTaurhdyTEm0a+ofGBwVMBAhhewtH
	 SRC6GM3aUlA/VkaYaQNtLYC6nhZnXMwqo4zM93WO/FyH+l+/yE7I/p68pKoV5e8giT
	 3bP++BC0mp5KMosskS5YYf1Tqv2+xnlJH+9NCf30=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/corstone1000-external-sys-tests: update HOMEPAGE
Date: Sun, 26 Jul 2026 14:37:17 -0400
Message-ID: <20260726183718.76060-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260726183718.76060-1-jon.mason@arm.com>
References: <20260726183718.76060-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 18:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7131

The HOMEPAGE variable was not updated when the SRC_URI was and it no
longer points to a valid webpage.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../corstone1000-external-sys-tests_git.bb                      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/co=
rstone1000-external-sys-tests_git.bb b/meta-arm-bsp/recipes-test/corstone=
1000-external-sys-tests/corstone1000-external-sys-tests_git.bb
index c14dfc4d7f74..229affc8ecea 100644
--- a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_git.bb
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_git.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "CORSTONE1000 external systems communications tests"
 DESCRIPTION =3D "This is a Linux userspace tool to test the communicatio=
n between Corstone1000 cores"
-HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/test-apps=
.git"
+HOMEPAGE =3D "https://gitlab.arm.com/arm-reference-solutions/corstone100=
0/applications"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe988d=
9a0"
=20
--=20
2.50.1 (Apple Git-155)


