Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70495C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 22:18:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.111.1646432297034107406
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 14:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E4D143D;
	Fri,  4 Mar 2022 14:18:16 -0800 (PST)
Received: from e127418.arm.com (unknown [10.57.4.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 659823F70D;
	Fri,  4 Mar 2022 14:18:15 -0800 (PST)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH] corstone1000: update meta-arm-image for kirkstone support.
Date: Fri,  4 Mar 2022 22:16:26 +0000
Message-Id: <20220304221626.37807-1-harry.moulton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 22:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3118

From: Harry Moulton <harry.moulton@arm.com>

Update the sha for meta-arm-image in the corstone1000 kas file to
add support for kirkstone. Without this support corstone1000 does
not build.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 kas/corstone1000-base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index f6ba3e7b..64e3aaf1 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,7 @@ repos:
=20
   meta-arm-image:
      url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-im=
age.git
-     refspec: e6dc0edbc61d633b6cccb9188103455f6ae7a7ea
+     refspec: 9f611833ef58394b707836d69356c4e27d0265fc=20
=20
 local_conf_header:
   base: |
--=20
2.25.1


