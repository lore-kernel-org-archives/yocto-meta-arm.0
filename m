Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DACE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 15:26:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21210.1736522797324390526
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 07:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EC921E32;
	Fri, 10 Jan 2025 07:27:05 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C60783F59E;
	Fri, 10 Jan 2025 07:26:36 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH 2/3] arm/trusted-firmware-a: add support for 2.12.0
Date: Fri, 10 Jan 2025 10:26:34 -0500
Message-Id: <20250110152635.99735-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250110152635.99735-1-jon.mason@arm.com>
References: <20250110152635.99735-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6314

From: Quentin Schulz <quentin.schulz@cherry.de>

Add support for TF-A version v2.12.0 and mbedtls 3.6.1.

GCC-compiled boot tested on RK3588 Tiger, RK3399 Puma and PX30 Ringneck.

0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch is merged in
2.12.0 so no need to have it in SRC_URI as for 2.11.0 and earlier
recipes.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  2 ++
 meta-arm-bsp/conf/machine/sgi575.conf         |  2 ++
 .../trusted-firmware-a_2.12.0.bb              | 19 +++++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.12.0.bb

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 03896a347184..b69995256008 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -20,6 +20,8 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 # FIXME -  This is being upstreamed.  Remove once that has occurred.
 KERNEL_CONSOLE ?=3D "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[=
0].split(';')[::-1]) or 'ttyS0'}"
=20
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
+
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
 KERNEL_DEVICETREE =3D "arm/${KERNEL_DTB_NAME}"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 3c2c94b6dcbf..e905c4293792 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -6,6 +6,8 @@
=20
 require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
=20
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
+
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.0.bb
new file mode 100644
index 000000000000..ceaac263fc75
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.b=
b
@@ -0,0 +1,19 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.12.0
+SRCREV_tfa =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
+SRCBRANCH =3D "master"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.1
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
+SRCREV_mbedtls =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
+
+# continue to boot also without TPM
+SRC_URI +=3D "\
+    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.pat=
ch \
+"
--=20
2.39.5 (Apple Git-154)


