Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617C7C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:00:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1589.1645113607040783470
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3011396;
	Thu, 17 Feb 2022 08:00:06 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0B63F718;
	Thu, 17 Feb 2022 08:00:04 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH honister 3/3] kas/corstone1000-base: update meta-arm-image SHA
Date: Thu, 17 Feb 2022 15:59:53 +0000
Message-Id: <20220217155953.2569183-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217155953.2569183-1-emekcan.aras@arm.com>
References: <20220217155953.2569183-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3014

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit updates the meta-arm-image SHA to drop psa-arch-test
from the build.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 0e6f97a..8a50663 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,7 @@ repos:
=20
   meta-arm-image:
      url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-im=
age.git
-     refspec: aeb0571e8bc935f3f8b15c3b27ab4275e2069b5b
+     refspec: e6dc0edbc61d633b6cccb9188103455f6ae7a7ea
=20
 local_conf_header:
   base: |
--=20
2.25.1


