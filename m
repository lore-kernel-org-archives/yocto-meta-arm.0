Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0CEC433FE
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:56:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1389.1636646169180209895
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 07:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6311435
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A0203F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm-bsp/trusted-firmware-m: clean up corestone1000
 do_install
Date: Thu, 11 Nov 2021 15:56:00 +0000
Message-Id: <20211111155601.2516005-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155601.2516005-1-ross.burton@arm.com>
References: <20211111155601.2516005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 15:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2367

No point checking that a directory exists before installing from it, as
it will fail immediately anyway if the files are not present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 62f5998e..530968c3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -21,11 +21,6 @@ do_prepare_recipe_sysroot[depends]+=3D "virtual/truste=
d-firmware-a:do_populate_sys
 require trusted-firmware-m-sign-host-images.inc
=20
 do_install() {
-  if [ ! -d "${B}/install/outputs/ARM/CORSTONE1000" ]
-  then
-    bbfatal "'${B}/install/outputs/ARM/CORSTONE1000' output folder not f=
ound!"
-  fi
-
   install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/tfm_s_sign=
ed.bin ${D}/firmware/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl2_signed=
.bin ${D}/firmware/bl2_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl1.bin ${=
D}/firmware/bl1.bin
@@ -41,5 +36,4 @@ do_install() {
       ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY}
=20
   sign_host_image ${TFA_FIP_BINARY} ${RECIPE_SYSROOT}/firmware ${TFA_FIP=
_RE_IMAGE_LOAD_ADDRESS} ${TFA_FIP_RE_SIGN_BIN_SIZE}
-
 }
--=20
2.25.1


