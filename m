Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21.1610622983529214566
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9819ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:16:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957443F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:16:22 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] gem5: use GEM5_RUN_PROFILE in DTB generation
Date: Thu, 14 Jan 2021 11:16:18 +0000
Message-Id: <20210114111619.2170401-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

Allows to generate DTBs from profiles other than baremetal.py, which is
the default established by the layer.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Ic990bd6751e473756d0739f421dce4b8f98248d7
---
 meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-g=
em5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
index b97a1b2..50ac030 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
@@ -11,7 +11,7 @@ do_configure[noexec] =3D "1"
 do_compile() {
     # generate a dtb using gem5
     gem5.opt \
-        ${STAGING_DATADIR_NATIVE}/gem5/configs/example/arm/baremetal.py =
\
+        ${STAGING_DATADIR_NATIVE}/gem5/${GEM5_RUN_PROFILE} \
         --dtb-gen
=20
     if [ ! -f m5out/system.dtb ]; then
--=20
2.25.1

