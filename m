Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42DEC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2936.1642627253937591592
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B50ECED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F3FA3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] scripts/layer-overview: improve layer detection
Date: Wed, 19 Jan 2022 21:20:45 +0000
Message-Id: <20220119212050.1886613-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2872

Refactor the script somewhat, and detect whether the starting directory
is a single layer, or a collection of layers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/layer-overview.py | 60 ++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/scripts/layer-overview.py b/scripts/layer-overview.py
index 24a9a5b6..326470e6 100755
--- a/scripts/layer-overview.py
+++ b/scripts/layer-overview.py
@@ -6,31 +6,24 @@ Print an overview of the layer to help writing release =
notes.
 Output includes sublayers, machines, recipes.
 """
=20
+import argparse
+import sys
+
 # TODO:
 # - More human-readable output
 # - Diff mode, give two revisions and list the changes
-# - Support finding no sublayers, meaning the path is a single layer
-
-import argparse
-parser =3D argparse.ArgumentParser()
-parser.add_argument("repository")
-parser.add_argument("revision", nargs=3D"?")
-args =3D parser.parse_args()
=20
-if args.revision:
-    import gitpathlib
-    base =3D gitpathlib.GitPath(args.repository, args.revision)
-else:
-    import pathlib
-    base =3D pathlib.Path(args.repository)
+def is_layer(path):
+    """
+    Determine if this path looks like a layer (is a directory and contai=
ns conf/layer.conf).
+    """
+    return path.is_dir() and (path / "conf" / "layer.conf").exists()
=20
-print("Sub-Layers")
-sublayers =3D sorted(p for p in base.glob("meta-*") if p.is_dir())
-for l in sublayers:
-    print(f" {l.name}")
-print()
=20
-for layer in sublayers:
+def print_layer(layer):
+    """
+    Print a summary of the layer.
+    """
     print(layer.name)
=20
     machines =3D sorted(p for p in layer.glob("conf/machine/*.conf"))
@@ -50,3 +43,32 @@ for layer in sublayers:
             else:
                 print(f"  {r.stem}")
         print()
+
+
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
+if is_layer(base):
+    print_layer(base)
+else:
+    sublayers =3D sorted(p for p in base.glob("meta-*") if is_layer(p))
+    if sublayers:
+        print("Sub-Layers")
+        for l in sublayers:
+            print(f" {l.name}")
+        print()
+
+        for layer in sublayers:
+            print_layer(layer)
+    else:
+        print(f"No layers found in {base}", file=3Dsys.stderr)
+        sys.exit(1)
--=20
2.25.1


