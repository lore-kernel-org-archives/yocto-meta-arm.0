Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7E4C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5880.1643041804278533142
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D97D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8190C3F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp/optee-os: use SRCPV in the corstone1000 overrides
Date: Mon, 24 Jan 2022 16:29:46 +0000
Message-Id: <20220124162947.3796440-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124162947.3796440-1-ross.burton@arm.com>
References: <20220124162947.3796440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2896

corstone1000 currently has a git snapshot of optee-os, so that the
version number is managable use SRCPV instead of SRCREV.

Also fix whitespace in SRC_URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-os_corstone1000_common.inc   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_comm=
on.inc
index 6e81316b..e17467fe 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.in=
c
@@ -1,6 +1,6 @@
 SRC_URI =3D "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=3D=
https;branch=3Dpsa-development"
 SRCREV =3D "f9de2c9520ed97b89760cc4c99424aae440b63f4"
-PV .=3D "+git${SRCREV}"
+PV .=3D "+git${SRCPV}"
=20
 DEPENDS +=3D "python3-pycryptodomex-native dtc-native"
=20
@@ -10,7 +10,7 @@ SRC_URI:append =3D " \
                   file://0001-plat-corstone1000-add-corstone1000-platfor=
m.patch \
                   file://0002-plat-corstone1000-reserve-3MB-CVM-memory-f=
or-optee.patch \
                   file://0003-plat-corstone1000-add-a-rule-in-Makefile-t=
o-SP_MAKEF.patch \
-		  file://0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch \
+                  file://0004-plat-corstone1000-increase-OPTEE-core-heap=
-size.patch \
                   file://0005-Fix-add-missing-error-check-during-SP-init=
.patch \
                    "
=20
--=20
2.25.1


