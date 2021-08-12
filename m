Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20170.1628761797359433935
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 02:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 947A01063
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FDEA3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] ci/check-machine-coverage: use listmachines.py
Date: Thu, 12 Aug 2021 10:49:51 +0100
Message-Id: <20210812094952.3348524-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812094952.3348524-1-ross.burton@arm.com>
References: <20210812094952.3348524-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I5a7e706ae29b76a39aed8acfc0cd825e942b1cfe
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/check-machine-coverage | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ci/check-machine-coverage b/ci/check-machine-coverage
index 035d421..f329fce 100755
--- a/ci/check-machine-coverage
+++ b/ci/check-machine-coverage
@@ -2,6 +2,7 @@
=20
 from pathlib import Path
 import sys
+from listmachines import list_machines
=20
 metaarm =3D Path.cwd()
=20
@@ -9,9 +10,10 @@ if metaarm.name !=3D "meta-arm":
     print("Not running inside meta-arm")
     sys.exit(1)
=20
+# Find all layers
+layers =3D (p.name for p in metaarm.glob("meta-*") if p.is_dir())
 # All machine configurations
-machines =3D metaarm.glob("meta-*/conf/machine/*.conf")
-machines =3D set(p.stem for p in machines)
+machines =3D list_machines(layers)
=20
 # All kas files
 kas =3D metaarm.glob("ci/*.yml")
--=20
2.25.1

