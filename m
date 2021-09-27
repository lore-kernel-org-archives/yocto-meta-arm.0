Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03D2C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 12:56:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30757.1632747367166163043
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 05:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F72011D4
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B22F3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 05:56:06 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm-bsp/fvp-base: enable user-mode networking in runfvp
Date: Mon, 27 Sep 2021 13:55:57 +0100
Message-Id: <20210927125602.3400822-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927125602.3400822-1-ross.burton@arm.com>
References: <20210927125602.3400822-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 12:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2230

Enable user-mode networking with virtio out of the box.  This way port
forwarding can be configured easily without needing to setup host tap
ports.

Moving forward this may be controlled more by runfvp with the machine
configuration simply saying what configuration parameter to use (in this
case, bp.virtio_net), but this is a good starting point to iterate from.

Change-Id: I0b610df87c7dd2c8e3e213daaa967618babbdc7c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index e43c6a01..06a8bd93 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -19,6 +19,8 @@ KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
 FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
 FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
--=20
2.25.1


