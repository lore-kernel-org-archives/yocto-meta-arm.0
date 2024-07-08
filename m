Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDA2C3DA46
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 11:55:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.77879.1720439715321821895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 04:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F169315DB;
	Mon,  8 Jul 2024 04:55:39 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2CF43F766;
	Mon,  8 Jul 2024 04:55:13 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/2] arm-bsp/optee:corstone1000: Update optee to v4.2
Date: Mon,  8 Jul 2024 13:54:59 +0200
Message-Id: <20240708115500.660234-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240708115500.660234-1-bence.balogh@arm.com>
References: <20240708115500.660234-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jul 2024 11:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5869

From: Bence Balogh <bence.balogh@arm.com>

Update the preferred version of OP-TEE OS for Cortsone-1000 from
4.1.x to 4.2.x to benefit from the latest fixes and improvements.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index c78cc061..dedea7c2 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -14,7 +14,7 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "4.1.%"
+PREFERRED_VERSION_optee-os ?=3D "4.2.%"
=20
 # Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
--=20
2.25.1


