Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8350.1626790584143971343
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 07:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E3641FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17C1D3F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/generic-arm64: don't set SERIAL_CONSOLES
Date: Tue, 20 Jul 2021 15:16:16 +0100
Message-Id: <20210720141618.3307847-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This machine expects something approximating SystemReady, which means
the firmware should be capable of telling the kernel where the console
is.

Remove SERIAL_CONSOLES so the kernel does what the firmware is told, and
doesn't try to use serial consoles that don't exist.

Change-Id: Ib0b008fececf4c046112bdede9d0d3ebf9dc332b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index 05b3e70..ca4b8d3 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -1,12 +1,10 @@
 #@TYPE: Machine
 #@NAME: generic-arm64
-#@DESCRIPTION: Generic Arm64 machine for creating rootfs that should wor=
k on all arm64 hardware
+#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, =
which
+#have working firmware and boot via EFI.
=20
 require conf/machine/include/arm/arch-armv8a.inc
=20
-SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
-SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
-
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
--=20
2.25.1

