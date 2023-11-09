Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA45CC4167D
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 10:58:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.119062.1699527489503125682
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 02:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA49712FC;
	Thu,  9 Nov 2023 02:58:52 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 640AD3F64C;
	Thu,  9 Nov 2023 02:58:07 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/u-boot: corstone1000: scatter gather list workaround for ondisk capsule update
Date: Thu,  9 Nov 2023 10:58:02 +0000
Message-Id: <20231109105803.1577272-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Nov 2023 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5219

From: Emekcan Aras <emekcan.aras@arm.com>

Corstone1000 capsule update implementation does not support use of
scatter_gather_list. This workaround passes 1 as scatter_gather_list valu=
e
to pass the NULL checks for scatter_gather_list while
CAPSULE_FLAGS_PERSIST_ACROSS_RESET flag is set (which is introduced latel=
y to
align with UEFI specs). Since these flag checks are not implemented in u-=
boot
properly and corstone1000 does not support scatter_gather_list during cap=
sule
update, this patch will skip the check only for on-disk capsule update.
This will be fixed with new capsule update design.

Emekcan Aras (1):
  arm-bsp/u-boot: corstone1000: scatter gather list workaround for
    ondisk capsule update

 .../u-boot/u-boot-corstone1000.inc            |  1 +
 .../0041-scatter-gather-flag-workaround.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
041-scatter-gather-flag-workaround.patch

--=20
2.25.1


