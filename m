Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E84C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 14:59:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7702.1650985185590058023
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 07:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 820EB23A
	for <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 07:59:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C2AA3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 07:59:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use kirkstone branch, not master
Date: Tue, 26 Apr 2022 15:59:42 +0100
Message-Id: <20220426145942.1126485-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 14:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3311

Until we have released and branched meta-arm we're tracking kirkstone, no=
t
master.  oe-core has branched and master is changing fast, so switch
the default branch now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/clang.yml               | 1 +
 ci/meta-openembedded.yml   | 1 +
 ci/meta-virtualization.yml | 1 +
 ci/meta-zephyr.yml         | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

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
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338da..dd0f6633 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: master
     layers:
       meta-filesystems:
       meta-networking:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a..8791fc3b 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,3 +6,4 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    refspec: master
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bb..df31ce61 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-zephyr:
     url: https://git.yoctoproject.org/git/meta-zephyr
+    refspec: master
     layers:
       meta-zephyr-core:
=20
--=20
2.25.1


