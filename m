Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D08C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 13:26:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11354.1638537970338999812
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 05:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE63F1477
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Dec 2021 05:26:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64B983F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Dec 2021 05:26:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/3] arm/edk2-firmware: correctly set the target prefix in
 Clang builds
Date: Fri,  3 Dec 2021 13:26:05 +0000
Message-Id: <20211203132607.2648640-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 13:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2526

We set GCC5_AARCH64_PREFIX so the tools are prefixed correctly in GCC
builds, but didn't set CLANG38_AARCH64_PREFIX. This meant the clang build
used the host objcopy, which may not know about the target architecture.

Also these can just be the prefix and not a full path, as the binaries
are on $PATH.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 7072d1b4..cfe30652 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -58,7 +58,6 @@ LDFLAGS[unexport] =3D "1"
 do_configure[cleandirs] +=3D "${B}"
=20
 # Set variables as per envsetup
-export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PRE=
FIX}"
 export PACKAGES_PATH       =3D "${S}:${S}/edk2-platforms"
 export WORKSPACE           =3D "${B}"
 export EDK_TOOLS_PATH      =3D "${S}/BaseTools"
@@ -68,7 +67,10 @@ export CONF_PATH           =3D "${S}/Conf"
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
=20
 EDK_COMPILER ?=3D "GCC5"
+export GCC5_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
+
 EDK_COMPILER:toolchain-clang =3D "CLANG38"
+export CLANG38_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
=20
 do_configure:prepend() {
     sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" $=
{S}/BaseTools/Conf/tools_def.template
--=20
2.25.1


