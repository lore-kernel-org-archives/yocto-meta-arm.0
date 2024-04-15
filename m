Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79310C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 15:07:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23595.1713193659488030689
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 08:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37C2D2F4;
	Mon, 15 Apr 2024 08:08:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5231F3F64C;
	Mon, 15 Apr 2024 08:07:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/fvp-base: improve FVP performance
Date: Mon, 15 Apr 2024 15:07:35 +0000
Message-Id: <20240415150735.3443599-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 15:07:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5543

Increase the number of TLB entries from 0x80 to 0x400 and disable the
checking of memory attributes.  In our CI, this makes testimage run in
576s instead of 803s.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 39ef38be..f621cd8b 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -47,6 +47,10 @@ FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D=
 "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[cluster0.check_memory_attributes] ?=3D "0"
+FVP_CONFIG[cluster1.check_memory_attributes] ?=3D "0"
+FVP_CONFIG[cluster0.stage12_tlb_size] ?=3D "1024"
+FVP_CONFIG[cluster1.stage12_tlb_size] ?=3D "1024"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
--=20
2.34.1


