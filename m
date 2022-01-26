Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E44C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 15:25:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13913.1643210742402367243
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 07:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C96AE1063
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 07:25:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 728F83F793
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 07:25:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] scripts/machine-summary: link patches to cgit
Date: Wed, 26 Jan 2022 15:25:39 +0000
Message-Id: <20220126152539.1551870-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126152539.1551870-1-ross.burton@arm.com>
References: <20220126152539.1551870-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 15:25:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2914

Add links from the patch names to the patches in cgit for ease of
inspection.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py        | 20 +++++++++++++++++---
 scripts/report-details.html.jinja |  7 +++++--
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index c07c2d15..47d8ff34 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -49,6 +49,19 @@ def layer_path(layername: str, d) -> pathlib.Path:
             return layer_path.cache[layername]
     return None
=20
+def get_url_for_patch(layer: str, localpath: pathlib.Path, d) -> str:
+    relative =3D localpath.relative_to(layer_path(layer, d))
+
+    # TODO: use layerindexlib
+    # TODO: assumes default branch
+    if layer =3D=3D "core":
+        return f"https://git.openembedded.org/openembedded-core/tree/met=
a/{relative}"
+    elif layer in ("meta-arm", "meta-arm-bsp", "arm-toolchain", "meta-at=
p", "meta-gem5"):
+        return f"https://git.yoctoproject.org/meta-arm/tree/{layer}/{rel=
ative}"
+    else:
+        print(f"WARNING: Don't know web URL for layer {layer}", file=3Ds=
ys.stderr)
+        return None
+
 def extract_patch_info(src_uri, d):
     """
     Parse the specified patch entry from a SRC_URI and return (base name=
, layer name, status) tuple
@@ -56,9 +69,10 @@ def extract_patch_info(src_uri, d):
     import bb.fetch, bb.utils
=20
     info =3D {}
-    localpath =3D bb.fetch.decodeurl(src_uri)[2]
-    info["name"] =3D os.path.basename(localpath)
-    info["layer"] =3D bb.utils.get_file_layer(localpath, d)
+    localpath =3D pathlib.Path(bb.fetch.decodeurl(src_uri)[2])
+    info["name"] =3D localpath.name
+    info["layer"] =3D bb.utils.get_file_layer(str(localpath), d)
+    info["url"] =3D get_url_for_patch(info["layer"], localpath, d)
=20
     status =3D "Unknown"
     with open(localpath, errors=3D"ignore") as f:
diff --git a/scripts/report-details.html.jinja b/scripts/report-details.h=
tml.jinja
index 19ede510..a656c261 100644
--- a/scripts/report-details.html.jinja
+++ b/scripts/report-details.html.jinja
@@ -47,8 +47,11 @@
     <tbody>
       {% for pinfo in data.patches %}
       <tr>
-        <!-- TODO links to cgit -->
-        <td>{{ pinfo.name }}</td>
+        <td>
+          {% if pinfo.url %}<a href=3D"{{pinfo.url}}">{% endif %}
+          {{ pinfo.name }}
+          {% if pinfo.url %}</a>{% endif %}
+        </td>
         <td>{{ pinfo.layer }}</td>
         <!-- TODO: tooltip with full status? -->
         <td class=3D"has-text-centered">{{ make_patch_tag(pinfo.status)}=
}</td>
--=20
2.25.1


