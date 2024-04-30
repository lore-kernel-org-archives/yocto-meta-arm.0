Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFD6C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:24:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10273.1714465463202144031
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 01:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 374FA2F4;
	Tue, 30 Apr 2024 01:24:49 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 276A23F793;
	Tue, 30 Apr 2024 01:24:22 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: Use git clone to fetch FW for the N1SDP
Date: Tue, 30 Apr 2024 09:24:12 +0100
Message-Id: <20240430082413.1131081-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 08:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5638

From: Adam Johnston <adam.johnston@arm.com>

git.linaro.org/landing-teams/working no longer seems to serve snapshots
in tar.gz format, breaking the N1SDP build for kirkstone.

Using same tag as the existing snapshot, fetch the binaries with a
conventional git clone, as per master.

Adam Johnston (1):
  arm-bsp/n1sdp: Use git clone to fetch FW for the N1SDP

 .../recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)


