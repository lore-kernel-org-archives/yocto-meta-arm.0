Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA3FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 16:04:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.125587.1699545844593542172
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 08:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C51E71477;
	Thu,  9 Nov 2023 08:04:48 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66BA63F64C;
	Thu,  9 Nov 2023 08:04:03 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-services: enable signaled handling interrupts for SPs
Date: Thu,  9 Nov 2023 16:03:57 +0000
Message-Id: <20231109160357.1580350-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109160357.1580350-1-emekcan.aras@arm.com>
References: <20231109160357.1580350-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Nov 2023 16:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5223

From: Emekcan Aras <emekcan.aras@arm.com>

Changes ns-interrupt-action for corstone1000. This will enable
preemption in the SPs which is the default way to handle interrupts in
trusted-firmware and optee documentation.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...stone1000-change-ns-interrupt-action.patch | 31 -------------------
 .../trusted-services/ts-arm-platforms.inc     |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-plat-corstone1000-change-ns-interrupt-action.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-plat-corstone1000-change-ns-interrupt-action.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/corstone1000/0008-plat-corstone1000-chang=
e-ns-interrupt-action.patch
deleted file mode 100644
index c50f2866..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
at-corstone1000-change-ns-interrupt-action.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7f51fa5f848b77b5aadfc553e1aeca52f4bcc5a1 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Tue, 22 Aug 2023 17:18:26 +0100
-Subject: [PATCH] platform: corstone1000: change ns-interrupt-action=20
-
-Changes ns-interrupt-action for corstone1000. The interrupts are queued =
as=20
-in the previous optee release. Currently, enabling preemption (settig th=
is field
-to 2) will halt psa-test from linux-userspace in corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../config/corstone1000-opteesp/default_se-proxy.dts.in         | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deployments/se-proxy/config/corstone1000-opteesp/default_se=
-proxy.dts.in b/deployments/se-proxy/config/corstone1000-opteesp/default_=
se-proxy.dts.in
-index cc42929d..839f7464 100644
---- a/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.=
dts.in
-+++ b/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.=
dts.in
-@@ -16,7 +16,7 @@
- 	execution-state =3D <0>; /* AArch64 */
- 	xlat-granule =3D <0>; /* 4KiB */
- 	messaging-method =3D <3>; /* Direct messaging only */
--	ns-interrupts-action =3D <2>; /* Non-secure interrupts are signaled */
-+	ns-interrupts-action =3D <0>; /* Non-secure interrupts are signaled */
- 	elf-format =3D <1>;
-=20
- 	device-regions {
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 551a67dc..6873c4e0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -9,7 +9,6 @@ SRC_URI:append:corstone1000  =3D " \
     file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
-    file://0008-plat-corstone1000-change-ns-interrupt-action.patch \
     "
=20
=20
--=20
2.25.1


