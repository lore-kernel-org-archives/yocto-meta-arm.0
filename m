Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89165CCA47F
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4257.1654679803468642706
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 02:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 212B41424;
	Wed,  8 Jun 2022 02:16:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638723F66F;
	Wed,  8 Jun 2022 02:16:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-toolchain/gcc-arm-none-eabi: upgrade to 11.2-2022.02
Date: Wed,  8 Jun 2022 10:16:37 +0100
Message-Id: <20220608091637.109635-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608091637.109635-1-ross.burton@arm.com>
References: <20220608091637.109635-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 09:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3482

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc-arm-none-eabi_10.3-2021.10.bb         | 20 ----------------
 .../gcc-arm-none-eabi_11.2-2022.02.bb         | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 20 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/gcc-arm-none-eabi_10.3-2021.10.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/gcc-arm-none-eabi_11.2-2022.02.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
deleted file mode 100644
index ad7e8161..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_10.3-2021.10.bb
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
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-
-LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;md5=
=3Dc18349634b740b7b95f2c2159af888f5"
-
-PROVIDES =3D "virtual/arm-none-eabi-gcc"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${=
PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=3Dgnu-rm-${HOST_ARCH}"
-SRC_URI[gnu-rm-aarch64.sha256sum] =3D "f605b5f23ca898e9b8b665be208510a54=
a6e9fdd0fa5bfc9592002f6e7431208"
-SRC_URI[gnu-rm-x86_64.sha256sum] =3D "97dbb4f019ad1650b732faffcc881689ce=
dc14e2b7ee863d390e0a41ef16c9a3"
-
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
-UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
new file mode 100644
index 00000000..26f0ee82
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_11.2-2022.02.bb
@@ -0,0 +1,23 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require arm-binary-toolchain.inc
+
+COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
+
+SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
+LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+
+LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dbe=
4f8b5ff7319cd54f6c52db5d6f36b0"
+LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D1f0=
7179249795891179bb3798bac7887"
+
+PROVIDES =3D "virtual/arm-none-eabi-gcc"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}=
/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=3Dgcc-${HOST_AR=
CH}"
+SRC_URI[gcc-aarch64.sha256sum] =3D "ef1d82e5894e3908cb7ed49c5485b5b95dee=
fa32872f79c2b5f6f5447cabf55f"
+SRC_URI[gcc-x86_64.sha256sum] =3D "8c5acd5ae567c0100245b0556941c237369f2=
10bceb196edfe5a2e7532c60326"
+
+S =3D "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
+
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/downloads"
+UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
--=20
2.25.1


