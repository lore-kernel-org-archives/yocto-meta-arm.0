Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385D3C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 11:03:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5772.1665745404033771554
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 04:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61C3813D5;
	Fri, 14 Oct 2022 04:03:29 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.36.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32EBA3F792;
	Fri, 14 Oct 2022 04:03:22 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/4] arm-bsp/corstone1000: add partial esrt support
Date: Fri, 14 Oct 2022 12:02:47 +0100
Message-Id: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 11:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3963

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Add esrt support in u-boot and TFM

Satish Kumar (4):
  arm-bsp/u-boot: corstone1000: esrt support
  arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA
  arm-bsp/trusted-firmware-m: corstone1000: fix sournce dir of libmetal
    and openamp
  arm-bsp/trusted-firmware-m: corstone1000: secure debug code checkout
    from yocto

 .../trusted-firmware-m-corstone1000.inc       |  31 ++-
 .../0030-arm-corstone1000-esrt-support.patch  | 223 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +-
 3 files changed, 254 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-arm-corstone1000-esrt-support.patch

--=20
2.25.1


