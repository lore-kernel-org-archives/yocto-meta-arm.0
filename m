Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC05C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:48:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5508.1648216138111208929
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF53512FC
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63ECE3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm-bsp/fvp-arm32: synchonise kernel config
Date: Fri, 25 Mar 2022 13:48:50 +0000
Message-Id: <20220325134853.3068169-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3208

fvp-base pulls in features/net/net.scc, so fvp-base-arm32 should too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/fvp-arm32.scc
index 15bb4831..ff7ce572 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32.scc
@@ -1,4 +1,5 @@
 include features/input/input.scc
+include features/net/net.scc
 include cfg/timer/no_hz.scc
 include cfg/virtio.scc
=20
--=20
2.25.1


