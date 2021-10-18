Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB85C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 11:22:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34760.1634556148398476319
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 04:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D019ED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 04:22:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBB683F73D
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 04:22:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5/gem5-native: add missing m4-native DEPENDS
Date: Mon, 18 Oct 2021 12:22:17 +0100
Message-Id: <20211018112217.1483739-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 11:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2274

Latest oe-core has less implicit DEPENDS, so gem5 fails to configure:

Error: Can't find version of M4 macro processor.  Please install M4 and t=
ry again.

Explicitly add m4-native to DEPENDS.

Change-Id: I2e107ea6448eec399619e0d1922fd29930a95fd8
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/=
recipes-devtools/gem5/gem5-native.inc
index a719f726..74b35c98 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -28,7 +28,7 @@ inherit scons native
 # google protobuf
 # pkgconfig
 # hdf5
-DEPENDS +=3D "python3-six-native protobuf-native hdf5-native pkgconfig-n=
ative \
+DEPENDS +=3D "m4-native python3-six-native protobuf-native hdf5-native p=
kgconfig-native \
     boost-native libpng-native"
=20
 EXTRA_OESCONS =3D "${GEM5_SCONS_ARGS}"
--=20
2.25.1


