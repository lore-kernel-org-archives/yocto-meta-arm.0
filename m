Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE827C001DB
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 14:25:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.135592.1692109515665116761
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 07:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8493E1063;
	Tue, 15 Aug 2023 07:25:57 -0700 (PDT)
Received: from PW04GXMM.cambridge.arm.com (PW04GXMM.arm.com [10.1.32.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50DAB3F6C4;
	Tue, 15 Aug 2023 07:25:14 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	anusmita <anusmita@PW04GXMM.arm.com>
Subject: [PATCH 0/2] arm-bsp/corstone1000: Add unique guid
Date: Tue, 15 Aug 2023 15:24:48 +0100
Message-Id: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Aug 2023 14:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4960

From: anusmita <anusmita@PW04GXMM.arm.com>

Add new Corstone-1000 firmware GUID and remove previous GUID to
be updated into ESRT table.
SR-IR 2.0 requires the capsule GUID to be unique.

Anusmita Dutta Mazumder (2):
  arm-bsp/u-boot: corstone1000: add unique firmware GUID
  arm-bsp/trusted-firmware-m: corstone1000: add unique firmware GUID

 ...orstone1000-add-unique-firmware-GUID.patch | 35 ++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 ...ne1000-ESRT-add-unique-firmware-GUID.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 4 files changed, 84 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-corstone1000-add-unique-firmware-GUID.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-corstone1000-ESRT-add-unique-firmware-GUID.patch

--=20
2.34.1


