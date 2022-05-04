Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5546C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:13:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6991.1651673578407425048
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19AEA1042;
	Wed,  4 May 2022 07:12:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969323F85F;
	Wed,  4 May 2022 07:12:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-toolchain/arm-binary-toolchain: ensure toolchains
 don't provide any system libraries
Date: Wed,  4 May 2022 15:12:52 +0100
Message-Id: <20220504141254.785384-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 14:13:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3354

Use PRIVATE_LIBS to ensure that the Arm binary toolchains don't provide
their own libraries to the entire system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index 1fa4cd3e..528b0061 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -20,4 +20,7 @@ INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
=20
+# Need to mark these as private until do_package's soname-finder only lo=
oks in $libdir
+PRIVATE_LIBS =3D "libgcc_s.so.1 libstdc++.so.6"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


