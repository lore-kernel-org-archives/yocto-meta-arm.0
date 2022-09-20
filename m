Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66422ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:58:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12259.1663682316515566481
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 06:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7E5413D5;
	Tue, 20 Sep 2022 06:58:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEF8E3F73D;
	Tue, 20 Sep 2022 06:58:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][dunfell] arm/trusted-firmware-a: update mbedtls branch name
Date: Tue, 20 Sep 2022 14:58:29 +0100
Message-Id: <20220920135829.1364872-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 13:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3790

The mbedtls repository renamed the 2.18 branch from mbedtls-2.18 to
archive/mbedtls-2.18.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index bbbff5de..e784bd74 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -24,7 +24,7 @@ SRC_URI[tfa.sha256sum] =3D "7c4c00a4f28d3cfbb235fd1a1fb=
28c4d2fc1d657c9301686e7d882
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
 #
=20
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.18"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Darchive/mbedtls-2.18"
=20
 # mbed TLS v2.18.1
 SRCREV_mbedtls =3D "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
--=20
2.34.1


