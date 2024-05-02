Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB02C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 09:52:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9579.1714643526207752657
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 02:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7645F339;
	Thu,  2 May 2024 02:52:31 -0700 (PDT)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.195.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642E23F793;
	Thu,  2 May 2024 02:52:05 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] kas: corstone1000: include TS and PSA dependency for firmware image build
Date: Thu,  2 May 2024 10:51:58 +0100
Message-Id: <20240502095158.2793406-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502095158.2793406-1-emekcan.aras@arm.com>
References: <20240502095158.2793406-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 09:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5685

From: Emekcan Aras <emekcan.aras@arm.com>

Includes TS and PSA dependency for firmware image build.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 kas/corstone1000-image-configuration.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index a3ed6f4f..4c3172a5 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -38,6 +38,7 @@ local_conf_header:
=20
     # TS PSA API tests commands for crypto, its, ps and iat
     CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
+    CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "packagegroup-ts-tests-psa"
=20
     # external system firmware
     CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "external-system-elf"
--=20
2.25.1


