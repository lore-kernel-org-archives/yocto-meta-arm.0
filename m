Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2C1C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 16:44:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.350.1645807470609271988
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 08:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FCE1ED1
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 08:44:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE9BF3F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 08:44:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: temporarily pin meta-oe to pre-python-wheel
 removal until oe-core catches up"
Date: Fri, 25 Feb 2022 16:44:27 +0000
Message-Id: <20220225164427.1747162-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 16:44:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3070

python3-wheel is now in oe-core, so we need to use the meta-oe without
python3-wheel.

This reverts commit 5e59ebf2d3bd4c6ae580af50e299f7a75dcd72fb.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-openembedded.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 91343f0f..bed338da 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: 44a810f34e20c7985b0bcbdf71943799b278ecc7
     layers:
       meta-filesystems:
       meta-networking:
--=20
2.25.1


