Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E0FC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:03:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19604.1714492987629282144
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADD142F4;
	Tue, 30 Apr 2024 09:03:33 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC7E3F73F;
	Tue, 30 Apr 2024 09:03:06 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/3] Cleanup CS1000 recipes after removing OpenAMP
Date: Tue, 30 Apr 2024 18:02:58 +0200
Message-Id: <20240430160301.802105-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:03:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5661

From: Bence Balogh <bence.balogh@arm.com>

The OpenAMP and libmetal references were removed from the TF-M and TS
recipes because only the Corstone1000 platform used them.

The docs were also updated to reflect the new A+M communication
protocol.

Bence Balogh (3):
  arm-bsp/doc: corstone1000: update A+M communication
  arm-bsp/trusted-firmware-m: remove OpenAMP and Libmetal
  arm/trusted-services: remove OpenAMP and Libmetal

 .../corstone1000/images/SecureServices.png    | Bin 57910 -> 111038 byte=
s
 .../corstone1000/software-architecture.rst    |  13 +++++----
 ...are-m-disable-address-warnings-into.patch} |   0
 ...modify-path-to-libmetal-version-file.patch |  27 ------------------
 .../trusted-firmware-m-corstone1000.inc       |  20 ++-----------
 .../trusted-services/trusted-services-src.inc |  14 +--------
 6 files changed, 11 insertions(+), 63 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/{0002-arm-trust=
ed-firmware-m-disable-address-warnings-into.patch =3D> 0001-arm-trusted-f=
irmware-m-disable-address-warnings-into.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/000=
1-cmake-modify-path-to-libmetal-version-file.patch

--
2.25.1


