Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3393C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:18:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8939.1639649912649695763
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 02:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61EFF1474
	for <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 02:18:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D8ED3F774
	for <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 02:18:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] trusted-firmware-a: move corstone1000 to TF-A 2.6
Date: Thu, 16 Dec 2021 10:18:28 +0000
Message-Id: <20211216101828.3239975-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 10:18:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2728

Now that we have a TF-A 2.6 recipe there is no need to use a post-2.5
git snapshot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc        | 1 -
 .../trusted-firmware-a-corstone1000.inc                   | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 6684c726..f9d301e4 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -4,7 +4,6 @@ MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 1a5bdd0c..2646259f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -2,14 +2,6 @@
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
-
-# TF-A master branch post 2.5 with all Corstone1000 patches merged
-SRCREV_tfa =3D "459b24451a0829460783ce8dfa15561e36d901d8"
-PV =3D "2.5+git${SRCPV}"
-
-LIC_FILES_CHKSUM=3D"file://docs/license.rst;md5=3Db2c740efedc159745b9b31=
f88ff03dde file://mbedtls/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
                  file://0001-Rename-Diphda-to-corstone1000.patch \
--=20
2.25.1


