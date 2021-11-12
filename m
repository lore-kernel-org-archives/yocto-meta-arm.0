Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D57C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:14:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16365.1636726475156278586
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 06:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E13ED1
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 06:14:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D9123F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 06:14:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: upgrade gcc-arm-none-eabi (GNU-RM) to
 10.3-2021.10
Date: Fri, 12 Nov 2021 14:14:29 +0000
Message-Id: <20211112141429.576059-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 14:14:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2382

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...0-2020-q4-major.bb =3D> gcc-arm-none-eabi_10.3-2021.10.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-a=
rm-none-eabi_10-2020-q4-major.bb =3D> gcc-arm-none-eabi_10.3-2021.10.bb} =
(71%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_10-2020-q4-major.bb b/meta-arm-toolchain/recipes-devtool=
s/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
similarity index 71%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-arm-none-eabi_10-2020-q4-major.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
arm-none-eabi_10.3-2021.10.bb
index ffb2a2b0..41003728 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_10-2020-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_10.3-2021.10.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eab=
i/license.txt;md5=3Dc18349634
=20
 PROVIDES =3D "virtual/arm-none-eabi-gcc"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10=
-2020q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH=
}"
-SRC_URI[gnu-rm-x86_64.sha256sum] =3D "21134caa478bbf5352e239fbc6e2da3038=
f8d2207e089efc96c3b55f1edcd618"
-SRC_URI[gnu-rm-aarch64.sha256sum] =3D "343d8c812934fe5a904c73583a91edd81=
2b1ac20636eb52de04135bb0f5cf36a"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${=
PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-aarch64.sha256sum] =3D "f605b5f23ca898e9b8b665be208510a54=
a6e9fdd0fa5bfc9592002f6e7431208"
+SRC_URI[gnu-rm-x86_64.sha256sum] =3D "97dbb4f019ad1650b732faffcc881689ce=
dc14e2b7ee863d390e0a41ef16c9a3"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
 UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
--=20
2.25.1


