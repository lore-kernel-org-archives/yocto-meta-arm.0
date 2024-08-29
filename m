Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6142C73C66
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:05:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10013.1724929515358662451
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 04:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27020DA7;
	Thu, 29 Aug 2024 04:05:41 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 141D23F66E;
	Thu, 29 Aug 2024 04:05:13 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 0/3] Add Secure Debug optional feature to Corstone-1000
Date: Thu, 29 Aug 2024 13:05:02 +0200
Message-Id: <20240829110505.55826-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 11:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6006

From: Bence Balogh <bence.balogh@arm.com>

The patchset:
  - Adds the psa-adac library as a TF-M dependency
  - Adds the necessary TF-M patches to make the Secure Debug work
  - Adds kas file that can be used to enable Secure Debug
  - Adds new CI entry to run Secure Debug
  - Updates Corstone-1000 user guide

Bence Balogh (3):
  arm-bsp/trusted-firmware-m: corstone1000: add Secure Debug
  arm-bsp/documentation: corstone1000: add Secure Debug test
  CI: Add secure debug build for Corstone-1000

 .gitlab-ci.yml                                |   2 +
 ci/secure-debug.yml                           |   8 ++
 .../corstone1000/images/ExternalFlash.png     | Bin 54896 -> 64795 bytes
 .../documentation/corstone1000/user-guide.rst |  66 +++++++++++
 .../corstone1000-flash-firmware-image.bb      |   8 +-
 ...m-CS1000-Increase-BL2-partition-size.patch | 111 ++++++++++++++++++
 ...-Add-PSA_WANT_ALG_SHA_256-definition.patch |  42 +++++++
 ...m-CS1000-Add-crypto-configs-for-ADAC.patch |  39 ++++++
 ...orm-CS1000-Fix-platform-name-in-logs.patch |  27 +++++
 .../0001-PSA-revert-header-versions.patch     |  41 +++++++
 ...nk-psa_interface-instead-of-tfm_sprt.patch |  35 ++++++
 ...-Fix-psa_key_handle_t-initialization.patch |  32 +++++
 .../trusted-firmware-m-corstone1000.inc       |  13 ++
 .../wic/corstone1000-flash-firmware.wks.in    |  10 +-
 .../trusted-firmware-m-2.1.0-src.inc          |   8 +-
 15 files changed, 434 insertions(+), 8 deletions(-)
 create mode 100644 ci/secure-debug.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Platform-CS1000-Increase-BL2-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-Platform-CS1000-Fix-platform-name-in-logs.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0001-PSA-revert-header-versions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch

--
2.25.1


