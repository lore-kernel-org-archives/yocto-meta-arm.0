Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.6057.1606307504174952646
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5686411D4
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D4B3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:31:43 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/scp-firmware: explicitly select scp-firmware 2.6
Date: Wed, 25 Nov 2020 12:31:25 +0000
Message-Id: <20201125123127.3226384-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125123127.3226384-1-ross.burton@arm.com>
References: <20201125123127.3226384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Explicitly select scp-firmware 2.6 in all the machines that use it.

Change-Id: I83d3214fff05e7cbbf182f1215e67da42ceb68f1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf   | 1 +
 meta-arm-bsp/conf/machine/n1sdp.conf  | 2 ++
 meta-arm-bsp/conf/machine/sgi575.conf | 2 ++
 meta-arm-bsp/conf/machine/tc0.conf    | 5 +++--
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 2f42dea..8cff6c4 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,6 +20,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
+PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 230c912..1f11acd 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,6 +31,8 @@ PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
+PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
+
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
=20
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index e6d447d..7714d0d 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -14,6 +14,8 @@ PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
+PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
+
 # Use kernel provided by linaro
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machi=
ne/tc0.conf
index 7776dde..8d70aad 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -15,11 +15,12 @@ PREFERRED_VERSION_u-boot ?=3D "2020.07"
 # Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
-PREFERRED_VERSION_linux-arm64-ack ?=3D "5.4"
-
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
+PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
+
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
+PREFERRED_VERSION_linux-arm64-ack ?=3D "5.4"
=20
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE =3D "Image"
--=20
2.25.1

