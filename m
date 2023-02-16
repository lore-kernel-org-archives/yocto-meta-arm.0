Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C50C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:34:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12769.1676561639858303062
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 07:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3039F1042;
	Thu, 16 Feb 2023 07:34:42 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A1C83F703;
	Thu, 16 Feb 2023 07:33:58 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] arm-bsp/classes: Use :append to add to IMAGE_TYPES in wic_nopt
Date: Thu, 16 Feb 2023 15:33:40 +0000
Message-Id: <20230216153340.1211690-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216153340.1211690-1-peter.hoyes@arm.com>
References: <20230216153340.1211690-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 15:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4407

From: Peter Hoyes <Peter.Hoyes@arm.com>

IMAGE_TYPES +=3D "wic.nopt" is effective if the bbclass is included
using IMAGE_CLASSES, but not if included directly (using inherit) due to
file parse ordering.

To support applying wic_nopt locally (i.e. for certain image recipes but
not others), change to use :append.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/wic_nopt.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/wic_nopt.bbclass b/meta-arm/classes/wic_nop=
t.bbclass
index 322be498..9c78fd77 100644
--- a/meta-arm/classes/wic_nopt.bbclass
+++ b/meta-arm/classes/wic_nopt.bbclass
@@ -1,7 +1,7 @@
 # This class removes the empty partition table header
 # in the WIC file when --no-table WKS option is used
=20
-IMAGE_TYPES +=3D "wic.nopt"
+IMAGE_TYPES:append =3D " wic.nopt"
=20
 CONVERSIONTYPES +=3D "nopt"
=20
--=20
2.34.1


