Received: from C02VH2K5HV2R.localdomain (C02VH2K5HV2R.localdomain [81.96.232.39])
 by mx.groups.io with SMTP id smtpd.web11.501.1611867058527137649
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 12:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: c02vh2k5hv2r.localdomain, ip: 81.96.232.39, mailfrom: adrher02@c02vh2k5hv2r.localdomain)
Received: by C02VH2K5HV2R.localdomain (Postfix, from userid 501)
	id CA565983F88A; Wed, 16 Dec 2020 10:49:40 +0000 (GMT)
From: "Adrian Herrera" <adrian.herrera@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [meta-gem5][PATCH] gem5: use GEM5_RUN_PROFILE in DTB generation
Date: Wed, 16 Dec 2020 10:49:36 +0000
Message-Id: <20201216104936.87885-1-adrian.herrera@arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Allows to generate DTBs from profiles other than baremetal.py, which is
the default established by the layer.

Change-Id: If4658b8fcffaae82d3ddfb4cb4587e9eb1099ae0
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
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
2.29.2

