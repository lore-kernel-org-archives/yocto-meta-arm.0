Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1462FC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:33:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19175.1666618425900990931
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9F0ED1;
	Mon, 24 Oct 2022 06:33:51 -0700 (PDT)
Received: from e126544.cambridge.arm.com (e126544.cambridge.arm.com [10.1.199.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC943F7B4;
	Mon, 24 Oct 2022 06:33:44 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 0/4] arm-bsp/corstone1000: esrt support
Date: Mon, 24 Oct 2022 14:33:26 +0100
Message-Id: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4016

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

This patchset is reverting bumping the sha of the TFM
and only appling the necessary patches on top of v1.6
In addition to a trusted-services patch to support=20
ESRT on corstone1000

Mohamed Omar Asaker (3):
  Revert "arm-bsp/trusted-firmware-m: corstone1000: secure debug code
    checkout from yocto"
  Revert "arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA"
  arm-bsp/trusted-firmware-m: corstone1000 support FMP image info

Satish Kumar (1):
  arm-bsp/trusted-service: corstone1000: esrt support

 ...e1000-platform-secure-test-framework.patch | 359 +++++++++++
 ...ake-external-system-support-optional.patch |  77 +++
 ...ble-secure-enclave-run-without-host-.patch | 298 +++++++++
 ...on-Allow-configuration-of-input-and-.patch |  72 +++
 ...pport-for-UEFI-FMP-image-Information.patch | 573 ++++++++++++++++++
 ...0-remove-two-partition-configuration.patch |  51 ++
 .../trusted-firmware-m-corstone1000.inc       |  36 +-
 .../0020-FMP-Support-in-Corstone1000.patch    | 417 +++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 9 files changed, 1858 insertions(+), 26 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0001-corstone1000-platform-secure-test-framework.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0002-corstone1000-make-external-system-support-optional.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0003-corstone1000-enable-secure-enclave-run-without-host-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0004-Platform-Partition-Allow-configuration-of-input-and-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0005-corstone1000-support-for-UEFI-FMP-image-Information.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0006-corstone1000-remove-two-partition-configuration.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0020-FMP-Support-in-Corstone1000.patch

--=20
2.25.1


