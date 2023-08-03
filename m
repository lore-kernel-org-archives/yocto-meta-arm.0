Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6331CC41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1923.1691087632639197352
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 11:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EA3E12FC;
	Thu,  3 Aug 2023 11:34:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAC3A3F793;
	Thu,  3 Aug 2023 11:33:51 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/5] arm-toolchain/gcc-arm-none-eabi: upgrade to 12.3.rel1
Date: Thu,  3 Aug 2023 19:33:47 +0100
Message-Id: <20230803183347.3414946-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803183347.3414946-1-ross.burton@arm.com>
References: <20230803183347.3414946-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 18:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4932

From: Ross Burton <ross.burton@arm.com>

Upgrade the 12.2 recipe to 12.3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-none-eabi_12.2.rel1.bb =3D> gcc-arm-none-eabi_12.3.rel1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_12.2.rel1.bb =3D> gcc-arm-none-eabi_12.3.rel1.bb} (82%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_12.2.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_12.3.rel1.bb
similarity index 82%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_12.2.rel1.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_12.3.rel1.bb
index 48ddd163..6c33ec65 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_12.2.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_12.3.rel1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copy=
ing.html;md5=3D0aef214b835259
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D7ba=
3bc8ef145b48e2756a844db2029a3"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc=
-${HOST_ARCH}"
-SRC_URI[gcc-aarch64.sha256sum] =3D "7ee332f7558a984e239e768a13aed86c6c3a=
c85c90b91d27f4ed38d7ec6b3e8c"
-SRC_URI[gcc-x86_64.sha256sum] =3D "84be93d0f9e96a15addd490b6e237f588c641=
c8afdf90e7610a628007fc96867"
+SRC_URI[gcc-aarch64.sha256sum] =3D "14c0487d5753f6071d24e568881f7c7e67f8=
0dd83165dec5164b3731394af431"
+SRC_URI[gcc-x86_64.sha256sum] =3D "12a2815644318ebcceaf84beabb665d0924b6=
e79e21048452c5331a56332b309"
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
--=20
2.34.1


