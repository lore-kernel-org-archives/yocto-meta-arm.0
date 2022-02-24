Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A8EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 11:24:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8984.1645701847360174866
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 03:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0331F106F;
	Thu, 24 Feb 2022 03:24:07 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC4A3F70D;
	Thu, 24 Feb 2022 03:24:06 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH honister 6/8] arm-bsp/conf: Use real-time clock for
 fvp-baser-aemv8r64
Date: Thu, 24 Feb 2022 11:22:42 +0000
Message-Id: <20220224112244.1521611-7-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224112244.1521611-1-peter.hoyes@arm.com>
References: <20220224112244.1521611-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 11:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3054

From: Peter Hoyes <Peter.Hoyes@arm.com>

Enable the bp.refcounter.use_real_time option, so that the CNTPCT_EL0
increments in real-time instead of simulator time.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I197d6de4a7316e5299aee34e64e149cbd3d515a9
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index cfbc73d..444f83f 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -61,4 +61,5 @@ FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D=
 "0"
 FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
-FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
\ No newline at end of file
+FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
+FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
--=20
2.25.1


