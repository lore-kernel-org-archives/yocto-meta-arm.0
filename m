Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1311.1602690740484862876
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5CBD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 08:52:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54AE03F71F
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 08:52:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/musca-*: use newlib for libc
Date: Wed, 14 Oct 2020 16:52:14 +0100
Message-Id: <20201014155214.2936166-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Whilst glibc is definitely not an option for Cortex-M cores, newlib is
a viable libc implementation that is useful to default too.

Change-Id: I1f3a53e43945f486aa2e7bce019f105c55df5e87
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 2 +-
 meta-arm-bsp/conf/machine/musca-s1.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index 40964be..50b2f05 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -10,7 +10,7 @@ PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
 require conf/machine/include/tune-cortexm33.inc
=20
 # GLIBC will not work with Cortex-M.
-TCLIBC =3D "baremetal"
+TCLIBC =3D "newlib"
=20
 # For runqemu
 require conf/machine/include/qemu.inc
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index d2e5ab7..66e0a35 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -10,4 +10,4 @@ PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
 require conf/machine/include/tune-cortexm33.inc
=20
 # GLIBC will not work with Cortex-M.
-TCLIBC =3D "baremetal"
+TCLIBC =3D "newlib"
--=20
2.25.1

