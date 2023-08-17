Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E31C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:33:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.183154.1692264778660785967
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 02:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43BFD75;
	Thu, 17 Aug 2023 02:33:38 -0700 (PDT)
Received: from PW04GXMM.arm.com (unknown [10.57.35.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3082C3F64C;
	Thu, 17 Aug 2023 02:32:57 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/1] arm-bsp/scp-firmware: Update N1SDP scp-firmware
Date: Thu, 17 Aug 2023 10:32:45 +0100
Message-Id: <20230817093246.96-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 09:33:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4964

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

The scp-firmware version in the Arm Reference Solutions N1SDP-2023.06.22
Release has now updated to a beta version beyond v2.12.
Add the SHA override for N1SDP to align to scp-firmware version used in
the release.

Anusmita Dutta Mazumder (1):
  arm-bsp/scp-firmware: Update N1SDP scp-firmware version

 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 3 +++
 1 file changed, 3 insertions(+)

--=20
2.34.1


