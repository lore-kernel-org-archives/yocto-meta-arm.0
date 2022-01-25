Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5023AC43217
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:59:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6.1643129989304576553
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 08:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0A341063
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C4E43F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 08:59:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] scripts/machine-summary: show patch count in the overview
Date: Tue, 25 Jan 2022 16:59:36 +0000
Message-Id: <20220125165936.1456059-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125165936.1456059-1-ross.burton@arm.com>
References: <20220125165936.1456059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Jan 2022 16:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2912

Instead of simply adding a tag saying "Patched", include the patch count
and make a judgement call on whether the patches are "safe" or not. For
example, patches which are entirely backports or inappropriate are
"safe", pending and denied patches are not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py      | 11 +++++++++++
 scripts/report-index.html.jinja |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 0849c579..4888a007 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -24,6 +24,12 @@ def needs_update(version, upstream):
         version =3D version.replace("+git", "")
     return version !=3D upstream
=20
+def safe_patches(patches):
+    for info in patches:
+        if info["status"] in ("Denied", "Pending", "Unknown"):
+            return False
+    return True
+
 def layer_path(layername, d):
     """
     Return the path to the specified layer, or None if the layer isn't p=
resent.
@@ -100,6 +106,7 @@ def harvest_data(machines, recipes):
                 details["fullversion"] =3D d.getVar("PV")
                 details["patches"] =3D [extract_patch_info(p, d) for p i=
n oe.patch.src_patches(d)]
                 details["patched"] =3D bool(details["patches"])
+                details["patches_safe"] =3D safe_patches(details["patche=
s"])
=20
     # Now backfill the upstream versions
     for machine in versions:
@@ -148,11 +155,15 @@ class Format:
         template_dir =3D os.path.dirname(os.path.abspath(__file__))
         env =3D jinja2.Environment(
             loader=3Djinja2.FileSystemLoader(template_dir),
+            extensions=3D['jinja2.ext.i18n'],
             autoescape=3Djinja2.select_autoescape(),
             trim_blocks=3DTrue,
             lstrip_blocks=3DTrue
         )
=20
+        # We only need i18n for plurals
+        env.install_null_translations()
+
         return env.get_template(name)
=20
 class TextOverview(Format):
diff --git a/scripts/report-index.html.jinja b/scripts/report-index.html.=
jinja
index 3e39174f..44537581 100644
--- a/scripts/report-index.html.jinja
+++ b/scripts/report-index.html.jinja
@@ -26,7 +26,13 @@
             {% if details.patches or details.needs_update %}
             <br>
             {% if details.patches %}
-              <span class=3D"tag is-info">Patched</span>
+              <span class=3D"tag {{ "is-info" if details.patches_safe el=
se "is-danger" }}">
+                {% trans count=3Ddetails.patches|length %}
+                  {{ count }} Patch
+                {% pluralize %}
+                  {{ count }} Patches
+                {% endtrans %}
+              </span>
             {% endif %}
             {% if details.needs_update %}
               <span class=3D"tag is-danger">Upgrade</span>
--=20
2.25.1


