Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F82C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2782.1642627254186026610
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA3D1063
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786BB3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] scripts/machine-summary: refactor output to classes
Date: Wed, 19 Jan 2022 21:20:47 +0000
Message-Id: <20220119212050.1886613-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2871

To prepare for future expansion, refactor the output code to be delegated
to Format subclasses.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 75 +++++++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index e0c7870d..e5161440 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -3,28 +3,12 @@
 import argparse
 import datetime
 import os
+import pathlib
 import re
 import sys
=20
 import jinja2
=20
-def get_template(name):
-    template_dir =3D os.path.dirname(os.path.abspath(__file__))
-    env =3D jinja2.Environment(
-        loader=3Djinja2.FileSystemLoader(template_dir),
-        autoescape=3Djinja2.select_autoescape(),
-        trim_blocks=3DTrue,
-        lstrip_blocks=3DTrue
-    )
-    def is_old(version, upstream):
-        if "+git" in version:
-            # strip +git and see if this is a post-release snapshot
-            version =3D version.replace("+git", "")
-        return version !=3D upstream
-    env.tests["old"] =3D is_old
-
-    return env.get_template(f"machine-summary-{name}.jinja")
-
 def trim_pv(pv):
     """
     Strip anything after +git from the PV
@@ -126,19 +110,66 @@ recipes =3D ("virtual/kernel",
            "gcc-aarch64-none-elf-native",
            "gcc-arm-none-eabi-native")
=20
+
+class Format:
+    """
+    The name of this format
+    """
+    name =3D None
+    """
+    Registry of names to classes
+    """
+    registry =3D {}
+
+    def __init_subclass__(cls, **kwargs):
+        super().__init_subclass__(**kwargs)
+        assert cls.name
+        cls.registry[cls.name] =3D cls
+
+    @classmethod
+    def get_format(cls, name):
+        return cls.registry[name]()
+
+    def render(self, context, output: pathlib.Path):
+        # Default implementation for convenience
+        with open(output, "wt") as f:
+            f.write(self.get_template(f"machine-summary-{self.name}.jinj=
a").render(context))
+
+    def get_template(self, name):
+        template_dir =3D os.path.dirname(os.path.abspath(__file__))
+        env =3D jinja2.Environment(
+            loader=3Djinja2.FileSystemLoader(template_dir),
+            autoescape=3Djinja2.select_autoescape(),
+            trim_blocks=3DTrue,
+            lstrip_blocks=3DTrue
+        )
+        def is_old(version, upstream):
+            if "+git" in version:
+                # strip +git and see if this is a post-release snapshot
+                version =3D version.replace("+git", "")
+            return version !=3D upstream
+        env.tests["old"] =3D is_old
+
+        return env.get_template(name)
+
+class TextOverview(Format):
+    name =3D "overview.txt"
+
+class HtmlUpdates(Format):
+    name =3D "updates.html"
+
 if __name__ =3D=3D "__main__":
     parser =3D argparse.ArgumentParser(description=3D"machine-summary")
     parser.add_argument("machines", nargs=3D"+", help=3D"machine names",=
 metavar=3D"MACHINE")
-    parser.add_argument("-t", "--template", required=3DTrue)
-    parser.add_argument("-o", "--output", required=3DTrue, type=3Dargpar=
se.FileType('w', encoding=3D'UTF-8'))
+    parser.add_argument("-t", "--type", required=3DTrue, choices=3DForma=
t.registry.keys())
+    parser.add_argument("-o", "--output", type=3Dpathlib.Path, required=3D=
True)
     args =3D parser.parse_args()
=20
-    template =3D get_template(args.template)
-
     context =3D {}
     # TODO: include git describe for meta-arm
     context["timestamp"] =3D str(datetime.datetime.now().strftime("%c"))
     context["recipes"] =3D sorted(recipes)
     context["releases"], context["data"] =3D harvest_data(args.machines,=
 recipes)
=20
-    args.output.write(template.render(context))
+    formatter =3D Format.get_format(args.type)
+    formatter.render(context, args.output)
--=20
2.25.1


