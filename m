Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A04C25B10
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:03:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19687.1714492993114419729
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1E6113E;
	Tue, 30 Apr 2024 09:03:39 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16A253F73F;
	Tue, 30 Apr 2024 09:03:11 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 3/3] arm/trusted-services: remove OpenAMP and Libmetal
Date: Tue, 30 Apr 2024 18:03:01 +0200
Message-Id: <20240430160301.802105-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430160301.802105-1-bence.balogh@arm.com>
References: <20240430160301.802105-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5664

From: Bence Balogh <bence.balogh@arm.com>

Corstone-1000 no longer uses OpenAMP, and it was the only platform
which needed this library.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../trusted-services/trusted-services-src.inc      | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 6b193b33..e05aadd7 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -48,17 +48,7 @@ SRC_URI +=3D "git://github.com/cpputest/cpputest.git;n=
ame=3Dcpputest;protocol=3Dhttps;
 SRCREV_cpputest =3D "e25097614e1c4856036366877a02346c4b36bb5b"
 LIC_FILES_CHKSUM +=3D "file://../cpputest/COPYING;md5=3Dce5d5f1fe02bcd13=
43ced64a06fd4177"
=20
-# Libmetal
-SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;name=3Dlibmetal;prot=
ocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/libmetal"
-SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
-LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
-
-# Openamp
-SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;name=3Dopenamp;proto=
col=3Dhttps;branch=3Dmain;destsuffix=3Dgit/openamp"
-SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
-LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf=
9936a1e1413585ecbf"
-
-SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est_libmetal_openamp"
+SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est"
=20
 inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
@@ -84,6 +74,4 @@ EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/git/d=
tc \
                   -DT_COSE_SOURCE_DIR=3D${WORKDIR}/git/tcose \
                   -DQCBOR_SOURCE_DIR=3D${WORKDIR}/git/qcbor \
                   -DMBEDTLS_SOURCE_DIR=3D${WORKDIR}/git/mbedtls \
-                  -DOPENAMP_SOURCE_DIR=3D${WORKDIR}/git/openamp \
-                  -DLIBMETAL_SOURCE_DIR=3D${WORKDIR}/git/libmetal \
                  "
--=20
2.25.1


