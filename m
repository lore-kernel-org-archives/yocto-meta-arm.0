Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8001.1623852808729873326
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 07:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC3E11FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 977513F719
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Jun 2021 07:13:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update TC0 to 2.5
Date: Wed, 16 Jun 2021 15:13:23 +0100
Message-Id: <20210616141324.346056-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616141324.346056-1-ross.burton@arm.com>
References: <20210616141324.346056-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TC0 has been using an intermediate SHA post-2.4 as it needed some commits
that were only in the integration branch.

We now have 2.5 which includes these commits, so move to that release.

Change-Id: Ic56c3daa9a408e837219c4f81d22081bbcc5c56d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-tc0.inc           | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc0.inc
index 20b52e9..53ff110 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.=
inc
@@ -1,11 +1,5 @@
 # TC0 specific TFA configuration
=20
-# Intermediate SHA with 2.4 baseline version, required for Theodul DSU
-# --- This SRC_URI will be removed once below SRCREV_tfa gets merged to =
TF-A master
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;branch=3Dintegration;name=3Dtfa"
-SRCREV_tfa =3D "9bc3007d3bb9363dbd5f6655d2b17d599e22bac4"
-PV =3D "2.4+git${SRCPV}"
-
 DEPENDS +=3D "scp-firmware"
=20
 COMPATIBLE_MACHINE =3D "tc0"
--=20
2.25.1

