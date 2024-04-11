Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C84CD1299
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17274.1712840388855805644
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2105F1596
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D5C43F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:48 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/opencsd: update to 1.5.2
Date: Thu, 11 Apr 2024 08:59:46 -0400
Message-Id: <20240411125947.64959-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240411125947.64959-1-jon.mason@arm.com>
References: <20240411125947.64959-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5523

Update to the latest stable version (1.5.2), comprised of the following
commits:
	5d86f27a8c0a opencsd: Update version info and README for 1.5.2
	71c50dda716f build: win: Fix name for ocsd-perr utility in windows build
	599551d3ea09 opencsd: docs: Update docs for test programs
	769faaa6368a opencsd: docs: Update trc_pkt_lister man file
	b957577e71bf tests: Fix typo in trc_pkt_lister help output
	dca84a74a0d5 build: Fix clean of mem_acc_test
	85fd025eed35 opencsd: stm: Fix build warning in 64 bit build of STM
	2145b81b4b61 opencsd: etmv4: Fix build warning on decoder
	169cc07d3625 docs: Fix formatting in README.md

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.5.1.bb =3D> opencsd_1.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.5.1.bb =3D> opencsd_=
1.5.2.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.1.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.5.2.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.5.1.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.5.2.bb
index 5f838557db9f..cc55a3633a4f 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.1.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.2.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "c16418833b5d7cbcbcb4e2a2d917ad0147efb2be"
+SRCREV =3D "5d86f27a8c0af16a473833da3a0936cd2a0999d3"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.3 (Apple Git-146)


