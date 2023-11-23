Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA58C61D97
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:43:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.99404.1700761393276290382
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 09:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2A81042;
	Thu, 23 Nov 2023 09:43:59 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 083053F7A6;
	Thu, 23 Nov 2023 09:43:11 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 0/1] arm-bsp/corstone1000: fix synchronization issue on openamp notification
Date: Thu, 23 Nov 2023 17:43:05 +0000
Message-Id: <20231123174306.2174931-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 17:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5263

From: Emekcan Aras <emekcan.aras@arm.com>

This fixes a race that is observed rarely in the FVP. It occurs in FVP
when tfm sends the notication ack in openamp, and then reset the access
request which resets the mhu registers before received by the host
processor. It implements the fix both in SE and the host processor openam=
p
wrapper. This solution enables polling on the status register of mhu unti=
l
the notificaiton is read by the host processor. (Inspired by
signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-firm=
ware-m
https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platform=
/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>

Emekcan Aras (1):
  arm-bsp/corstone1000: fix synchronization issue on openamp
    notification

 ...e1000-fix-synchronization-issue-on-o.patch |  50 +++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 ...rstone1000-fix-synchronization-issue.patch | 105 ++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 4 files changed, 157 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-platform-corstone1000-fix-synchronization-issue-on-o.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-platform-corstone1000-fix-synchronization-issue.patch

--=20
2.25.1


