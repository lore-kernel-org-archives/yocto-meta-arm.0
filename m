Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5701C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:45:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46812.1737560706054335982
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 07:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3952A1063
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 07:45:34 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9550A3F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 07:45:05 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: Move 2.11 to meta-arm-bsp
Date: Wed, 22 Jan 2025 10:45:04 -0500
Message-Id: <20250122154504.42280-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250122154504.42280-1-jon.mason@arm.com>
References: <20250122154504.42280-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 15:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6341

Move v2.11 to meta-arm-bsp so that corstone1000 can still use it (though
2.12 does appear to work).  Move all the other platforms in meta-arm-bsp
to use 2.12.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf                     | 2 --
 meta-arm-bsp/conf/machine/sgi575.conf                       | 2 --
 .../trusted-firmware-a/trusted-firmware-a-fvp-base.inc      | 6 ++++++
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc        | 6 ++++++
 .../trusted-firmware-a/trusted-firmware-a_2.11.0.bb         | 0
 5 files changed, 12 insertions(+), 4 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-a/trust=
ed-firmware-a_2.11.0.bb (100%)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index b69995256008..03896a347184 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -20,8 +20,6 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 # FIXME -  This is being upstreamed.  Remove once that has occurred.
 KERNEL_CONSOLE ?=3D "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[=
0].split(';')[::-1]) or 'ttyS0'}"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
-
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
 KERNEL_DEVICETREE =3D "arm/${KERNEL_DTB_NAME}"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index e905c4293792..3c2c94b6dcbf 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -6,8 +6,6 @@
=20
 require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
-
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index a5d1ee53515b..4f0d34ea09b5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -62,3 +62,9 @@ EXTRA_OEMAKE +=3D "FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-=
1t FVP_USE_GIC_DRIVER=3DFVP_GIC
=20
 # Our fvp-base machine explicitly has v8.4 cores
 EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
+
+# If GENERATE_COT is set, then tf-a will try to use local poetry install
+# to run the python cot-dt2c command.  Disable the local poetry and use
+# the provided cot-dt2c.
+EXTRA_OEMAKE +=3D "POETRY=3D''"
+DEPENDS +=3D "cot-dt2c-native"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index 20904b34cb78..01cc67bb32e3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -11,3 +11,9 @@ TFA_UEFI           =3D "1"
=20
 EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
+
+# If GENERATE_COT is set, then tf-a will try to use local poetry install
+# to run the python cot-dt2c command.  Disable the local poetry and use
+# the provided cot-dt2c.
+EXTRA_OEMAKE +=3D "POETRY=3D''"
+DEPENDS +=3D "cot-dt2c-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.11.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.11.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
11.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.11.0.bb
--=20
2.39.5 (Apple Git-154)


