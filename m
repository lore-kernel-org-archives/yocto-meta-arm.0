Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B87EC001CC
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 13:39:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13134.1713361158253110948
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 06:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95362339;
	Wed, 17 Apr 2024 06:39:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458473F738;
	Wed, 17 Apr 2024 06:39:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: use scarthgap branches
Date: Wed, 17 Apr 2024 13:39:15 +0000
Message-Id: <20240417133915.2957956-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 13:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5560

Upstream master and scarthgap have now diverged, so use scarthgap whilst
we prepare for release.  At the time of writing there is no scarthgap
branch for meta-clang, so leave that on master.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml  | 2 +-
 ci/clang.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 4296d270..3d868a47 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: scarthgap
=20
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index b9425fa7..953ade2e 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    branch: master
=20
 local_conf_header:
   toolchain: |
--=20
2.34.1


