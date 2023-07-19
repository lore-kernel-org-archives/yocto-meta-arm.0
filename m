Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAC3C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4388.1689729767263135650
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36E4313D5;
	Tue, 18 Jul 2023 18:23:30 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B69703F67D;
	Tue, 18 Jul 2023 18:22:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH v2 6/8] arm/classes: Remove IMAGE_NAME_SUFFIX from image path
Date: Tue, 18 Jul 2023 20:22:38 -0500
Message-Id: <20230719012240.3567881-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4900

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

Remove IMAGE_NAME_SUFFIX from image path in
wic_nopt.bblass

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/classes/wic_nopt.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/wic_nopt.bbclass b/meta-arm/classes/wic_nop=
t.bbclass
index 9c78fd77..529bf138 100644
--- a/meta-arm/classes/wic_nopt.bbclass
+++ b/meta-arm/classes/wic_nopt.bbclass
@@ -6,4 +6,4 @@ IMAGE_TYPES:append =3D " wic.nopt"
 CONVERSIONTYPES +=3D "nopt"
=20
 # 1024 bytes are skipped which corresponds to the size of the partition =
table header to remove
-CONVERSION_CMD:nopt =3D "tail -c +1025 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type} >  ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.nopt"
+CONVERSION_CMD:nopt =3D "tail -c +1025 ${IMAGE_NAME}.${type} >  ${IMAGE_=
NAME}.${type}.nopt"
--=20
2.30.2


