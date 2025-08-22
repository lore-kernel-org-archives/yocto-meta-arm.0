Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2177CA0FE9
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9939.1755868695238445380
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895191A32;
	Fri, 22 Aug 2025 06:18:06 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 929933F63F;
	Fri, 22 Aug 2025 06:18:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Norbert Kocsis <norbert.kocsis@arm.com>
Subject: [PATCH 1/6] arm/trusted-services: Fix trusted-service license file paths
Date: Fri, 22 Aug 2025 09:18:08 -0400
Message-Id: <20250822131813.93724-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6674

From: Norbert Kocsis <norbert.kocsis@arm.com>

Use UNPACKDIR instead of relative paths.

Signed-off-by: Norbert Kocsis <norbert.kocsis@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-services/trusted-services-src.inc        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index e9235cf721d7..50e111172539 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -24,32 +24,32 @@ UPSTREAM_CHECK_COMMITS =3D "1"
 # DTC, tag "v1.6.1"
 SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Ddtc"
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
-LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/dtc/README.license;md5=3Da1eb=
22e37f09df5b5511b8a278992d0e"
=20
 # MbedTLS, tag "v3.6.0"
 SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
 SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1=
ef1630d341e026d"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581=
9937a6c2f1ef1630d341e026d"
=20
 # Nanopb, tag "nanopb-0.4.8" plus some further fixes
 SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dnanopb"
 SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
-LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/nanopb/LICENSE.txt;md5=3D9db4=
b73a55a3994384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
 SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dqcbor;=
protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dqcbor"
 SRCREV_qcbor =3D "56b17bf9f74096774944bcac0829adcd887d391e"
-LIC_FILES_CHKSUM +=3D "file://../qcbor/README.md;md5=3De8ff2e88a722cdc55=
eddd0bb9aeca002"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/qcbor/README.md;md5=3De8ff2e8=
8a722cdc55eddd0bb9aeca002"
=20
 # T_Cose
 SRC_URI +=3D "git://github.com/laurencelundblade/t_cose.git;name=3Dtcose=
;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtcose"
 SRCREV_tcose =3D "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f"
-LIC_FILES_CHKSUM +=3D "file://../tcose/LICENSE;md5=3Db2ebdbfb82602b97aa6=
28f64cf4b65ad"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/tcose/LICENSE;md5=3Db2ebdbfb8=
2602b97aa628f64cf4b65ad"
=20
 # CppUTest,  tag "v3.8"
 SRC_URI +=3D "git://github.com/cpputest/cpputest.git;name=3Dcpputest;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dcpputest"
 SRCREV_cpputest =3D "e25097614e1c4856036366877a02346c4b36bb5b"
-LIC_FILES_CHKSUM +=3D "file://../cpputest/COPYING;md5=3Dce5d5f1fe02bcd13=
43ced64a06fd4177"
+LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/cpputest/COPYING;md5=3Dce5d5f=
1fe02bcd1343ced64a06fd4177"
=20
 SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est"
=20
--=20
2.39.5 (Apple Git-154)


