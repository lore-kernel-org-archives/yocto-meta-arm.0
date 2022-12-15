Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00DDC25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.138300.1671120970609302741
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7C7B169C;
	Thu, 15 Dec 2022 08:16:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC3203F73B;
	Thu, 15 Dec 2022 08:16:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 3/8] CI: use the .setup fragment in machine-coverage
Date: Thu, 15 Dec 2022 16:16:01 +0000
Message-Id: <20221215161606.1194188-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4187

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 16ded78d..21bdb127 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -259,13 +259,10 @@ pending-updates:
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


