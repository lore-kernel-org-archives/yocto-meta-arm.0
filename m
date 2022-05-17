Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4FEC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 12:28:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6611.1652790502441595790
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 05:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 889A31042;
	Tue, 17 May 2022 05:28:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177363F66F;
	Tue, 17 May 2022 05:28:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-toolchain/external-arm-toolchain: set the version in
 the recipe
Date: Tue, 17 May 2022 13:28:16 +0100
Message-Id: <20220517122818.3324458-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 12:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3414

We need to support multiple versions of external-arm-toolchain, partly as
different versions have different layouts on disk, and partly because
11.2 doesn't work on pre-Broadwell hardware.

Rename this recipe so the version is in the filename, and dynamically
set PKGV instead of PV so PREFERRED_VERSION is easier to use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-arm-toolchain.bb =3D> external-arm-toolchain_11.2-2022.02.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{exter=
nal-arm-toolchain.bb =3D> external-arm-toolchain_11.2-2022.02.bb} (99%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain_11.2-2022.02.bb
similarity index 99%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ex=
ternal-arm-toolchain.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exte=
rnal-arm-toolchain_11.2-2022.02.bb
index dcc8ebf0..0b2d3238 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain_11.2-2022.02.bb
@@ -51,7 +51,7 @@ PROVIDES +=3D "\
 	virtual/libc-locale \
 "
=20
-PV =3D "${EAT_VER_MAIN}"
+PKGV =3D "${EAT_VER_MAIN}"
=20
 BINV =3D "${EAT_VER_GCC}"
=20
--=20
2.25.1


