Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04FFC41513
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 15:17:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13775.1690384657498264209
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 08:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 090671692;
	Wed, 26 Jul 2023 08:18:20 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 385E23F67D;
	Wed, 26 Jul 2023 08:17:36 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory from NWd on N1SDP
Date: Wed, 26 Jul 2023 16:17:24 +0100
Message-Id: <20230726151725.1231013-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 15:17:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4921

From: Adam Johnston <adam.johnston@arm.com>

The physical memory which is used to run OP-TEE on the N1SDP is known
to the secure world via TOS_FW_CONFIG, but it may not be known to the
normal world.

As a precaution, explicitly reserve this memory via NT_FW_CONFIG to
prevent the normal world from using it. This is not required on most
platforms as the Trusted OS is run from secure RAM.

Adam Johnston (1):
  arm-bsp/trusted-firmware-a: Reserve OP-TEE memory from NWd on N1SDP

 .../0001-Reserve-OP-TEE-memory-from-nwd.patch | 41 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              |  6 +++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/0001-Reserve-OP-TEE-memory-from-nwd.patch

--=20
2.25.1


