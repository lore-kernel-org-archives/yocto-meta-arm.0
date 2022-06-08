Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88254C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4376.1654679802558968547
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 02:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30086143D;
	Wed,  8 Jun 2022 02:16:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79DC43F66F;
	Wed,  8 Jun 2022 02:16:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-toolchain/gcc-aarch64-none-elf: upgrade to 11.2
Date: Wed,  8 Jun 2022 10:16:36 +0100
Message-Id: <20220608091637.109635-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608091637.109635-1-ross.burton@arm.com>
References: <20220608091637.109635-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 09:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3481

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...21.07.bb =3D> gcc-aarch64-none-elf_11.2-2022.02.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_10.3-2021.07.bb =3D> gcc-aarch64-none-elf_11.2-2022.02.bb=
} (63%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
similarity index 63%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_10.3-2021.07.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_11.2-2022.02.bb
index ef5c0628..2a5a4efb 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.3-2021.07.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_11.2-2022.02.bb
@@ -5,17 +5,17 @@ require arm-binary-toolchain.inc
=20
 COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
-SUMMARY =3D "Baremetal GCC for Aarch64 processors"
+SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none=
-elf)"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dd0=
6ace534ed0851debcb7140c5b5116e"
-LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3De4b=
cb5bee0c4a50c06704b0b73fcbe0c"
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dbe=
4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D1f0=
7179249795891179bb3798bac7887"
=20
 PROVIDES =3D "virtual/aarch64-none-elf-gcc"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${P=
V}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgnu-a-${HOS=
T_ARCH}"
-SRC_URI[gnu-a-aarch64.sha256sum] =3D "768a5db41d93f48838f1c4bfeae26930df=
2320c09f0dfa798321082fb937955f"
-SRC_URI[gnu-a-x86_64.sha256sum] =3D "6f74b1ee370caeb716688d2e467e5b44727=
fdc0ed56023fe5c72c0620019ecef"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_AR=
CH}"
+SRC_URI[gcc-aarch64.sha256sum] =3D "3b15725545a0211a17b63e72d4f10241f7ff=
be7ce94cb9612590ceacde16992c"
+SRC_URI[gcc-x86_64.sha256sum] =3D "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d5=
4f93df3bf47378485b0ba8b828b"
=20
 S =3D "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.25.1


