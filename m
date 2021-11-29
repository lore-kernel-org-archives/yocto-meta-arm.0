Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BAFC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:23:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.61564.1638195815065647422
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D898C1042
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CA33F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/edk2-firmware: upgrade to edk2-firmware 202108
Date: Mon, 29 Nov 2021 14:23:27 +0000
Message-Id: <20211129142330.4018944-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2472

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb | 4 ----
 meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202105.bb
deleted file mode 100644
index e3c3d9f8..00000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "e1999b264f1f9d7230edf2448f757c73da567832"
-SRCREV_edk2-platforms ?=3D "86984c17d562fc60a6dabbc3a479d79163656a0c"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202108.bb
new file mode 100644
index 00000000..58c0e4b7
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?=3D "7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5"
+SRCREV_edk2-platforms ?=3D "64394fd2b48f403330feb8f7e954d1cca0822af5"
+
+require edk2-firmware.inc
--=20
2.25.1


