Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2D8C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 16:31:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11857.1633710714351855248
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D3C31063
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Oct 2021 09:31:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 101C83F66F
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Oct 2021 09:31:52 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: use YP sstate mirror
Date: Fri,  8 Oct 2021 12:31:45 -0400
Message-Id: <20211008163145.7883-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Oct 2021 16:31:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2262

To speed up build times, use the global Yocto Project sstate mirror.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ci/base.yml b/ci/base.yml
index 86608b2..ad9f5fe 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -37,6 +37,11 @@ local_conf_header:
     PACKAGECONFIG:append:pn-perf = " coresight"
   noptest: |
     DISTRO_FEATURES:remove = "ptest"
+  sstate_mirror: |
+    BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+    BB_HASHSERVE = "auto"
+    BB_SIGNATURE_HANDLER = "OEEquivHash"
+    SSTATE_MIRRORS = "file://.* https://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
 
 machine: unset
 
-- 
2.17.1


