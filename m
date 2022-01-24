Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC69C43217
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5976.1643041817706672509
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D5E101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156703F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-toolchain/gcc-arm-none-eabi: remove old 2020-q2
 recipe
Date: Mon, 24 Jan 2022 16:30:12 +0000
Message-Id: <20220124163012.3796553-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124163012.3796553-1-ross.burton@arm.com>
References: <20220124163012.3796553-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2901

This was only used by Corstone 700, so is redundant now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc-arm-none-eabi_9-2020-q2-update.bb     | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/gcc-arm-none-eabi_9-2020-q2-update.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2020-q2-update.bb b/meta-arm-toolchain/recipes-devtool=
s/external-arm-toolchain/gcc-arm-none-eabi_9-2020-q2-update.bb
deleted file mode 100644
index 4023c48f..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2020-q2-update.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require arm-binary-toolchain.inc
-
-COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
-
-SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
-
-LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;md5=
=3Dc18349634b740b7b95f2c2159af888f5"
-
-PROVIDES =3D "virtual/arm-none-eabi-gcc"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-=
2020q2/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH}=
"
-SRC_URI[gnu-rm-x86_64.sha256sum] =3D "5adc2ee03904571c2de79d5cfc0f7fe2a5=
c5f54f44da5b645c17ee57b217f11f"
-SRC_URI[gnu-rm-aarch64.sha256sum] =3D "1f4165c25e2cff80e29870f409862487b=
a470afd436e245ba3c743108e17b8ac"
-
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
-UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
--=20
2.25.1


