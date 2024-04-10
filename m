Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C404CD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 14:53:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1862.1712760815875405774
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 07:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C8F139F;
	Wed, 10 Apr 2024 07:54:05 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03433F766;
	Wed, 10 Apr 2024 07:53:34 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] corstone1000:arm-bsp/tftf: upgrade tftf version to v2.10
Date: Wed, 10 Apr 2024 15:53:21 +0100
Message-Id: <20240410145321.143824-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410145321.143824-1-harsimransingh.tungal@arm.com>
References: <20240410145321.143824-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Apr 2024 14:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5515

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change upgrades the tftf version to v2.10 for the Corstone-1000.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index a82d0076..7a8905d7 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -8,7 +8,7 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "2.0.%"
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.8.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
--=20
2.25.1


