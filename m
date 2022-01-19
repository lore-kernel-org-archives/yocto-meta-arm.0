Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F63C43219
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2873.1642627254708511303
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE95113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AAFB3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] scripts/machine-summary: put more version information
 into the context
Date: Wed, 19 Jan 2022 21:20:48 +0000
Message-Id: <20220119212050.1886613-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2873

As well as storing the truncated PV, also store the original PV and
whether the recipe needs updating, to avoid the templates needing to
do that logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index e5161440..2fef8491 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -15,6 +15,15 @@ def trim_pv(pv):
     """
     return "".join(pv.partition("+git")[:2])
=20
+def needs_update(version, upstream):
+    """
+    Do a dumb comparison to determine if the version needs to be updated=
.
+    """
+    if "+git" in version:
+        # strip +git and see if this is a post-release snapshot
+        version =3D version.replace("+git", "")
+    return version !=3D upstream
+
 def layer_path(layername, d):
     """
     Return the path to the specified layer, or None if the layer isn't p=
resent.
@@ -88,14 +97,16 @@ def harvest_data(machines, recipes):
                 details =3D versions[machine][recipe] =3D {}
                 details["recipe"] =3D d.getVar("PN")
                 details["version"] =3D trim_pv(d.getVar("PV"))
+                details["fullversion"] =3D d.getVar("PV")
                 details["patches"] =3D [extract_patch_info(p, d) for p i=
n oe.patch.src_patches(d)]
                 details["patched"] =3D bool(details["patches"])
=20
     # Now backfill the upstream versions
     for machine in versions:
         for recipe in versions[machine]:
-            versions[machine][recipe]["upstream"] =3D upstreams[recipe]
-
+            data =3D versions[machine][recipe]
+            data["upstream"] =3D upstreams[recipe]
+            data["needs_update"] =3D needs_update(data["version"], data[=
"upstream"])
     return upstreams, versions
=20
 # TODO can this be inferred from the list of recipes in the layer
--=20
2.25.1


