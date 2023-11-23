Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA7C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 10:43:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88464.1700736177222205631
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 02:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C7D21042;
	Thu, 23 Nov 2023 02:43:43 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.83.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A72763F73F;
	Thu, 23 Nov 2023 02:42:55 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH nanbield 1/4] arm-bsp/documentation: corstone1000: update the release note
Date: Thu, 23 Nov 2023 10:42:45 +0000
Message-Id: <20231123104248.74503-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 10:43:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5251

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

align the release note with the upcoming CORSTONE1000-2023.11 release

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../corstone1000/release-notes.rst            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 62e3f8ff..83e250d5 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -19,6 +19,27 @@ intended for safety-critical applications. Should Your=
 Software or Your Hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+***********************
+Release notes - 2023.11
+***********************
+
+Known Issues or Limitations
+---------------------------
+
+ - Use Ethernet over VirtIO due to lan91c111 Ethernet driver support dro=
pped from U-Boot.
+ - Temporally removing the External system support in Linux due to it us=
ing multiple custom devicetree bindings that caused problems with SystemR=
eady IR 2.0 certification. For External system support please refer to th=
e version 2023.06. We are aiming to restore it in a more standardised man=
ner in our next release.
+ - Due to the performance uplimit of MPS3 FPGA and FVP, some Linux distr=
os like Fedora Rawhide can not boot on Corstone-1000 (i.e. user may exper=
ience timeouts or boot hang).
+ - PSA Crypto tests (psa-crypto-api-test command) approximately take 30 =
minutes to complete for FVP and MPS3.
+ - Corstone-1000 SoC on FVP doesn't have a secure debug peripheral. It d=
oes on the MPS3.
+ - See previous release notes for the known limitations regarding ACS te=
sts.
+
+Platform Support
+-----------------
+ - This software release is tested on Corstone-1000 FPGA version AN550_v=
2
+   https://developer.arm.com/downloads/-/download-fpga-images
+ - This software release is tested on Corstone-1000 Fast Model platform =
(FVP) version 11_23.25
+   https://developer.arm.com/tools-and-software/open-source-software/arm=
-platforms-software/arm-ecosystem-fvps
+
 ***********************
 Release notes - 2023.06
 ***********************
--=20
2.25.1


