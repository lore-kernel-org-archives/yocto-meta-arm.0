Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D51D277C1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 16:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12005.1768063964806328604
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jan 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 913601516
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:37 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3855E3F6A8
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:44 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/boot-wrapper-aarch64: update to latest commit
Date: Sat, 10 Jan 2026 11:52:41 -0500
Message-ID: <20260110165242.38662-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110165242.38662-1-jon.mason@arm.com>
References: <20260110165242.38662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6834

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index ce31bff43aa4..7bbd0c3c9a51 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "ac6742520ded1da30d500f74e8affe86e27cabd5"
+SRCREV =3D "b621b157b42f1fe398520cf499db88aa654c78e2"
=20
 # boot-wrapper doesn't make releases
 UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.50.1 (Apple Git-155)


