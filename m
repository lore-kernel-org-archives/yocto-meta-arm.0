Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15668.1607095758913045973
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC459150C
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D073F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:13 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 06/17] arm-toolchain: external-arm-toolchain: Rename
Date: Fri,  4 Dec 2020 15:28:54 +0000
Message-Id: <20201204152905.1160276-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Gabor Abonyi <gabor.abonyi@arm.com>

Rename common external-arm-toolchain file, so it can be used by non-gcc
external toolchains too.

Change-Id: I48345dc53bc3d20f33b44fc0224b511f30107036
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{gcc-x86host.inc =3D> external-arm-toolchain-x86host.inc}     | 0
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-x=
86host.inc =3D> external-arm-toolchain-x86host.inc} (100%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/external-arm-toolchain-x86host.inc
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gc=
c-x86host.inc
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exte=
rnal-arm-toolchain-x86host.inc
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/=
external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 91daf08..a45fee0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_9.2-2019.12.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
=20
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools=
/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index a36f0aa..6403fe1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_9-2019-q4-major.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
=20
 SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
--=20
2.25.1

