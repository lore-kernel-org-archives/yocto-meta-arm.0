Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB7EEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 09:19:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54730.1688462340160117253
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 02:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211872F4;
	Tue,  4 Jul 2023 02:19:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 428D73F73F;
	Tue,  4 Jul 2023 02:18:59 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] CI: use Kas 3.3
Date: Tue,  4 Jul 2023 10:18:55 +0100
Message-Id: <20230704091857.3645929-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jul 2023 09:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4852

From: Ross Burton <ross.burton@arm.com>

Kas 3.3 has the following new features:

- kas: Introduce commit and branch as alternative to refspec key
- kas: Warn if a repo uses legacy refspec
- kas: add support for lock files via dump plugin
- kas: track root repo dir config files of menu plugin
- kas: add support for --log-level argument
- kas: add GIT_CREDENTIAL_USEHTTPPATH environment variable
- kas: improve error reporting
- kas: drop support for Python 3.5
- kas-container: fix invocations with --isar for some layers
- kas-container: Purge tmp* on clean
- kas-container: enable colored logging

4.0 is basically the same but the Kas container uses Debian 12, which is
not yet supported as a tested platform. Until Debian 12 is tested we
should continue to use 3.3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b2246743..1433d2ac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas:3.2.3
+image: ghcr.io/siemens/kas/kas:3.3
=20
 variables:
   CPU_REQUEST: ""
--=20
2.34.1


