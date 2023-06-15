Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FC7C0015E
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:20:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19740.1686838793491622986
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 632FC1FB;
	Thu, 15 Jun 2023 07:20:37 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 851483F663;
	Thu, 15 Jun 2023 07:19:52 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH mickledore 11/17] arm/trusted-services: disable psa-iat on qemuarm64-secureboot
Date: Thu, 15 Jun 2023 16:19:24 +0200
Message-Id: <20230615141930.2407-11-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4794

TF-A v2.8 does not support measured boot and FF-A which is mandatory for
PSA Initial Attestation SP to work correctly.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 ci/trusted-services.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/trusted-services.yml b/ci/trusted-services.yml
index 433ec78b..5f28dd3c 100644
--- a/ci/trusted-services.yml
+++ b/ci/trusted-services.yml
@@ -6,8 +6,8 @@ header:
 local_conf_header:
   trusted_services: |
     TEST_SUITES:append =3D " trusted_services"
-    # Include TS Crypto, Storage, ITS, Attestation and SMM-Gateway SPs i=
nto optee-os image
-    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its ts=
-attestation ts-smm-gateway"
+    # Include TS Crypto, TS Protected Storage, TS Internal Trusted Stora=
ge and SMM-Gateway SPs into optee-os image
+    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its ts=
-smm-gateway"
     # Include TS demo/test tools into image
     IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
     # Include TS PSA Arch tests into image
--=20
2.39.1.windows.1


