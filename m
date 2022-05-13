Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F9DC433FE
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:12:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8640.1652451154576585576
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 07:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02F05143D;
	Fri, 13 May 2022 07:12:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DA0C3F5A1;
	Fri, 13 May 2022 07:12:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/5] arm-bsp/optee-os: set PV correctly for the corstone1000
 build
Date: Fri, 13 May 2022 15:12:27 +0100
Message-Id: <20220513141231.2513449-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 14:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3394

The corstone1000 build of optee-os has a bbappend which uses a specific
non-upstream branch of optee-os which is actually based on 3.10, so set
PV appropriately in the recipe and update the PREFERRED_VERSION in
corstone1000.inc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc            | 4 ++--
 .../recipes-security/optee/optee-os_corstone1000_common.inc   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 380ed30f..2f665d02 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -34,8 +34,8 @@ UBOOT_ARCH =3D "arm"
 UBOOT_EXTLINUX =3D "0"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "3.14%"
-PREFERRED_VERSION_optee-client ?=3D "3.14%"
+PREFERRED_VERSION_optee-os ?=3D "3.10.%"
+PREFERRED_VERSION_optee-client ?=3D "3.14.%"
 EXTRA_IMAGEDEPENDS +=3D "optee-os"
 OPTEE_ARCH =3D "arm64"
 OPTEE_BINARY =3D "tee-pager_v2.bin"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_comm=
on.inc
index e17467fe..9f372413 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.in=
c
@@ -1,6 +1,6 @@
 SRC_URI =3D "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=3D=
https;branch=3Dpsa-development"
 SRCREV =3D "f9de2c9520ed97b89760cc4c99424aae440b63f4"
-PV .=3D "+git${SRCPV}"
+PV =3D "3.10.0+git${SRCPV}"
=20
 DEPENDS +=3D "python3-pycryptodomex-native dtc-native"
=20
--=20
2.25.1


