Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734CAC001DE
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.68201.1691516137669217237
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 940B81FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:36:19 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E53C73F59C
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:35:36 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/6] arm-toolchain/gcc-aarch64-none-elf: upgrade to 12.3.rel1
Date: Tue,  8 Aug 2023 12:35:23 -0500
Message-Id: <20230808173528.3606903-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4942

Upgrade the 12.2 recipe to 12.3.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...one-elf_12.2.rel1.bb =3D> gcc-aarch64-none-elf_12.3.rel1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
arch64-none-elf_12.2.rel1.bb =3D> gcc-aarch64-none-elf_12.3.rel1.bb} (82%=
)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_12.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_12.3.rel1.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-aarch64-none-elf_12.2.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
aarch64-none-elf_12.3.rel1.bb
index db8851eb..7d06f291 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_12.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_12.3.rel1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D0aef214b835259
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "570a9bd42e2067d79d59b0747891681ebec6=
6f30d989d17a05856563fe38f78b"
-SRC_URI[gcc-x86_64.sha256sum] =3D "62d66e0ad7bd7f2a183d236ee301a5c73c737=
c886c7944aa4f39415aab528daf"
+SRC_URI[gcc-aarch64.sha256sum] =3D "76ba68db4390b50f0a16386c6a011ec611a3=
5a517ae40b7be008ca7920cfa59f"
+SRC_URI[gcc-x86_64.sha256sum] =3D "382c8c786285e415bc0ff4df463e101f76d6f=
69a894b03f132368147c37f0ba7"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.30.2


