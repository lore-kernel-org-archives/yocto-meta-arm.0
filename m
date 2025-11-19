Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640DDCF34B5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:08:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7783.1763561294827416486
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=temperror, err=temporary DNS error (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11175FEC;
	Wed, 19 Nov 2025 06:08:05 -0800 (PST)
Received: from LXKV206JHX.emea.arm.com (LXKV206JHX.cambridge.arm.com [10.1.33.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 275EC3F740;
	Wed, 19 Nov 2025 06:08:12 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] kas/corstone1000: Use BitBake and OE Core instead of Poky
Date: Wed, 19 Nov 2025 14:07:57 +0000
Message-ID: <20251119140757.66463-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6773

As the Poky layer will no longer be updated following
the integration of `bitbake-setup`, developers are advised to
use a combination of the `bitbake` and `openembedded-core`
layers instead of the `poky` layer.

Note that the `poky` layer is a combination of these two
layers glued into a single repository for convenience.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-base.yml | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index c36b294a..4438bcb8 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -8,19 +8,27 @@ defaults:
     branch: master
=20
 repos:
-  meta-arm:
+  bitbake:
+    url: https://git.openembedded.org/bitbake
     layers:
-      meta-arm:
-      meta-arm-bsp:
-      meta-arm-toolchain:
+      bitbake: disabled
=20
-  poky:
-    url: https://git.yoctoproject.org/git/poky
-    # commit: 5465094be9a61a1639e1dab6d2b4ebea2bee7440
+  core:
+    url: https://git.openembedded.org/openembedded-core
     layers:
       meta:
+
+  meta-yocto:
+    url: https://git.yoctoproject.org/meta-yocto
+    layers:
       meta-poky:
=20
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
     # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
--=20
2.50.1


