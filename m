Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C4EC19F53
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 16:39:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26511.1714408745783953545
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 09:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C06339;
	Mon, 29 Apr 2024 09:39:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9C53F762;
	Mon, 29 Apr 2024 09:39:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 3/5] external-arm-toolchain: ignore warnings about 32-bit time types
Date: Mon, 29 Apr 2024 16:38:57 +0000
Message-Id: <20240429163859.507226-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429163859.507226-1-ross.burton@arm.com>
References: <20240429163859.507226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 16:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5628

Functions that take 32-bit time_t types are unavoidable in the libc, so
ignore the warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index fab17611..49ad7442 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -316,6 +316,7 @@ PACKAGES +=3D "\
 	${PN}-staticdev \
 "
=20
+INSANE_SKIP +=3D " 32bit-time"
 INSANE_SKIP:${PN}-dbg =3D "staticdev"
 INSANE_SKIP:${PN}-utils +=3D "ldflags"
 INSANE_SKIP:libstdc++ +=3D "ldflags"
--=20
2.34.1


