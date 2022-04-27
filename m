Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC47DC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 20:31:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1855.1651091502560205880
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 13:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE52ED1;
	Wed, 27 Apr 2022 13:31:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19953F5A1;
	Wed, 27 Apr 2022 13:31:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2] CI: use kirkstone branch, not master
Date: Wed, 27 Apr 2022 21:31:20 +0100
Message-Id: <20220427203120.2116813-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 20:31:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3313

Until we have released and branched meta-arm we're tracking kirkstone, no=
t
master.  oe-core has branched and master is changing fast, so switch
the default branch now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/clang.yml               | 1 +
 ci/meta-virtualization.yml | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 4c997463..6cb18589 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: master
+    refspec: kirkstone
=20
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index a2063f19..e5e7dd5f 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    refspec: master
=20
 local_conf_header:
   clang: |
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a..8791fc3b 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,3 +6,4 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    refspec: master
--=20
2.25.1


