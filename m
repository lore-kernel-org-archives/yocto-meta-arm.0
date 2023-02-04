Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AF0C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 09:40:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2965.1675503649513809630
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Feb 2023 01:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48410C14;
	Sat,  4 Feb 2023 01:41:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCC33F8D6;
	Sat,  4 Feb 2023 01:40:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: pin to kas 3.2 as 3.2.1 fails
Date: Sat,  4 Feb 2023 09:40:44 +0000
Message-Id: <20230204094044.3131240-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Feb 2023 09:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4358

For some reason the kas 3.2.1 container fails:

No such file or directory: '/builds/engineering/yocto/meta-arm/ci/ci/base=
.yml'

Note the repeated /ci/, which is wrong.

Pin the kas container to 3.2 for now until this is resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d61443df..4060a5c9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas:latest-release
+image: ghcr.io/siemens/kas/kas:3.2
=20
 variables:
   CPU_REQUEST: ""
--=20
2.34.1


