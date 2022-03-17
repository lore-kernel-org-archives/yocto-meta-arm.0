Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB79C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 16:10:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12409.1647533444652671031
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 09:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACD2C1424;
	Thu, 17 Mar 2022 09:10:43 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.41.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 424D13F7B4;
	Thu, 17 Mar 2022 09:10:42 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras's avatarEmekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone1000: remove the need for meta-arm-image 
Date: Thu, 17 Mar 2022 16:10:32 +0000
Message-Id: <20220317161033.3099761-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Mar 2022 16:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3181

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit remove meta-arm-image from the yml file and adds
necessary image configuration to meta-arm-bsp/recipes-bsp/images.
Signed-off-by: Emekcan Aras's avatarEmekcan Aras <emekcan.aras@arm.com>

Emekcan Aras (1):
  arm-bsp/corstone1000: remove the need for meta-arm-image

 ci/corstone1000-common.yml                    | 10 ++-----
 .../recipes-bsp/images/corstone1000-image.bb  | 11 ++++++++
 .../images/corstone1000-initramfs-image.bb    | 28 +++++++++++++++++++
 .../wic/corstone1000-image.corstone1000.wks   | 15 ++++++++++
 4 files changed, 57 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-initramf=
s-image.bb
 create mode 100644 meta-arm-bsp/wic/corstone1000-image.corstone1000.wks

--=20
2.25.1


