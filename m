Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01836C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 14:56:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.118.1637074603253099587
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 06:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5201ED1
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 06:56:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8746A3F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 06:56:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/boot-wrapper-aarch64: specify precise BSD license
 flavour
Date: Tue, 16 Nov 2021 14:56:39 +0000
Message-Id: <20211116145639.3483446-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116145639.3483446-1-ross.burton@arm.com>
References: <20211116145639.3483446-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 14:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2411

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 8f4b9653..2251eff1 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Linux aarch64 boot wrapper with FDT support"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
--=20
2.25.1


