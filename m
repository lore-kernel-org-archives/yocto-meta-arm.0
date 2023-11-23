Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DB9C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 10:43:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88470.1700736181617594551
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 02:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66251042;
	Thu, 23 Nov 2023 02:43:47 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.83.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07A33F73F;
	Thu, 23 Nov 2023 02:42:59 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH nanbield 4/4] arm-bsp/documentation: corstone1000: update the architecture document
Date: Thu, 23 Nov 2023 10:42:48 +0000
Message-Id: <20231123104248.74503-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123104248.74503-1-abdellatif.elkhlifi@arm.com>
References: <20231123104248.74503-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 10:43:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5254

From: Emekcan Aras <emekcan.aras@arm.com>

align the architecture document with the upcoming CORSTONE1000-2023.11 re=
lease

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../corstone1000/software-architecture.rst        | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index bf3535b2..ce8bd7e0 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -72,8 +72,10 @@ non-secure and the secure world is performed via FF-A =
messages.
=20
 An external system is intended to implement use-case specific
 functionality. The system is based on Cortex-M3 and run RTX RTOS.
-Communictaion between external system and Host(cortex-A35) is performed
-using MHU as transport mechanism and rpmsg messaging system.
+Communication between the external system and Host (Cortex-A35) is perfo=
rmed
+using MHU as transport mechanism and rpmsg messaging system (the externa=
l system
+support in Linux is disabled in this release. More info about this chang=
e can be found in the
+release-notes).
=20
 Overall, the Corstone-1000 architecture is designed to cover a range
 of Power, Performance, and Area (PPA) applications, and enable extension
@@ -157,9 +159,9 @@ Secure Firmware Update
 **********************
=20
 Apart from always booting the authorized images, it is also essential th=
at
-the device only accepts the authorized images in the firmware update
+the device only accepts the authorized (signed) images in the firmware u=
pdate
 process. Corstone-1000 supports OTA (Over the Air) firmware updates and
-follows Platform Security Firmware Update sepcification (`FWU`_).
+follows Platform Security Firmware Update specification (`FWU`_).
=20
 As standardized into `FWU`_, the external flash is divided into two
 banks of which one bank has currently running images and the other bank =
is
@@ -172,7 +174,10 @@ Image (the initramfs bundle). The new images are acc=
epted in the form of a UEFI
    :width: 690
    :alt: ExternalFlash
=20
-
+When Firmware update is triggered, u-boot verifies the capsule by checki=
ng the
+capsule signature, version number and size. Then it signals the Secure E=
nclave
+that can start writing UEFI capsule into the flash. Once this operation =
finishes
+,Secure Enclave resets the entire system.
 The Metadata Block in the flash has the below firmware update state mach=
ine.
 TF-M runs an OTA service that is responsible for accepting and updating =
the
 images in the flash. The communication between the UEFI Capsule update
--=20
2.25.1


