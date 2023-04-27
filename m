Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F08C77B7E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:07:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25013.1682611631545628252
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 09:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC5A2F4;
	Thu, 27 Apr 2023 09:07:54 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.200.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA8913F64C;
	Thu, 27 Apr 2023 09:07:09 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: Update N1SDP to v2.8.0
Date: Thu, 27 Apr 2023 17:06:48 +0100
Message-Id: <20230427160649.21922-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Apr 2023 16:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4621

From: Adam Johnston <adam.johnston@arm.com>

N1SDP master has now updated to TF-A v2.8.0 so we should do the same.
Remove the SHA override for the N1SDP

Adam Johnston (1):
  arm-bsp/trusted-firmware-a: Update N1SDP to trusted-firmware-a v2.8.0

 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 4 ----
 1 file changed, 4 deletions(-)

--=20
2.25.1


