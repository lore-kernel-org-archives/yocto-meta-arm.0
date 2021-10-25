Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700C3C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 13:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.31864.1635167648722090677
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B7A5D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 06:14:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0FE93F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 06:14:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use honister branch for meta-clang
Date: Mon, 25 Oct 2021 14:14:05 +0100
Message-Id: <20211025131405.2043050-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 13:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2294

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 063f72d9..f4573fa7 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: master
+    refspec: honister
=20
 local_conf_header:
   clang: |
--=20
2.25.1


