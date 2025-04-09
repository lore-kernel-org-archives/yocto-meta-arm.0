Return-Path: <yogesh.wani@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB51C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 08:59:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3928.1744189143766904012
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 01:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: yogesh.wani@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D760F15A1;
	Wed,  9 Apr 2025 01:59:03 -0700 (PDT)
Received: from localhost.localdomain (MWC6J33HQ9.cambridge.arm.com [10.1.30.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5DF03F694;
	Wed,  9 Apr 2025 01:59:02 -0700 (PDT)
From: Yogesh Wani <yogesh.wani@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Yogesh Wani <yogesh.wani@arm.com>
Subject: [PATCH 1/1] arm-bsp/documentation: corstone1000: Fix typos in the documentation
Date: Wed,  9 Apr 2025 09:57:36 +0100
Message-ID: <20250409085736.169671-2-yogesh.wani@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409085736.169671-1-yogesh.wani@arm.com>
References: <20250409085736.169671-1-yogesh.wani@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Apr 2025 08:59:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6455

The Corstone-1000 read the docs had some small typos in the
Design Overview section. Commit addresses these.

Copyright information now updated.

Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
---
 .../documentation/corstone1000/software-architecture.rst    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index 95156013..3edd2280 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2024, Arm Limited.
+ # Copyright (c) 2022-2025, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -46,7 +46,7 @@ Each subsystem provides different functionality to over=
all SoC.
=20
=20
 The Secure Enclave System, provides PSA Root of Trust (RoT) and
-cryptographic functions. It is based on an Cortex-M0+ processor,
+cryptographic functions. It is based on a Cortex-M0+ processor,
 CC312 Cryptographic Accelerator and peripherals, such as watchdog and
 secure flash. Software running on the Secure Enclave is isolated via
 hardware for enhanced security. Communication with the Secure Encalve
@@ -80,7 +80,7 @@ development.
 Overall, the Corstone-1000 architecture is designed to cover a range
 of Power, Performance, and Area (PPA) applications, and enable extension
 for use-case specific applications, for example, sensors, cloud
-connectivitiy, and edge computing.
+connectivity, and edge computing.
=20
 *****************
 Secure Boot Chain

