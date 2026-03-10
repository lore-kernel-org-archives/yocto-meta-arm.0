Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BDDEB1058
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:19:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41101.1773152388632402877
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 07:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB61F169C
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:19:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9180D3F7BD
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:19:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-services: upgrade in-tree nanopb
Date: Tue, 10 Mar 2026 14:19:42 +0000
Message-ID: <20260310141943.1590585-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 14:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6944

Trusted Services uses nanopb 0.4.8 but this imports pkg_resources from
setuptools, which has been deprecated since 2023[1] and was finally
removed in setuptools 82.

This was fixed in nanopb some time ago[2] so upgrade the recipe from
nanopb 0.48 to 0.49.1.

[1] https://setuptools.pypa.io/en/latest/deprecated/pkg_resources.html
[2] https://github.com/nanopb/nanopb/commit/7961a939ebeeb27631c6def44f345=
2522264c64b

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/trusted-services-src.inc               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 7638a3ea67..22cc76ef25 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -22,9 +22,9 @@ SRC_URI_TRUSTED_SERVICES_MBEDTLS =3D "gitsm://github.co=
m/Mbed-TLS/mbedtls;protocol
 SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 LIC_FILES_CHKSUM +=3D "file://ts-external/mbedtls/LICENSE;md5=3D379d5819=
937a6c2f1ef1630d341e026d"
=20
-# Nanopb, tag "nanopb-0.4.8" plus some further fixes
-SRC_URI_TRUSTED_SERVICES_NANOPB =3D "git://github.com/nanopb/nanopb.git;=
protocol=3Dhttps;branch=3Dmaster"
-SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
+# Nanopb, tag "nanopb-0.4.9.1"
+SRC_URI_TRUSTED_SERVICES_NANOPB =3D "git://github.com/nanopb/nanopb.git;=
protocol=3Dhttps;branch=3Dmaintenance_0.4"
+SRCREV_nanopb =3D "cad3c18ef15a663e30e3e43e3a752b66378adec1"
 LIC_FILES_CHKSUM +=3D "file://ts-external/nanopb/LICENSE.txt;md5=3D9db4b=
73a55a3994384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
--=20
2.43.0


