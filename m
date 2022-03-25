Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47FAC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:49:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5499.1648216139402744273
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BA3D139F
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44093F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] CI: fix random testimage failures
Date: Fri, 25 Mar 2022 13:48:52 +0000
Message-Id: <20220325134853.3068169-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3210

Backport a patch from Poky to fix random failures in testimage where
sys.path contains meta-arm twice, causing testimage to complain that
there are duplicate class names.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...text-remove-duplicate-sys.path-entri.patch | 38 +++++++++++++++++++
 ci/base.yml                                   |  4 ++
 2 files changed, 42 insertions(+)
 create mode 100644 ci/0001-oeqa-runtime-context-remove-duplicate-sys.pat=
h-entri.patch

diff --git a/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri=
.patch b/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.pat=
ch
new file mode 100644
index 00000000..6fcefd25
--- /dev/null
+++ b/ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-entri.patch
@@ -0,0 +1,38 @@
+From 366316dca4ad6a0485b68fbf3271651d90395573 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 24 Mar 2022 18:11:27 +0000
+Subject: [PATCH] oeqa/runtime/context: remove duplicate sys.path entries=
 when
+ looking for modules
+
+sys.path can contain duplicate entries for each layer, which means that
+the search in add_controller_list() will find the same name twice and
+abort.
+
+As duplicate directories should be harmless, remove any duplicates befor=
e
+iterating through the entries.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meta/lib/oeqa/runtime/context.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/co=
ntext.py
+index d707ab263a8..8092dd0baee 100644
+--- a/meta/lib/oeqa/runtime/context.py
++++ b/meta/lib/oeqa/runtime/context.py
+@@ -153,7 +153,11 @@ class OERuntimeTestContextExecutor(OETestContextExe=
cutor):
+                 else:
+                     raise RuntimeError("Duplicate controller module fou=
nd for %s. Layers should create unique controller module names" % module)
+=20
+-        for p in sys.path:
++        # sys.path can contain duplicate paths, but because of the logi=
n in
++        # add_controller_list this doesn't work and causes testimage to=
 abort.
++        # Remove duplicates using an intermediate dictionary to ensure =
this
++        # doesn't happen.
++        for p in list(dict.fromkeys(sys.path)):
+             controllerpath =3D os.path.join(p, 'oeqa', 'controllers')
+             if os.path.exists(controllerpath):
+                 add_controller_list(controllerpath)
+--=20
+2.25.1
+
diff --git a/ci/base.yml b/ci/base.yml
index 9a59de79..d19901dd 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -19,6 +19,10 @@ repos:
     layers:
       meta:
       meta-poky:
+    patches:
+      oeqa-duplicates:
+        repo: meta-arm
+        path: ci/0001-oeqa-runtime-context-remove-duplicate-sys.path-ent=
ri.patch
=20
 env:
   BB_LOGCONFIG: ""
--=20
2.25.1


