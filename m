Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906F7C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:57:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61511.1686581823890315550
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 07:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8276C1FB;
	Mon, 12 Jun 2023 07:57:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 019553F5A1;
	Mon, 12 Jun 2023 07:57:02 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] arm/scp-firmware: use concerete toolchain
Date: Mon, 12 Jun 2023 15:56:59 +0100
Message-Id: <20230612145659.934478-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612145659.934478-1-ross.burton@arm.com>
References: <20230612145659.934478-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 14:57:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4761

From: Ross Burton <ross.burton@arm.com>

There are not any alternatives for the virtual/arm-non-eabi-gcc provider,
so just use the real recipe name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
index 0bbd88c0..700120cf 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
@@ -21,7 +21,7 @@ SCP_LOG_LEVEL       ?=3D "WARN"
 SCP_PLATFORM_FEATURE_SET ?=3D "0"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
-DEPENDS =3D "virtual/arm-none-eabi-gcc-native \
+DEPENDS =3D "gcc-arm-none-eabi-native \
            cmake-native \
            ninja-native \
           "
--=20
2.34.1


