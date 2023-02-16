Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529CBC636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:11:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14073.1676563897449608346
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 08:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 344201042;
	Thu, 16 Feb 2023 08:12:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8393F881;
	Thu, 16 Feb 2023 08:11:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/boot-wrapper-aarch64: tell upgrade checker to look for new SHAs
Date: Thu, 16 Feb 2023 16:11:32 +0000
Message-Id: <20230216161133.3488226-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 16:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4408

This repository doesn't tag releases, so just track the latest SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 74adaf34..411dac0c 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326feb=
fb5fb909226c8e7ebcef5c"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster"
 SRCREV =3D "1044c77062573985f7c994c3b6cef5695f57e955"
=20
+# boot-wrapper doesn't make releases
+UPSTREAM_CHECK_COMMITS =3D "1"
+
 PV =3D "git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


