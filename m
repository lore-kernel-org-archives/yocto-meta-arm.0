Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04130C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2937.1642627253937765172
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46165101E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5E9A3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] scripts/machine-summary: harvest more patch data
Date: Wed, 19 Jan 2022 21:20:46 +0000
Message-Id: <20220119212050.1886613-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2870

Instead of just putting whether there are patches or not into the
context, store the list of patches, the layer they came from, and the
upstream status.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 7d2eb53f..e0c7870d 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -1,9 +1,10 @@
 #! /usr/bin/env python3
=20
-import os
-import sys
 import argparse
 import datetime
+import os
+import re
+import sys
=20
 import jinja2
=20
@@ -42,8 +43,28 @@ def layer_path(layername, d):
             return path
     return None
=20
+def extract_patch_info(src_uri, d):
+    """
+    Parse the specified patch entry from a SRC_URI and return (base name=
, layer name, status) tuple
+    """
+    import bb.fetch, bb.utils
+
+    info =3D {}
+    localpath =3D bb.fetch.decodeurl(src_uri)[2]
+    info["name"] =3D os.path.basename(localpath)
+    info["layer"] =3D bb.utils.get_file_layer(localpath, d)
+
+    status =3D "Unknown"
+    with open(localpath, errors=3D"ignore") as f:
+        m =3D re.search(r"^[\t ]*Upstream[-_ ]Status:?[\t ]*(\w*)", f.re=
ad(), re.IGNORECASE | re.MULTILINE)
+        if m:
+            # TODO: validate
+            status =3D m.group(1)
+    info["status"] =3D status
+    return info
+
 def harvest_data(machines, recipes):
-    import bb.tinfoil, bb.utils
+    import bb.tinfoil
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=3DTrue)
         corepath =3D layer_path("core", tinfoil.config_data)
@@ -83,7 +104,8 @@ def harvest_data(machines, recipes):
                 details =3D versions[machine][recipe] =3D {}
                 details["recipe"] =3D d.getVar("PN")
                 details["version"] =3D trim_pv(d.getVar("PV"))
-                details["patched"] =3D bool(oe.patch.src_patches(d))
+                details["patches"] =3D [extract_patch_info(p, d) for p i=
n oe.patch.src_patches(d)]
+                details["patched"] =3D bool(details["patches"])
=20
     # Now backfill the upstream versions
     for machine in versions:
--=20
2.25.1


