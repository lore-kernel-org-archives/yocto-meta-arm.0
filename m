Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165B7C636D4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11205.1675331700104240645
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3A401042;
	Thu,  2 Feb 2023 01:55:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177F03F64C;
	Thu,  2 Feb 2023 01:54:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/6] meta-arm: add build to gitignore
Date: Thu,  2 Feb 2023 09:54:51 +0000
Message-Id: <20230202095456.3113221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4348

From: Rui Miguel Silva <rui.silva@linaro.org>

To avoid having always tools that depend on git ls or other
git plumbing to include and spin around the enormous content of
the build directory.

Just add it to the ignore file and make that build content,
that will never get in the repo invisible to git and tools.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bee8a64b..ce8c7f33 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1 +1,2 @@
 __pycache__
+build
--=20
2.34.1


