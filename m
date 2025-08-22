Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924C5CA0EFF
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9915.1755868696422461690
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B657727DD
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D55B13F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/optee-os: remove CFG_CORE_BTI from EXTRA_OEMAKE
Date: Fri, 22 Aug 2025 09:18:13 -0400
Message-Id: <20250822131813.93724-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
References: <20250822131813.93724-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6678

commit a3a2c49b2149606f314b2ee0aeba7d6becd12545 corrected a typo that
was preventing arm-branch-protection flags from being enabled.  However,
since making this change, fvp-base with trusted services enabled no
longer boots.  However, the flag that seems to be the problem on fvp
base is CFG_TA_BTI.  Since this is the only use case for
arm-branch-protection machine feature, remove it from the common file
until this issue can be properly sorted.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 68bb1226b232..3065f71f6ec1 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -31,7 +31,7 @@ EXTRA_OEMAKE +=3D " HOST_PREFIX=3D${HOST_PREFIX}"
 EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
=20
 # Enable BTI in optee
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch-=
protection', ' CFG_CORE_BTI=3D1 CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA_=
PAUTH=3Dy', '', d)}"
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch-=
protection', ' CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA_PAUTH=3Dy', '', d=
)}"
=20
 LDFLAGS[unexport] =3D "1"
 CPPFLAGS[unexport] =3D "1"
--=20
2.39.5 (Apple Git-154)


