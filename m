Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E993C6FA92
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 10:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26879.1664188348815845146
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 03:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97C9106F;
	Mon, 26 Sep 2022 03:32:34 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8043F73B;
	Mon, 26 Sep 2022 03:32:27 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/3] arm-bsp/edk2-firmware: Update edk2/edk2-platforms
 versions for N1SDP
Date: Mon, 26 Sep 2022 11:32:01 +0100
Message-Id: <20220926103203.1196752-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926103203.1196752-1-adam.johnston@arm.com>
References: <20220926103203.1196752-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 10:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3832

From: Adam Johnston <adam.johnston@arm.com>

Update edk2/edk2-platforms versions to align with N1SDP-2022.06.22 releas=
e.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 90c3f2ae..d5408cee 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,3 +1,8 @@
+# Align with N1SDP-2022.06.22 release
+SRCREV_edk2           =3D "b24306f15daa2ff8510b06702114724b33895d3c"
+SRCREV_edk2-platforms =3D "fdaf4eb69a8b6839aecf6d3bdd938aa5c34a8a17"
+PV .=3D "+git${SRCPV}"
+
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "n1sdp"
--=20
2.37.3


