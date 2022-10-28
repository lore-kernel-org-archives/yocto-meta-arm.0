Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED85AFA3742
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:45:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1047.1666971938727972390
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DDC91FB;
	Fri, 28 Oct 2022 08:45:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A673C3F534;
	Fri, 28 Oct 2022 08:45:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][langdale] CI: track meta-openembedded's langdale branch
Date: Fri, 28 Oct 2022 16:45:33 +0100
Message-Id: <20221028154533.1480102-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4060

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-openembedded.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index dd0f6633..bed338da 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: master
     layers:
       meta-filesystems:
       meta-networking:
--=20
2.34.1


