Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A49C41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.68293.1691516138439221198
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F157D143D
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:36:19 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E17B3F59C
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:35:37 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 3/6] arm-bsp: clean-up patch noise
Date: Tue,  8 Aug 2023 12:35:25 -0500
Message-Id: <20230808173528.3606903-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808173528.3606903-1-jon.mason@arm.com>
References: <20230808173528.3606903-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4945

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch | 1 -
 .../0001-armv7-adding-generic-timer-access-through-MMIO.patch    | 1 -
 .../0003-HACK-disable-instruction-cache-and-data-cache.patch     | 1 -
 .../optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch | 1 -
 .../psa-apitest/0001-corstone1000-port-crypto-config.patch       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corston=
e1000-bl2-loads-fip-based-on-metadata.patch
index 3afaa4b0..d834e95b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
@@ -16,7 +16,6 @@ image starts at fip partition + fip signature area size=
.
 Upstream-Status: Pending
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
=20
-%% original patch: 0002-feat-corstone1000-bl2-loads-fip-based-on-metadat=
a.patch
 ---
  bl2/bl2_main.c                                |  4 +++
  .../corstone1000/common/corstone1000_plat.c   | 32 ++++++-------------
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv=
7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-throu=
gh-MMIO.patch
index 3d8545ff..1d28631a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
@@ -20,7 +20,6 @@ the u-boot initcall level (timer_init) before u-boot re=
location.
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
=20
-%% original patch: 0001-armv7-adding-generic-timer-access-through-MMIO.p=
atch
=20
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
3-HACK-disable-instruction-cache-and-data-cache.patch b/meta-arm-bsp/reci=
pes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cac=
he-and-data-cache.patch
index e8f4cc44..ebe4d726 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-=
disable-instruction-cache-and-data-cache.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-=
disable-instruction-cache-and-data-cache.patch
@@ -12,7 +12,6 @@ and D cache until a proper fix is found.
=20
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
=20
-%% original patch: 0003-HACK-disable-instruction-cache-and-data-cache.pa=
tch
=20
 diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
 index 875b6e69..594d6928 100644
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
4-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/file=
s/optee-os/n1sdp/0004-Handle-logging-syscall.patch
index 67d98725..ca4405d8 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handl=
e-logging-syscall.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handl=
e-logging-syscall.patch
@@ -9,7 +9,6 @@ Subject: [PATCH] Handle logging syscall
 Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
 Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
=20
-%% original patch: 0004-Handle-logging-syscall.patch
=20
 diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kern=
el/spmc_sp_handler.c
 index e0fa0aa6..c7a45387 100644
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
psa-apitest/0001-corstone1000-port-crypto-config.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/corstone1000/psa-apitest/0001-corstone1000=
-port-crypto-config.patch
index c7289562..072b50b4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-api=
test/0001-corstone1000-port-crypto-config.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-api=
test/0001-corstone1000-port-crypto-config.patch
@@ -9,7 +9,6 @@ Subject: [PATCH] corstone1000: port crypto config
=20
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
=20
-%% original patch: 0002-corstone1000-port-crypto-config.patch
=20
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
--=20
2.30.2


