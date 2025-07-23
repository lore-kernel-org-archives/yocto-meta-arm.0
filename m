Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA808C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:45:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18102.1753285545803695991
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 08:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 497AA1CE2;
	Wed, 23 Jul 2025 08:45:39 -0700 (PDT)
Received: from LD2MDJPLW0.emea.arm.com (LD2MDJPLW0.cambridge.arm.com [10.1.31.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B34083F66E;
	Wed, 23 Jul 2025 08:45:44 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 0/2] arm-bsp/trusted-services: Corstone-1000: Move the MM communication buffer configs to TS CMake
Date: Wed, 23 Jul 2025 16:45:25 +0100
Message-Id: <20250723154527.48813-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Jul 2025 15:45:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6621

Michael Safwat (2):
  arm-bsp/trusted-services: Corstone-1000: Move the MM communication
    buffer configs to TS CMake
  arm-bsp/trusted-services: cpputest: fix cmake 4.0 compatibility

 ...he-com-buffer-address-and-page-count.patch | 41 ++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 .../ts-sp-se-proxy_%.bbappend                 |  4 +-
 .../ts-sp-smm-gateway_%.bbappend              |  4 +-
 ...cpputest-fix-cmake-4.0-compatibility.patch | 81 +++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |  1 +
 6 files changed, 126 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Add-the-com-buffer-address-and-page-count.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0005=
-cpputest-fix-cmake-4.0-compatibility.patch


