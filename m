Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADD2C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 17:38:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3179.1743788292875832077
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 10:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0F71516
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:38:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A8733F63F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:38:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone] CI: use canonical git.yoctoproject.org URLs
Date: Fri,  4 Apr 2025 18:38:09 +0100
Message-ID: <20250404173809.3909648-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 17:38:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6448

The canonical repository URLs don't use /git/.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml        | 2 +-
 ci/meta-zephyr.yml | 2 +-
 ci/update-repos    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 2c127290..7bd3937f 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -15,7 +15,7 @@ repos:
       meta-arm-toolchain:
=20
   poky:
-    url: https://git.yoctoproject.org/git/poky
+    url: https://git.yoctoproject.org/poky
     layers:
       meta:
       meta-poky:
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bb..4235cce6 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -5,7 +5,7 @@ header:
=20
 repos:
   meta-zephyr:
-    url: https://git.yoctoproject.org/git/meta-zephyr
+    url: https://git.yoctoproject.org/meta-zephyr
     layers:
       meta-zephyr-core:
=20
diff --git a/ci/update-repos b/ci/update-repos
index a68257bb..d1b6c026 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -19,10 +19,10 @@ def repo_shortname(url):
             .replace('*', '.'))
=20
 repositories =3D (
-    "https://git.yoctoproject.org/git/poky",
+    "https://git.yoctoproject.org/poky",
     "https://git.openembedded.org/meta-openembedded",
-    "https://git.yoctoproject.org/git/meta-virtualization",
-    "https://git.yoctoproject.org/git/meta-zephyr",
+    "https://git.yoctoproject.org/meta-virtualization",
+    "https://git.yoctoproject.org/meta-zephyr",
     "https://github.com/kraj/meta-clang",
 )
=20
--=20
2.43.0


