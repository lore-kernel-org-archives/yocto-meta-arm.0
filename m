Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12295.1619792613963861247
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 07:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815BD1063
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Apr 2021 07:23:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A10F3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 30 Apr 2021 07:23:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] scripts: add tool to generate a layer overview
Date: Fri, 30 Apr 2021 15:23:21 +0100
Message-Id: <20210430142321.2606015-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Icb4e29d80f1db9791ce801910563695c9fdc76b3
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/layer-overview.py | 52 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 scripts/layer-overview.py

diff --git a/scripts/layer-overview.py b/scripts/layer-overview.py
new file mode 100755
index 0000000..24a9a5b
--- /dev/null
+++ b/scripts/layer-overview.py
@@ -0,0 +1,52 @@
+#! /usr/bin/env python3
+
+"""
+Print an overview of the layer to help writing release notes.
+
+Output includes sublayers, machines, recipes.
+"""
+
+# TODO:
+# - More human-readable output
+# - Diff mode, give two revisions and list the changes
+# - Support finding no sublayers, meaning the path is a single layer
+
+import argparse
+parser =3D argparse.ArgumentParser()
+parser.add_argument("repository")
+parser.add_argument("revision", nargs=3D"?")
+args =3D parser.parse_args()
+
+if args.revision:
+    import gitpathlib
+    base =3D gitpathlib.GitPath(args.repository, args.revision)
+else:
+    import pathlib
+    base =3D pathlib.Path(args.repository)
+
+print("Sub-Layers")
+sublayers =3D sorted(p for p in base.glob("meta-*") if p.is_dir())
+for l in sublayers:
+    print(f" {l.name}")
+print()
+
+for layer in sublayers:
+    print(layer.name)
+
+    machines =3D sorted(p for p in layer.glob("conf/machine/*.conf"))
+    if machines:
+        print(" Machines")
+        for m in machines:
+            print(f"  {m.stem}")
+        print()
+
+    recipes =3D sorted((p for p in layer.glob("recipes-*/*/*.bb")), key=3D=
lambda p:p.name)
+    if recipes:
+        print(" Recipes")
+        for r in recipes:
+            if "_" in r.stem:
+                pn, pv =3D r.stem.rsplit("_", 1)
+                print(f"  {pn} {pv}")
+            else:
+                print(f"  {r.stem}")
+        print()
--=20
2.25.1

