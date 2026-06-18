Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43869CD98FA
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18999.1781787561741591774
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vGndmG2P;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99877293B
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BED93F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787561; bh=qV0BSyA7f1A/XAzwVttTxH6pl+VS2AdiiXzd8v1ESLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vGndmG2PTM1/uCUq7IRDJ56aqpnJDA2O8E3NhbuAsW3G+10YJNTFAHtsGx5gdG1kg
	 vQ4rPraROQGxP6WpZx4vy80sRuf1K5sRtrRg0WUG62HKrfJuYy5Gj/XHBEN9OrWBLa
	 u2DFE58D8NwkqLS289SQz2p/2mHX1uN5VaOphgKg=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/trusted-firmware-a: Update git recipe to the latest commit
Date: Thu, 18 Jun 2026 08:59:15 -0400
Message-ID: <20260618125918.62619-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7088

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_git.bb    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 6d7f7c3e428a..517ca34aa418 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -1,17 +1,12 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A master, tag: v2.14
-SRCREV_tfa =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
-SRCBRANCH =3D "master"
+# TF-A integration branch, current commit
+SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
+SRCREV_tfa =3D "abead3308de3eb2d89a5ce3fe264ea829f87648c"
+SRCBRANCH =3D "integration"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
=20
-# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.5
-SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
-
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
 # Not a release recipe, try our hardest to not pull this in implicitly
--=20
2.50.1 (Apple Git-155)


