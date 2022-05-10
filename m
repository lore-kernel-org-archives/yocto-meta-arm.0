Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D3CC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 10:15:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7953.1652177713168210587
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 03:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27C7211FB;
	Tue, 10 May 2022 03:15:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18FE3F66F;
	Tue, 10 May 2022 03:15:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Date: Tue, 10 May 2022 11:15:08 +0100
Message-Id: <20220510101508.2785347-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 10:15:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3374

These branches have kirkstone branches now, so use them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml               | 1 -
 ci/meta-virtualization.yml | 1 -
 2 files changed, 2 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index e5e7dd5f..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: master
=20
 local_conf_header:
   clang: |
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 8791fc3b..1cd0e21a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    refspec: master
--=20
2.25.1


