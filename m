Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C11C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:38:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.200408.1698327513027282906
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 06:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356652F4
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 06:39:14 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8412C3F7C5
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 06:38:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/edk2: remove 202211
Date: Wed, 25 Oct 2023 17:44:48 -0500
Message-Id: <20231025224448.3921419-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025224448.3921419-1-jon.mason@arm.com>
References: <20231025224448.3921419-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 13:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5179

202211 is no longer referenced and can be removed

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
deleted file mode 100644
index 378f5854..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
-SRCREV_edk2-platforms ?=3D "982212662c71b6c734b7578526071d6b78da3bcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
--=20
2.30.2


