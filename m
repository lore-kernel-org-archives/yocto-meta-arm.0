Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759F2C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:44:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13016.1714743894516707673
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 May 2024 06:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D37413D5
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 May 2024 06:45:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 997823F73F
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 May 2024 06:44:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/boot-wrapper-aarch64: use https to fetch git source
Date: Fri,  3 May 2024 13:44:52 +0000
Message-Id: <20240503134452.3990465-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 13:44:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5693

Some networks limit outgoing git: traffic, so use https:.

Fixes: 0cec3e5 ("arm/gem5/boot-wrapper-aarch64: Move main recipe to meta-=
arm")
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 775f4064..d0605dd7 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -3,7 +3,7 @@ LICENSE =3D "BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster"
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster;protocol=3Dhttps"
 SRCREV =3D "d3b1a15d18542b2086e72bfdc3fc43f454772a3b"
=20
 # boot-wrapper doesn't make releases
--=20
2.34.1


