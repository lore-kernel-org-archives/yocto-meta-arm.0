Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F0BC4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 16:24:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.479.1636561459070748584
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 08:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB6513A1
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA9363F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 08:24:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/python3-imgtool: remove,
 this is now in meta-python
Date: Wed, 10 Nov 2021 16:24:12 +0000
Message-Id: <20211110162414.3428096-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110162414.3428096-1-ross.burton@arm.com>
References: <20211110162414.3428096-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 16:24:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2358

A newer version of this recipe is now in meta-python[1]

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3D94fc0589b=
50f43afd1a19303a40389652929bf38

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../corstone1000-imgtool/python3-imgtool_1.7.1.bb  | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-devtool/corstone1000-imgtool/pyt=
hon3-imgtool_1.7.1.bb

diff --git a/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-im=
gtool_1.7.1.bb b/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python=
3-imgtool_1.7.1.bb
deleted file mode 100644
index 06d52d09..00000000
--- a/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1=
.7.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "MCUboot's image signing and key management"
-LICENSE =3D "Apache-2.0"
-AUTHOR =3D "The MCUboot committers <mcuboot@groups.io>, \
-          Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>"
-
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;md5=3De32b214fd9c204b77a99a97aa903=
757b"
-
-SRC_URI[md5sum] =3D "de0005dc13ce9e5e6aecdedfd0956286"
-
-DEPENDS:corstone1000 =3D "python3-cryptography python3-intelhex python3-=
click python3-cbor"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


