Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9D9C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:11:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1830.1645114279929444732
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82E57113E;
	Thu, 17 Feb 2022 08:11:19 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2233F718;
	Thu, 17 Feb 2022 08:11:18 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/6] arm-bsp/conf: Use real-time clock for fvp-baser-aemv8r64
Date: Thu, 17 Feb 2022 16:09:58 +0000
Message-Id: <20220217160959.4157807-6-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3020

From: Peter Hoyes <Peter.Hoyes@arm.com>

Enable the bp.refcounter.use_real_time option, so that the CNTPCT_EL0
increments in real-time instead of simulator time.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I197d6de4a7316e5299aee34e64e149cbd3d515a9
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index f7bed76..1f1b170 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -62,3 +62,4 @@ FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
 FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
+FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
--=20
2.25.1


