Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435E5C636CC
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:47:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.99068.1700761646854018681
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 09:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E21EA1042;
	Thu, 23 Nov 2023 09:48:12 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABBC83F7A6;
	Thu, 23 Nov 2023 09:47:25 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 4/5] arm-bsp/corstone1000-fvp: Disable Time Annotation
Date: Thu, 23 Nov 2023 17:47:10 +0000
Message-Id: <20231123174711.2175145-5-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123174711.2175145-1-emekcan.aras@arm.com>
References: <20231123174711.2175145-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 17:47:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5269

From: Emekcan Aras <emekcan.aras@arm.com>

Timing Annotation is a feature of the model that enables high-level
performance estimations to be made [1]. This currently doesn't work
properly with the new models and it's recommended to unset FASTSIM_DISABL=
E_TA.

[1] https://developer.arm.com/documentation/100965/1119/Timing-Annotation

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index b2ed0fdf..9c070b3d 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -16,6 +16,9 @@ FVP_PROVIDER ?=3D "fvp-corstone1000-native"
 FVP_EXE ?=3D "FVP_Corstone-1000"
 FVP_CONSOLE ?=3D "host_terminal_0"
=20
+#Disable Time Annotation
+FASTSIM_DISABLE_TA =3D "0"
+
 # FVP Parameters
 FVP_CONFIG[se.trustedBootROMloader.fname] ?=3D "bl1.bin"
 FVP_CONFIG[board.xnvm_size] ?=3D "64"
--=20
2.25.1


