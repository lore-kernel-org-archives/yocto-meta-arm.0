Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F95C63682
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 19:12:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17362.1643224377210780441
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 11:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0D01FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 11:12:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3858C3F7D8
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 11:12:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] scripts/machine-summary: improve layer_path
Date: Wed, 26 Jan 2022 19:12:51 +0000
Message-Id: <20220126191253.1844130-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:12:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2916

As this can get called lots but the data doesn't change, cache
the responses.  Also return a pathlib.Path, as this is 2022.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 4888a007..c07c2d15 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -30,16 +30,23 @@ def safe_patches(patches):
             return False
     return True
=20
-def layer_path(layername, d):
+def layer_path(layername: str, d) -> pathlib.Path:
     """
     Return the path to the specified layer, or None if the layer isn't p=
resent.
     """
-    import re
+    if not hasattr(layer_path, "cache"):
+        # Don't use functools.lru_cache as we don't want d changing to i=
nvalidate the cache
+        layer_path.cache =3D {}
+
+    if layername in layer_path.cache:
+        return layer_path.cache[layername]
+
     bbpath =3D d.getVar("BBPATH").split(":")
     pattern =3D d.getVar('BBFILE_PATTERN_' + layername)
     for path in reversed(sorted(bbpath)):
         if re.match(pattern, path + "/"):
-            return path
+            layer_path.cache[layername] =3D pathlib.Path(path)
+            return layer_path.cache[layername]
     return None
=20
 def extract_patch_info(src_uri, d):
--=20
2.25.1


