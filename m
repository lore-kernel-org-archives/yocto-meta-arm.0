Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DB5C25B6C
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18640.1698155562920975673
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 746032F4;
	Tue, 24 Oct 2023 06:53:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF6883F762;
	Tue, 24 Oct 2023 06:52:41 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] CI: don't pin corstone1000-fvp to x86-64
Date: Tue, 24 Oct 2023 14:52:35 +0100
Message-Id: <20231024135236.3510412-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024135236.3510412-1-ross.burton@arm.com>
References: <20231024135236.3510412-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5164

From: Ross Burton <ross.burton@arm.com>

Now that there's a FVP for aarch64, we don't need to pin the CI pipeline
to x86-64.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 89387405..4e09ce05 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -112,8 +112,6 @@ corstone1000-fvp:
   parallel:
     matrix:
       - TESTING: [testimage, tftf]
-  tags:
-    - x86_64
=20
 corstone1000-mps3:
   extends: .build
--=20
2.34.1


