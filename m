Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDC7C001DF
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4385.1689729766482569076
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A3511FB;
	Tue, 18 Jul 2023 18:23:29 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 003423F67D;
	Tue, 18 Jul 2023 18:22:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 3/8] toolchain: remove pointless provides
Date: Tue, 18 Jul 2023 20:22:35 -0500
Message-Id: <20230719012240.3567881-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4895

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_12.2.rel1.bb    | 2 --
 .../external-arm-toolchain/gcc-arm-none-eabi_12.2.rel1.bb       | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_12.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_12.2.rel1.bb
index b3b09bae..db8851eb 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_12.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_12.2.rel1.bb
@@ -11,8 +11,6 @@ LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D0a=
ef214b835259b64f026f4ad00c703e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
=20
-PROVIDES =3D "virtual/aarch64-none-elf-gcc"
-
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
 SRC_URI[gcc-aarch64.sha256sum] =3D "570a9bd42e2067d79d59b0747891681ebec6=
6f30d989d17a05856563fe38f78b"
 SRC_URI[gcc-x86_64.sha256sum] =3D "62d66e0ad7bd7f2a183d236ee301a5c73c737=
c886c7944aa4f39415aab528daf"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_12.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_12.2.rel1.bb
index 948933b9..48ddd163 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_12.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_12.2.rel1.bb
@@ -11,8 +11,6 @@ LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D0a=
ef214b835259b64f026f4ad00c703e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
=20
-PROVIDES =3D "virtual/arm-none-eabi-gcc"
-
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
 SRC_URI[gcc-aarch64.sha256sum] =3D "7ee332f7558a984e239e768a13aed86c6c3a=
c85c90b91d27f4ed38d7ec6b3e8c"
 SRC_URI[gcc-x86_64.sha256sum] =3D "84be93d0f9e96a15addd490b6e237f588c641=
c8afdf90e7610a628007fc96867"
--=20
2.30.2


