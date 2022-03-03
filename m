Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AF1C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:12:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9010.1646298731894025675
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 01:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64DCC1480;
	Thu,  3 Mar 2022 01:12:11 -0800 (PST)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com
 [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A533F73D;
	Thu,  3 Mar 2022 01:12:10 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm-bsp/docs: Improve fvp-baser-aemv864 limitation
Date: Thu,  3 Mar 2022 09:11:43 +0000
Message-Id: <20220303091144.473704-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 09:12:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3093

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add more details about the cache_state_modelled limitation, which can
be worked around by setting cci400.force_on_from_start=3D1

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Idde23278a87316dae842c6c3793b9836482e8c3a
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 85fabe5..44c755e 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -217,8 +217,11 @@ Known Issues and Limitations
 - Only PSCI CPU\_ON and CPU\_OFF functions are supported
 - Linux kernel does not support booting from secure EL2 on Armv8-R AArch=
64
 - Linux KVM does not support Armv8-R AArch64
-- Enabling the FVP parameter `cache_state_modelled` is incompatible with=
 virtio
-  devices
+- Device DMA memory cache-coherence issue: the FVP cache_state_modelled
+  parameter will affect the cache coherence behavior of peripherals=E2=80=
=99 DMA. When
+  users set cache_state_modelled=3D1, they also have to set
+  cci400.force_on_from_start=3D1 to force the FVP to enable snooping on =
upstream
+  ports.
=20
 Change Log
 ----------
--=20
2.25.1


