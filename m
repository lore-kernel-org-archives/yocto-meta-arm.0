Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156E8C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11206.1675331700538576706
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F487C14;
	Thu,  2 Feb 2023 01:55:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1C2B3F64C;
	Thu,  2 Feb 2023 01:54:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/6] kas/corstone1000: move from langdale to master
Date: Thu,  2 Feb 2023 09:54:52 +0000
Message-Id: <20230202095456.3113221-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4349

From: Rui Miguel Silva <rui.silva@linaro.org>

Make sure the master branch track the other masters instead
of being lock to langdale.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 5fe7f4da..6fda343b 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
=20
 defaults:
   repos:
-    refspec: langdale
+    refspec: master
=20
 repos:
   meta-arm:
--=20
2.34.1


