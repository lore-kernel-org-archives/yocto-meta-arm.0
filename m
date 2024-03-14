Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B8BC54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:59:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16793.1710431971681304450
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639BA1007;
	Thu, 14 Mar 2024 09:00:07 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.11.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E54223F762;
	Thu, 14 Mar 2024 08:59:30 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/1] arm/trusted-services: Add recipe for block storage service
Date: Thu, 14 Mar 2024 15:59:19 +0000
Message-Id: <20240314155920.345936-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5441

From: Emekcan Aras <Emekcan.Aras@arm.com>

Adds a recipe (ts-sp-block-storage) to build the Block Storage
secure partition to enable feature development for downstream users.
Emekcan Aras (1):
  arm/trusted-services: Add recipe for block storage service

 .../trusted-services/ts-sp-block-storage_%.bbappend |  1 +
 meta-arm/recipes-security/optee/optee-os-ts.inc     |  7 +++++++
 .../trusted-services/ts-sp-block-storage_git.bb     | 13 +++++++++++++
 .../recipes-security/trusted-services/ts-uuid.inc   |  3 ++-
 4 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
block-storage_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-bloc=
k-storage_git.bb

--=20
2.25.1


