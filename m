Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1737FC7115E
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:09:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9461.1750320551543046863
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 01:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3312113E;
	Thu, 19 Jun 2025 01:08:50 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.50.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DD713F66E;
	Thu, 19 Jun 2025 01:09:10 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/trusted-services: corstone1000: Re-list patch fixing PSA Crypto Suite test
Date: Thu, 19 Jun 2025 09:09:06 +0100
Message-Id: <20250619080906.4131942-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Jun 2025 08:09:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6574

The original patch was inadvertently removed by a subsequent commit.
This change restores the patch to fix failures in the PSA Crypto
Suite test on Corstone-1000.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../recipes-security/trusted-services/ts-arm-platforms.inc       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index d9a73bc7..6d44a5c7 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -17,6 +17,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
     file://0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.pat=
ch \
     file://0015-se-proxy-protobuf-change.patch \
+    file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
     "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"

