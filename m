Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E296C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:54:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12008.1647622466593987508
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CA8D1576
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C061A3F7B4
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp/fvp-base: configure the FVP with v8.4 cores
Date: Fri, 18 Mar 2022 16:54:21 +0000
Message-Id: <20220318165422.1711512-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318165422.1711512-1-ross.burton@arm.com>
References: <20220318165422.1711512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3186

Configure the FVP to have v8.4 cores, instead of v8.0. This gives us more
useful instructions, such as pointer authentication.

See this document for more details:

https://developer.arm.com/documentation/102378/0201/Armv8-x-and-Armv9-x-e=
xtensions-and-features

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index f98f6cc8..3da1ef0b 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -35,6 +35,9 @@ FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
+# Set the baseline to ARMv8.4, as the default is 8.0.
+FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
+FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
 FVP_CONSOLE ?=3D "terminal_0"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
--=20
2.25.1


