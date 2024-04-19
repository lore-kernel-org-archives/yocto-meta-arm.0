Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9986CC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:12:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20748.1713532322397049168
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1152F;
	Fri, 19 Apr 2024 06:12:29 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E16F3F64C;
	Fri, 19 Apr 2024 06:12:00 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: Fix RSA key generation issue
Date: Fri, 19 Apr 2024 14:11:29 +0100
Message-Id: <20240419131130.1988653-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Apr 2024 13:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5566

From: Adam Johnston <adam.johnston@arm.com>

A patch was dropped when trusted-firmware-m was updated to 2.0 but it
had not yet been merged upstream (2.0 or master).

Adam Johnston (1):
  arm-bsp/corstone1000: Fix RSA key generation issue

 ...tone1000-Increase-ITS-max-asset-size.patch | 27 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-platform-corstone1000-Increase-ITS-max-asset-size.patch


