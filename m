Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6B0C4708D
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 20:28:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5484.1671222475313988471
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 12:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 042A01042;
	Fri, 16 Dec 2022 12:28:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB69B3F71E;
	Fri, 16 Dec 2022 12:27:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] CI: use the .setup fragment in machine-coverage
Date: Fri, 16 Dec 2022 20:27:48 +0000
Message-Id: <20221216202751.1031059-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 20:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4202

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3739e132..50d4a442 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -242,13 +242,10 @@ pending-updates:
=20
 # What percentage of machines in the layer do we build
 machine-coverage:
-  stage: build
-  interruptible: true
+  extends: .setup
   script:
     - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
-  tags:
-    - x86_64
=20
 metrics:
   extends: .setup
--=20
2.34.1


