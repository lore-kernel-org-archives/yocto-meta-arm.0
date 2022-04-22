Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4D5C4727C
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6499.1650621396707810698
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 02:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5D951477
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 02:56:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5055E3F766
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 02:56:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain/gcc-aarch64-none-elf: remove redundant
 LIC_FILES_CHKSUM
Date: Fri, 22 Apr 2022 10:56:32 +0100
Message-Id: <20220422095632.3420773-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3280

Setting LIC_FILES_CHKSUM with some anonymous Python to dynamically fetch
the right checksum is pointless when the right values are assigned with
overrides in the first place.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
index 02b5b43b..ef5c0628 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.3-2021.07.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_10.3-2021.07.bb
@@ -8,7 +8,6 @@ COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
=20
-LIC_FILES_CHKSUM =3D "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH=
}"))}"
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dd0=
6ace534ed0851debcb7140c5b5116e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3De4b=
cb5bee0c4a50c06704b0b73fcbe0c"
=20
--=20
2.25.1


