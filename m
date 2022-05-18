Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EE2C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 11:07:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3567.1652872051888851924
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 04:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6725323A;
	Wed, 18 May 2022 04:07:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBCCA3F718;
	Wed, 18 May 2022 04:07:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] Revert "arm-toolchain/external-arm-toolchain: set the
 version in the recipe"
Date: Wed, 18 May 2022 12:07:27 +0100
Message-Id: <20220518110727.3460305-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518110727.3460305-1-ross.burton@arm.com>
References: <20220518110727.3460305-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 11:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3427

This reverts commit ac83feb7cd16265d4e8ee0ed50dba903306867e5.
---
 ...-arm-toolchain_11.2-2022.02.bb =3D> external-arm-toolchain.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{exter=
nal-arm-toolchain_11.2-2022.02.bb =3D> external-arm-toolchain.bb} (99%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtoo=
ls/external-arm-toolchain/external-arm-toolchain.bb
similarity index 99%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ex=
ternal-arm-toolchain_11.2-2022.02.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exte=
rnal-arm-toolchain.bb
index 0b2d3238..dcc8ebf0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain_11.2-2022.02.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -51,7 +51,7 @@ PROVIDES +=3D "\
 	virtual/libc-locale \
 "
=20
-PKGV =3D "${EAT_VER_MAIN}"
+PV =3D "${EAT_VER_MAIN}"
=20
 BINV =3D "${EAT_VER_GCC}"
=20
--=20
2.25.1


