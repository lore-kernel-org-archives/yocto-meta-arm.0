Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE34CDE034
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:05:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53654.1727381138641289947
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 13:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 445E514BF
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 13:06:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7640F3F587
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 13:05:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: switch to building against styhead branches where possible
Date: Thu, 26 Sep 2024 21:05:33 +0100
Message-Id: <20240926200533.1870444-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 20:05:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6126

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/clang.yml               | 1 +
 ci/meta-secure-core.yml    | 1 +
 ci/meta-virtualization.yml | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index d1c933d0..7b550dbf 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,7 +7,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: styhead
=20
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index 402292a6..7dd5d522 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    branch: master
=20
 local_conf_header:
   toolchain: |
diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
index b34562b2..81280e73 100644
--- a/ci/meta-secure-core.yml
+++ b/ci/meta-secure-core.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-secure-core:
     url: https://github.com/Wind-River/meta-secure-core.git
+    branch: master
     layers:
       meta-secure-core-common:
       meta-signing-key:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index c0ba70ba..d699d70a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -8,3 +8,4 @@ header:
 repos:
   meta-virtualization:
     url: https://git.yoctoproject.org/meta-virtualization
+    branch: master
--=20
2.34.1


