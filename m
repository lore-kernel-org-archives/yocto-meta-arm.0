Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.85046.1629471211202929771
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Aug 2021 07:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A95611FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Aug 2021 07:53:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA26D3F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Aug 2021 07:53:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/scp-firmware: unify TC versions
Date: Fri, 20 Aug 2021 15:53:27 +0100
Message-Id: <20210820145327.4128076-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The base version is 2.8.0, so these should be 2.8.0+git.

Change-Id: Ief7c3176e46f6ec8b4549375f9be776a7ffbd4d7
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 20bbcc7..b58468c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -4,7 +4,7 @@
 SRCREV:tc0 =3D "67a3612716ad3b839da4209a173404692607c5a1"
 SRCREV:tc1 =3D "26c858b46824a8d74a7593325a0124c163de65d6"
=20
-PV =3D "2.8+git${SRCPV}"
+PV =3D "2.8.0+git${SRCPV}"
=20
 # This is incorporated into the SRCREV above
 SRC_URI:remove =3D " \
--=20
2.32.0

