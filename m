Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CF9C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40772.1710761167037089827
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 04:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9187FDA7;
	Mon, 18 Mar 2024 04:26:41 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.39.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21D83F762;
	Mon, 18 Mar 2024 04:26:05 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: Update scp-firmware version
Date: Mon, 18 Mar 2024 11:25:49 +0000
Message-Id: <20240318112550.7284-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5444

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Remove scp-firmware sha for intermediate version
to update to v2.13 according to the Arm Reference solutions
Feb-2024 manifest.

Anusmita Dutta Mazumder (1):
  arm-bsp/n1sdp: Update scp-firmware version

 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 3 ---
 1 file changed, 3 deletions(-)

--=20
2.34.1


