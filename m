Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0020C46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.137393.1671120970568229993
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4746C1424;
	Thu, 15 Dec 2022 08:16:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B8543F73B;
	Thu, 15 Dec 2022 08:16:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 2/8] CI: add tags to all jobs
Date: Thu, 15 Dec 2022 16:16:00 +0000
Message-Id: <20221215161606.1194188-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4186

Tag all jobs with the DEFAULT_TAG variable so each instance can control
what tags the jobs have, whilst still explicitly tagging the jobs which
need specific tags (such as x86_64 for jobs which need to run x86-only
binaries)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 45d9902e..16ded78d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,8 @@ stages:
=20
 # Common job fragment to get a worker ready
 .setup:
+  tags:
+    - $DEFAULT_TAG
   stage: build
   interruptible: true
   variables:
@@ -262,6 +264,8 @@ machine-coverage:
   script:
     - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
+  tags:
+    - x86_64
=20
 metrics:
   extends: .setup
--=20
2.34.1


