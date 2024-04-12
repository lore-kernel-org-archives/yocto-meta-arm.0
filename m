Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E128C04FF6
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:05:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43372.1712916337086625404
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C161113E;
	Fri, 12 Apr 2024 03:06:05 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.83.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A2EC3F64C;
	Fri, 12 Apr 2024 03:05:35 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/3] arm-bsp: corstone1000: Change MM buffer location and enable
Date: Fri, 12 Apr 2024 11:05:24 +0100
Message-Id: <20240412100527.991610-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5535

From: Emekcan Aras <Emekcan.Aras@arm.com>

MM Communicate buffer is accessed by normal world but at the moment it's=20
allocated in the secure ram. This moves mm communicate buffer to the DDR =
and=20
configures the host firewall in secure-enclave (for FVP) to ensure that=20
secure-ram is not accesible by normal-world.

Emekcan Aras (3):
  arm-bsp/u-boot: corstone1000: Change MMCOMM buffer location
  arm-bsp/trusted-services: corstone1000: Change MM comm buffer location
  arm-bsp/trusted-firmware-m: corstone1000: Enable host firewall in FVP

 ...tone1000-Enable-host-firewall-in-FVP.patch | 177 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 .../u-boot/u-boot-corstone1000.inc            |   1 +
 ...ne1000-Change-MMCOMM-buffer-location.patch |  47 +++++
 .../trusted-services/libts_%.bbappend         |   2 +-
 .../ts-sp-se-proxy_%.bbappend                 |   2 +-
 .../ts-sp-smm-gateway_%.bbappend              |   2 +-
 7 files changed, 229 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
045-Corstone1000-Change-MMCOMM-buffer-location.patch

--=20
2.25.1


