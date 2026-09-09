Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6A2C79FBF
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:03:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19170.1788977028817273842
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 11:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oGaFn42M;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895F51595
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC0733F528
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788977028; bh=wnXslB2qMvPW0o1PM6h8qg61S0eiH9HUon9AJgEvGSM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oGaFn42MZC1cE8w9Pwbp8Ubk19IyHVrQEzOGgcdEyqjerfQodfBTH1JwXLdHxdE9j
	 wceofpCPD0lWLGJFLaj8TM6ciOJAtCSn+UTov2ucck6qMF8dfGe1NkVDLNec5KaEDG
	 K05TsHopM2ebmitsO6xjQitc1RNlxtcPwBHW98zQ=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/fiptool: fix native linkage
Date: Wed,  9 Sep 2026 19:03:41 +0100
Message-ID: <20260909180341.3858400-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909180341.3858400-1-ross.burton@arm.com>
References: <20260909180341.3858400-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Sep 2026 18:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7164

The Makefiles in TF-A have changed since this recipe was last altered,
and our BUILD_LDFLAGS are no longer being respected. This means the built
objects don't have the correct RPATH, so they fail to run if the host
doesn't have libcrypto.so.4 (from OpenSSL 4) installed.

Pass all of our BUILD_* flags via HOSTCC*, and delete the now redundant
sed operations.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/fiptool-native_2.15.0.bb       | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.0.bb
index 11e54fbf06e..8292eefcec3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.15.0.bb
@@ -17,14 +17,13 @@ DEPENDS +=3D "openssl-native"
=20
 inherit native
=20
-EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
+EXTRA_OEMAKE =3D "V=3D1 \
+    HOSTCC=3D'${BUILD_CC}' \
+    HOSTCCFLAGS=3D'${BUILD_CPPFLAGS} ${BUILD_CFLAGS}' \
+    HOSTLDFLAGS=3D'${BUILD_LDFLAGS}' \
+    OPENSSL_DIR=3D${STAGING_DIR_NATIVE}/${prefix_native}"
=20
 do_compile () {
-    # This is still needed to have the native fiptool executing properly=
 by
-    # setting the RPATH
-    sed -i '/^LDOPTS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
-
     oe_runmake fiptool
 }
=20
--=20
2.43.0


