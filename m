Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A97C43219
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:20:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.871.1638901203003084792
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 10:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD6331476
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 581EE3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm-bsp/trusted-firmware-a: move most BSPs to TF-A 2.6
Date: Tue,  7 Dec 2021 18:19:56 +0000
Message-Id: <20211207181956.900131-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207181956.900131-1-ross.burton@arm.com>
References: <20211207181956.900131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 18:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2559

Most BSPs don't need a specific release of TF-A, so add a bbappend for
TF-A 2.6 and remove the preferred version assignments.

Notable exceptions are TC0/TC1 and Corstone1000, which both are currently
using intermediate SHAs pre-2.6:

- TC0/TC1 fails to build with TF-A 2.6 as the binary doesn't fit in the
  specific space.

- Corstone1000 patches need to be rebased on top of 2.6

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf         |  2 --
 meta-arm-bsp/conf/machine/fvp-common.inc           |  1 -
 meta-arm-bsp/conf/machine/include/corstone700.inc  |  2 --
 meta-arm-bsp/conf/machine/juno.conf                |  1 -
 meta-arm-bsp/conf/machine/n1sdp.conf               |  2 --
 meta-arm-bsp/conf/machine/sgi575.conf              |  2 --
 .../trusted-firmware-a_2.6.bbappend                | 14 ++++++++++++++
 7 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.6.bbappend

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index c9ab4064..384a8dcf 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -14,8 +14,6 @@ require conf/machine/include/arm/armv7a/tune-cortexa5.i=
nc
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 799260ec..a8fd60d9 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -15,7 +15,6 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
=20
 PREFERRED_VERSION_u-boot ?=3D "2021.10"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
index 8a03c00d..fbb52776 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -11,8 +11,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.6%"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-
 PREFERRED_VERSION_gcc-arm-none-eabi-native ?=3D "9-2020-q2-update"
=20
 PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "boot-firmwar=
e"
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 4a71d66d..86253adf 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,7 +20,6 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot firmware-image-juno"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 95a04c05..1fadbc10 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -25,8 +25,6 @@ PREFERRED_VERSION_linux-yocto-rt ?=3D "5.10%"
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 7e1e6036..a384caa5 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -8,8 +8,6 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.=
inc
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
-
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.6.bbappend
new file mode 100644
index 00000000..659ba352
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
@@ -0,0 +1,14 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE:corstone500 =3D "trusted-firmware-a-corstone500.inc"
+MACHINE_TFA_REQUIRE:corstone700 =3D "trusted-firmware-a-corstone700.inc"
+MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
+MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE:fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
+MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
+MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
+MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
+
+require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1


