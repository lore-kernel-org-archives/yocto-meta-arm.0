Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.15606.1607095758634194618
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B0F01516
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 169393F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:14 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 08/17] arm-toolchain/external-arm-toolchain: rename common include
Date: Fri,  4 Dec 2020 15:28:56 +0000
Message-Id: <20201204152905.1160276-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These recipes all used a common include
external-arm-toolchain-x86host.inc, but that name isn't very meaningful:
the recipes are for x86-64, there typically are more than x86-64
binaries available, and it's not for an external toolchain but
integrating a binary toolchain.

Rename the include to arm-binary-toolchain.inc, as they're all the Arm
binary toolchain.

Change-Id: I59f5faa7373686958e226db0aa68e7880d36400e
Signed-off-by: Ross Burton <ross.burton@arm.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ernal-arm-toolchain-x86host.inc =3D> arm-binary-toolchain.inc} | 0
 .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 +-
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{exter=
nal-arm-toolchain-x86host.inc =3D> arm-binary-toolchain.inc} (100%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain-x86host.inc b/meta-arm-toolchain/recipes-devtools/e=
xternal-arm-toolchain/arm-binary-toolchain.inc
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/ex=
ternal-arm-toolchain-x86host.inc
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-=
binary-toolchain.inc
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.13.bb
index 4aeba68..7a7673b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.13.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.13.bb
@@ -3,7 +3,7 @@
 # Copyright (c) 2020 Arm Limited
 #
=20
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
=20
 SUMMARY =3D "Baremetal Armcompiler for Cortex-A, Cortex-R and Cortex-M p=
rocessors"
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/embedded/arm-=
compiler/downloads/version-6"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index a45fee0..020bbf8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
=20
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index 6403fe1..77e44ce 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require external-arm-toolchain-x86host.inc
+require arm-binary-toolchain.inc
=20
 SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
--=20
2.25.1

