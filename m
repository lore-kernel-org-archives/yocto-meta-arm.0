Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2E3C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 15:51:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52.1686066709746525323
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 08:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 311932F4;
	Tue,  6 Jun 2023 08:52:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22F203F6C4;
	Tue,  6 Jun 2023 08:51:48 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/trusted-firmware-a: look for LTS releases when looking for releases
Date: Tue,  6 Jun 2023 16:51:46 +0100
Message-Id: <20230606155146.3937833-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 15:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4740

From: Ross Burton <ross.burton@arm.com>

TF-A has LTS releases, which are prefixed with lts- for some reason.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index b0533a1e..4d3b0bad 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -9,7 +9,7 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRCBRANCH =3D "master"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRAN=
CH}"
=20
-UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(lts-)?v(?P<pver>\d+(\.\d+)+)$"
=20
 SRCREV_FORMAT =3D "tfa"
=20
--=20
2.34.1


