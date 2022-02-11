Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D828C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:55:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5821.1644576944124809067
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2F8E1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 457403F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/linux-yocto: upgrade 5.4 to 5.4.178
Date: Fri, 11 Feb 2022 10:55:37 +0000
Message-Id: <20220211105539.2483533-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2979

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
index 0a67f878..99a16690 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -2,14 +2,14 @@ KBRANCH ?=3D "v5.4/standard/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
=20
-SRCREV_machine ?=3D "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_meta ?=3D "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+SRCREV_machine ?=3D "e2020dbe2ccaef50d7e8f37a5bf08c68a006a064"
+SRCREV_meta ?=3D "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-LINUX_VERSION ?=3D "5.4.139"
+LINUX_VERSION ?=3D "5.4.178"
=20
 DEPENDS +=3D "openssl-native util-linux-native"
=20
--=20
2.25.1


