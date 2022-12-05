Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CF0C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:13:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25044.1670267607923894122
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Dec 2022 11:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8EEDD6E;
	Mon,  5 Dec 2022 11:13:31 -0800 (PST)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 381563F71A;
	Mon,  5 Dec 2022 11:13:23 -0800 (PST)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH langdale 0/1] arm-bsp/optee: register DRAM1 for N1SDP target
Date: Mon,  5 Dec 2022 19:13:08 +0000
Message-Id: <20221205191309.573109-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Dec 2022 19:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4177

From: Adam Johnston <adam.johnston@arm.com>

N1SDP has 2 DRAM's. This change is to register 2nd DRAM which starts at
0x8080000000. Linux uses 1KB of this memory to share data with optee-os.

Vishnu Banavath (1):
  arm-bsp/optee: register DRAM1 for N1SDP target

 ...lat-n1sdp-register-DRAM1-to-optee-os.patch | 52 +++++++++++++++++++
 .../recipes-security/optee/optee-os-n1sdp.inc |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0005-plat-n1sdp-register-DRAM1-to-optee-os.patch

--=20
2.25.1


