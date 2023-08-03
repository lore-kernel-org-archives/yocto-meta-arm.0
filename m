Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E33EC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:33:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1950.1691087631156698561
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 11:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B846D12FC;
	Thu,  3 Aug 2023 11:34:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CE5C3F793;
	Thu,  3 Aug 2023 11:33:50 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/5] arm-toolchain/gcc-arm-none-eabi-11.2: add new recipe
Date: Thu,  3 Aug 2023 19:33:45 +0100
Message-Id: <20230803183347.3414946-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803183347.3414946-1-ross.burton@arm.com>
References: <20230803183347.3414946-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 18:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4931

From: Ross Burton <ross.burton@arm.com>

Add back the 11.2 release of GCC, because TF-M has code generation
problems with 11.3 onwards.

This recipe has the major version embedded in the recipe name so that it
has to be specifically asked for in a per-recipe basis.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/toolchains.yml                             |  2 ++
 .../gcc-arm-none-eabi-11.2_11.2-2022.02.bb    | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/gcc-arm-none-eabi-11.2_11.2-2022.02.bb

diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index 056269b2..9b63bf28 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -16,3 +16,5 @@ target:
   - nativesdk-gcc-aarch64-none-elf
   - gcc-arm-none-eabi
   - nativesdk-gcc-arm-none-eabi
+  - gcc-arm-none-eabi-11.2
+  - nativesdk-gcc-arm-none-eabi-11.2
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi-11.2_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtoo=
ls/external-arm-toolchain/gcc-arm-none-eabi-11.2_11.2-2022.02.bb
new file mode 100644
index 00000000..7fab1e13
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi-11.2_11.2-2022.02.bb
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
+BINNAME =3D "arm-none-eabi"
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
2.34.1


