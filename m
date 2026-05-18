Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99159CD4F50
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 18:44:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4420.1779129878066377542
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 11:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P5xk+gBq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67438302D;
	Mon, 18 May 2026 11:44:32 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.25.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7CB13F85F;
	Mon, 18 May 2026 11:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779129877; bh=gIUGwhg2bjjpNIwKcFoJm6lrKEv1FDZ6XPyQRxn6cqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5xk+gBq39KI6pxdsQXWRvVnlTD74pFVKtkgYOfiUc5AZWgoMdYlLyKkO0Qsqygap
	 YmSZsfTSyPSshcz3o4xrQfbME3SC8HoxIP1B2nYnhkYAsb54zrIdhhbTn3V+nLQgL4
	 CbSY8hhI7ia793fArgEEasNZ1fM1tTbZMlYVcDrs=
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 4/6] ci: Add Corstone-1000 with Cortex-A320 builds
Date: Mon, 18 May 2026 19:44:07 +0100
Message-ID: <20260518184425.10215-5-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518184425.10215-1-hugues.kambampiana@arm.com>
References: <20260518184425.10215-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 18:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7046

Add CI coverage for the Corstone-1000 with Cortex-A320 FVP machine.

Build the Corstone-1000 with Cortex-A320 FVP with the firmware-only
configuration and run both `none` and `tftf`.
Also run `none` for the no-firmware build.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .gitlab-ci.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e40ae84d..9c56a5c4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -156,6 +156,15 @@ corstone1000-mps3:
       - FIRMWARE: none
         SECUREDEBUG: [none, secure-debug]
=20
+corstone1000-a320-fvp:
+  extends: .build
+  parallel:
+    matrix:
+      - FIRMWARE: corstone1000-firmware-only
+        TESTING: [none, tftf]
+      - FIRMWARE: none
+        TESTING: none
+
 documentation:
   extends: .setup
   script:

