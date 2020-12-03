Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14041.1607016065551430766
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 09:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4502F143B
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDECB3F575
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:04 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/scp-firmware: inhibit default DEPENDS
Date: Thu,  3 Dec 2020 17:20:59 +0000
Message-Id: <20201203172059.1347328-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203172059.1347328-1-ross.burton@arm.com>
References: <20201203172059.1347328-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is baremetal firmware so doesn't use the C runtime library and uses
the binary compiler for 32-bit Arm instead of the standard one, so
inhibit the default dependencies entirely.

Change-Id: Idd52bb09fea49640f1fc38e1c5a47ca8eecca107
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 3 ++-
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index ab31746..123f442 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -17,7 +17,8 @@ SCP_PLATFORM        ?=3D "invalid"
 SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
=20
-DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native"
=20
 SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'relea=
se', 'debug', d)}"
=20
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
index 13092f1..3a71b2e 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.7.0.bb
@@ -16,7 +16,8 @@ SCP_PLATFORM        ?=3D "invalid"
 SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
=20
-DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D "virtual/arm-none-eabi-gcc-native"
=20
 SCP_BUILD_STR =3D "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'relea=
se', 'debug', d)}"
=20
--=20
2.25.1

