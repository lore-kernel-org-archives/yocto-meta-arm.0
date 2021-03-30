Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4732.1617111712331928809
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79D3C31B
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 06:41:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 236B23F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 06:41:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/scp-firmware: correct PV
Date: Tue, 30 Mar 2021 14:41:47 +0100
Message-Id: <20210330134147.2539983-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These are git snapshots after 2.7.0, not 2.7.

Change-Id: I6371dd12f5d17f432839b3673331b3153c1c4b6a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 2 +-
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index d365dc6..fa3403d 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=
=3D9db9e3d2fb8d9300a6c3d15101
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
 SRCREV  =3D "6c15afb1b37d0728482c598b063cd69bfc733e93"
-PV =3D "2.7+git${SRCPV}"
+PV =3D "2.7.0+git${SRCPV}"
=20
 COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b=
/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index 7d71a57..4501b94 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -2,7 +2,7 @@
=20
 # Intermediate SHA with 2.7 baseline version, required for Theodul DSU
 SRCREV =3D "bc35f4fd2d5e93c77effdeba43c98ddd5038de96"
-PV =3D "2.7+git${SRCPV}"
+PV =3D "2.7.0+git${SRCPV}"
=20
 COMPATIBLE_MACHINE =3D "tc0"
=20
--=20
2.25.1

