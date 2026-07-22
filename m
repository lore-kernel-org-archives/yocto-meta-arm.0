Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67CFC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 14:02:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.427.1784728945587032716
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 07:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dxga/OKd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C78BD1595
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 07:02:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 912013F59E
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784728944; bh=w/Q9cJY5zH93OX9YzZg2Y9iNd9xUQXIi5F+/anAFlhQ=;
	h=From:To:Subject:Date:From;
	b=dxga/OKdkL6TK0/nOm0pJhy5Aiz6cnweAjLZEAMW8wHKl15+l+uo4NUBcxMWOpkC5
	 wKGF5C9/g+iXKakn+ClnYqTIU4xHK0/0RgmID889zREqzw9n9uy3+96L6kjvoo68Nc
	 tWQD7CYsklbo/Fo5Vm7x1LuG4aMtgzgboD1lGric=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/2] arm-toolchain/external-arm-toolchain: fix license
Date: Wed, 22 Jul 2026 15:02:19 +0100
Message-ID: <20260722140220.1882878-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 14:02:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7128

Part of the GCC license is -only, not -or-later.  Thanks to Denys
Dmytriyenko and Joshua Watt for their diligent review.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb    | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb
index 05d6a9f952..7bca316daa 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
 COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none=
-elf)"
-LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
+LICENSE =3D "GPL-3.0-only AND GPL-3.0-or-later WITH GCC-exception-3.1"
=20
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb
index db7a5dffa2..53c29f5f56 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
 COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
-LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
+LICENSE =3D "GPL-3.0-only AND GPL-3.0-or-later WITH GCC-exception-3.1"
=20
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
--=20
2.43.0


