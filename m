Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95188EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:01:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10387.1692622903378308301
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 06:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9AB92F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 06:02:23 -0700 (PDT)
Received: from PW04GXME.arm.com (unknown [10.57.3.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DA333F740
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 06:01:42 -0700 (PDT)
From: Mariam Elshakfy <mariam.elshakfy@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
Date: Mon, 21 Aug 2023 14:01:30 +0100
Message-Id: <20230821130132.840-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 13:01:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4971

Update TF-A version for N1SDP to align with
Arm Reference Solutions' N1SDP-2023.06.22=20
manifest

Mariam Elshakfy (1):
  arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP

 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.34.1.windows.1


