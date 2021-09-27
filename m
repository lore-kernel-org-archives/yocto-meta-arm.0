Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06F5C433FE
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.30952.1632747366292809913
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC796D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952AF3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm-bsp/fvp-base: tell FVP to exit on shutdown
Date: Mon, 27 Sep 2021 13:55:56 +0100
Message-Id: <20210927125602.3400822-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2229

Pass bp.ve_sysregs.exit_on_shutdown=3D1 so that the FVP exits if the
emulated machine shutsdown, which is typically the desired behaviour.

Change-Id: Id2f92df4af67ca5cadc645948eccf9c93af3f8f9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index b74daf67..e43c6a01 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
=20
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
 FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
+FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
--=20
2.25.1


