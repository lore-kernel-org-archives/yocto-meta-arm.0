Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D333C636D5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.28354.1650886281892227708
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 04:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D28E1FB;
	Mon, 25 Apr 2022 04:31:21 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com
 [10.1.30.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9B663F73B;
	Mon, 25 Apr 2022 04:31:20 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH honister 0/1] arm-bsp/trusted-firmware-a: corstone1000: update
 Tfa SHA
Date: Mon, 25 Apr 2022 12:31:11 +0100
Message-Id: <20220425113112.52438-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3294

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit updates Tfa SHA to remove the patches from the
recipe since all of them are upstreamed now.

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA

 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../0001-Rename-Diphda-to-corstone1000.patch  | 587 ------------------
 ...e1000-made-changes-to-accommodate-3M.patch | 201 ------
 ...plement-platform-specific-psci-reset.patch |  60 --
 ...change-base-address-of-FIP-in-the-fl.patch |  33 -
 ...identify-which-bank-to-load-fip-from.patch | 102 ---
 .../trusted-firmware-a-corstone1000.inc       |  13 +-
 7 files changed, 7 insertions(+), 991 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0001-Rename-Diphda-to-corstone1000.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl=
.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from=
.patch

--=20
2.25.1


