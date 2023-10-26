Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F133C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:19:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.75195.1698337192840923499
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 09:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F406F2F4;
	Thu, 26 Oct 2023 09:20:33 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BAF13F64C;
	Thu, 26 Oct 2023 09:19:51 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/2] arm-bsp/trusted-firmware-m
Date: Thu, 26 Oct 2023 17:19:45 +0100
Message-Id: <20231026161947.2463621-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 16:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5181

From: Emekcan Aras <emekcan.aras@arm.com>

Fixes alignment issues for capsule update and updates the upstream status=
 for=20
out-of-tree patches for corstone1000.

Emekcan Aras (2):
  arm-bsp/trusted-firmware-m: fix capsule update alignment
  arm-bsp/trusted-firmware-m: update the upstream status of the
    out-of-tree patches

 ...e1000-Increase-BL2-size-in-flash-lay.patch |  2 +-
 ...-Corstone1000-Increase-BL2_DATA_SIZE.patch |  2 +-
 ...e1000-Calculate-the-new-CRC32-value-.patch |  2 +-
 ...orstone1000-add-unique-firmware-GUID.patch |  2 +-
 ...m-Corstone1000-Enable-Signed-Capsule.patch |  2 +-
 ...one1000-align-capsule-update-structs.patch | 78 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 7 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-platform-corstone1000-align-capsule-update-structs.patch

--=20
2.25.1


