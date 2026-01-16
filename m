Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34367C982FB
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:23:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5478.1768591436483401390
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 11:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573FD1684;
	Fri, 16 Jan 2026 11:23:49 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.81.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BD73F632;
	Fri, 16 Jan 2026 11:23:55 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH whinlatter] corstone1000: Fix Ethos-U test build for Cortex-A320 variant
Date: Fri, 16 Jan 2026 19:23:51 +0000
Message-ID: <20260116192351.23213-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Jan 2026 19:23:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6855

Update the meta-ethos layer SHA to a commit that fixes
Ethos-U test build failures caused by the migration of
ML repositories to GitLab.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-a320.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-a320.yml b/kas/corstone1000-a320.yml
index ef5f47e4..8dc79238 100644
--- a/kas/corstone1000-a320.yml
+++ b/kas/corstone1000-a320.yml
@@ -12,7 +12,7 @@ repos:
   meta-ethos:
     url: https://gitlab.arm.com/iot/meta-ethos.git
     branch: whinlatter
-    commit: aa2504a32f62d29caa17391d10c530576d27212e
+    commit: b919565c36b89af2ba61cc28024da633a9fae0da
   meta-sca:
     url: https://github.com/priv-kweihmann/meta-sca.git
     branch: master

