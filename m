Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46E3C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.34015.1635176533217827473
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F9C51063
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B48F3F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/trusted-firmware-a: remove obsolete TF-A 1.5
Date: Mon, 25 Oct 2021 16:42:04 +0100
Message-Id: <20211025154207.2061343-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025154207.2061343-1-ross.burton@arm.com>
References: <20211025154207.2061343-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 15:42:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2298

TF-A 1.5 is very old, remove. People who still need 1.5 will likely be
using older releases.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_1.5.bb                 | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_1.5.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
deleted file mode 100644
index 56d3507e..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Trusted firmware-A 1.5
-#
-
-require trusted-firmware-a.inc
-
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
-# TF-A v1.5
-SRCREV_tfa =3D "ed8112606c54d85781fc8429160883d6310ece32"
-
-LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3De927e02bca647e14efd87e9e=
914b2443"
-
-#
-# mbed TLS source
-# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-#
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.16"
-
-# mbed TLS v2.16.2
-SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D " \
-    file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
-    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
-    "
--=20
2.25.1


