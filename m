Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80234EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:19:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19730.1686838784257014765
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87022F4;
	Thu, 15 Jun 2023 07:20:27 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBA663F663;
	Thu, 15 Jun 2023 07:19:42 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH mickledore 02/17] optee-os: remove v3.18 pin of OP-TEE on qemuarm64-secureboot
Date: Thu, 15 Jun 2023 16:19:15 +0200
Message-Id: <20230615141930.2407-2-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4785

To enable up-to date version of Trusted Services op-tee v3.20 or newer
is needed.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 7277817d..55c4cab4 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -23,6 +23,3 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
=20
 MACHINE_FEATURES +=3D "optee-ftpm"
-
-PREFERRED_VERSION_optee-os ?=3D "3.18.%"
-
--=20
2.39.1.windows.1


