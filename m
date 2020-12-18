Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2083.1608312871121846080
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D99A101E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4ECC3F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:29 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/trusted-firmware-m: don't use COMPATIBLE_MACHINE directly
Date: Fri, 18 Dec 2020 17:34:22 +0000
Message-Id: <20201218173427.1225026-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

COMPATIBLE_MACHINE is a wrapper around raising SkipRecipe, and as this
recipe basically just needs TFM_PLATFORM set we can raise that if the
variable is not set.  This allows BSPs to set TFM_PLATFORM in their
machine configuration instead of needing to bbappend.

Change-Id: I8544ff14ac4689bfbea1f0ac68364b673abde6f1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.0.bb      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 9b204b8..906f2f0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -46,14 +46,17 @@ DEPENDS +=3D "python3-cryptography-native python3-pya=
sn1-native python3-cbor-nativ
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
=20
-COMPATIBLE_MACHINE ?=3D "invalid"
-
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFM_DEBUG ?=3D "0"
 # Set target config
 TFM_CONFIG ?=3D "ConfigDefault.cmake"
-# Platform must be set for each machine
-TFM_PLATFORM ?=3D "invalid"
+
+# Platform must be set, ideally in the machine configuration.
+TFM_PLATFORM ?=3D ""
+python() {
+    if not d.getVar("TFM_PLATFORM"):
+        raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
+}
=20
 # Uncomment, or copy these lines to your local.conf to use the Arm Clang=
 compiler
 # from meta-arm-toolchain.
--=20
2.25.1

