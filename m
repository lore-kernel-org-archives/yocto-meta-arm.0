Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DFDCE7A9A
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 15:52:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.64487.1695657125236612176
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 08:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ECC21424;
	Mon, 25 Sep 2023 08:52:43 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 395983F59C;
	Mon, 25 Sep 2023 08:52:04 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: Fix BL32 path if usrmerge enabled
Date: Mon, 25 Sep 2023 16:51:40 +0100
Message-Id: <20230925155140.133001-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925155140.133001-1-adam.johnston@arm.com>
References: <20230925155140.133001-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Sep 2023 15:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5072

From: Adam Johnston <adam.johnston@arm.com>

The optee recipe installs the tee image using `${nonarch_base_libdir}`
If usrmerge is enabled this is `/usr/lib`, otherwise it is `/lib`

Several platforms (corstone1000, n1sdp, tc) look for tee-pager_v2.bin in
the hard-coded `/lib/firmware`, hence if usrmerge is enabled it won't be
found.

Fix these platforms by using `${nonarch_base_libdir}` instead of `/lib`
as per the qemu platform code in the generic recipe.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc      | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 3f66bed5..5b15247d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -39,6 +39,6 @@ EXTRA_OEMAKE:append =3D " \
                         COT=3Dtbbr \
                         ARM_ROTPK_LOCATION=3Ddevel_rsa  \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
-                        BL32=3D${RECIPE_SYSROOT}/lib/firmware/tee-pager_=
v2.bin \
+                        BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
                         LOG_LEVEL=3D50 \
                         "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index c2fa223c..900decc2 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -36,6 +36,6 @@ EXTRA_OEMAKE:append =3D "\
 		    CREATE_KEYS=3D1 \
 		    ARM_ROTPK_LOCATION=3D"devel_rsa" \
 		    ROT_KEY=3D"${TFA_ROT_KEY}" \
-		    BL32=3D${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
+		    BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager=
_v2.bin \
 		    BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin \
 		    "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index e17a8f59..c14629fd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -27,7 +27,7 @@ EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3D${TFA_TARGET_PLATF=
ORM}"
 # Set optee as SP. Set spmc manifest and sp layout file to optee
 DEPENDS +=3D "optee-os"
=20
-TFA_SP_LAYOUT_FILE =3D "${RECIPE_SYSROOT}/lib/firmware/sp_layout.json"
+TFA_SP_LAYOUT_FILE =3D "${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmwar=
e/sp_layout.json"
 TFA_ARM_SPMC_MANIFEST_DTS =3D "plat/arm/board/tc/fdts/tc_spmc_optee_sp_m=
anifest.dts"
=20
 EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
--=20
2.25.1


