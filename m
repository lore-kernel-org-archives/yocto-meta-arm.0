Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19974.1628761805837047411
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E85CD6E
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD29E3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 02:49:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] ci/listmachines: add helper to list machines in a layer
Date: Thu, 12 Aug 2021 10:49:50 +0100
Message-Id: <20210812094952.3348524-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of duplicating this logic, put it in a little helper module.

Change-Id: I2ca881c8de7e6ec6d4a940255d9ba97226e78d87
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/listmachines.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100755 ci/listmachines.py

diff --git a/ci/listmachines.py b/ci/listmachines.py
new file mode 100755
index 0000000..04d207e
--- /dev/null
+++ b/ci/listmachines.py
@@ -0,0 +1,29 @@
+#! /usr/bin/env python3
+
+import pathlib
+import typing
+import sys
+
+"""
+List all of the machines available under the listed sub-layers of meta-a=
rm.
+"""
+def list_machines(layers: typing.Sequence[str]) -> typing.Set[str]:
+    machines =3D set()
+
+    # We know we're in meta-arm/scripts, so find the top-level directory
+    metaarm =3D pathlib.Path(__file__).resolve().parent.parent
+    if metaarm.name !=3D "meta-arm":
+        raise Exception("Not running inside meta-arm")
+   =20
+    for layer in layers:
+        machines |=3D set(p.stem for p in (metaarm / layer / "conf" / "m=
achine").glob("*.conf"))
+    return machines
+
+if __name__ =3D=3D "__main__":
+    if len(sys.argv) > 1:
+        machines =3D list_machines(sys.argv[1:])
+        print(" ".join(sorted(machines)))
+        sys.exit(0)
+    else:
+        print("Usage:\n$ %s [layer name ...] " % sys.argv[0])
+        sys.exit(1)
--=20
2.25.1

