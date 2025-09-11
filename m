Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAC6CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:22:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45200.1757593323564992150
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 05:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB2EA153B
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Sep 2025 05:21:54 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 968ED3F66E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Sep 2025 05:22:02 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci/selftest: remove rm_work
Date: Thu, 11 Sep 2025 08:22:01 -0400
Message-Id: <20250911122201.35040-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Sep 2025 12:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6701

oe-selftest is now logging having rm_work enabled as an error, which is
causing the test to fail.  Remove this from the selftest.yml file, and
everything works as before.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/selftest.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/selftest.yml b/ci/selftest.yml
index e36d62c568b8..151a1bbdf6e8 100644
--- a/ci/selftest.yml
+++ b/ci/selftest.yml
@@ -7,3 +7,4 @@ local_conf_header:
   setup: |
     BB_LOGCONFIG =3D ""
     SANITY_TESTED_DISTROS =3D ""
+    INHERIT:remove =3D "rm_work"
--=20
2.39.5 (Apple Git-154)


