Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B58BCCA47D
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 11:23:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16747.1655378576286920186
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 093C91474;
	Thu, 16 Jun 2022 04:22:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 757E33F73B;
	Thu, 16 Jun 2022 04:22:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-toolchain/external-arm-toolchain: remove pointless
 SUPPORTED file
Date: Thu, 16 Jun 2022 12:22:52 +0100
Message-Id: <20220616112252.3326107-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616112252.3326107-1-ross.burton@arm.com>
References: <20220616112252.3326107-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 11:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3509

This file isn't used, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb            | 2 --
 .../recipes-devtools/external-arm-toolchain/files/SUPPORTED     | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/files/SUPPORTED

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index dcc8ebf0..ae605aad 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -55,8 +55,6 @@ PV =3D "${EAT_VER_MAIN}"
=20
 BINV =3D "${EAT_VER_GCC}"
=20
-SRC_URI =3D "file://SUPPORTED"
-
 do_install() {
 	# Add stubs for files OE-core expects
 	install -d ${S}/nscd/
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/f=
iles/SUPPORTED b/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/files/SUPPORTED
deleted file mode 100644
index 9615075e..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SU=
PPORTED
+++ /dev/null
@@ -1 +0,0 @@
-POSIX
--=20
2.25.1


