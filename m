Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B22DCD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:46:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23601.1781106388856545097
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OagaYvyA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 872CB2008
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:23 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E0A83F99C
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781106388; bh=InubGw8OCdOfc8kySvadrzFpMiYf/rneo5SmNbp4MqU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OagaYvyAat98yUbRyoC1nOEYYBX7gYuYK4AMzk5ZuDtjcuHDj+zgb03guW8wN/eXU
	 2nSqkUHtaLWxgN0gsyaotCGBOI4ZPISdY7aOAxMS5aQJMGoU6uDPX76eBy4llKl2z+
	 Dr6KaKRiQdbUJAeAlfDK/VAxcrS5+V5OAZMOpctU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/scp-firmware: add CVE_PRODUCT
Date: Wed, 10 Jun 2026 11:46:20 -0400
Message-ID: <20260610154620.8533-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610154620.8533-1-jon.mason@arm.com>
References: <20260610154620.8533-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7075

Per https://nvd.nist.gov/products/cpe/detail/593B1385-F4BE-452B-AE3B-5162=
7F6CAE45
add CVE_PRODUCT entry.  Since there wasn't one existing, there is no
need to remove anything.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-ar=
m/recipes-bsp/scp-firmware/scp-firmware.inc
index 4623afe81ff2..032445b3bd6a 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -96,3 +96,6 @@ do_install() {
 INSANE_SKIP:${PN}-dbg +=3D "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
+
+CVE_PRODUCT =3D "arm:scp-firmware \
+               arm:scp_firmware"
--=20
2.50.1 (Apple Git-155)


