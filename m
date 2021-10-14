Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904F6C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:21:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.397.1634228494012264420
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Oct 2021 09:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC66411D4;
	Thu, 14 Oct 2021 09:21:31 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.195.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6AD3F66F;
	Thu, 14 Oct 2021 09:21:31 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/docs: Update docs instructions to use honister
Date: Thu, 14 Oct 2021 17:21:20 +0100
Message-Id: <20211014162120.35347-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Oct 2021 16:21:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2269

Issue-Id: SCM-3549
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Ie8537e6574f81f90af254b19d1b38f80ef9aa6fd
---
 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b=
/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 12404a7..392449e 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -29,7 +29,7 @@ First you must download the Yocto layers needed:
  - all other layers you might want to use
=20
 For each of the downloaded layer make sure you checkout the release of Y=
octo
-you want to use (for example hardknott using `git checkout hardknott`).
+you want to use (for example honister using `git checkout honister`).
=20
 Please follow [Yocto documentation](https://www.yoctoproject.org/docs/la=
test/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
 in order to have the required dependencies.
--=20
2.25.1


