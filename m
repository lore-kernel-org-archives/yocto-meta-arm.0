Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4925CD31A31
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:25:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6619.1768382721723033534
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 01:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 831A2339;
	Wed, 14 Jan 2026 01:25:14 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.25.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E833F694;
	Wed, 14 Jan 2026 01:25:20 -0800 (PST)
From: frazer.carsley@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/3] Firmware binary path fixes
Date: Wed, 14 Jan 2026 09:24:49 +0000
Message-ID: <20260114092452.286544-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 09:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6840

From: Frazer Carsley <frazer.carsley@arm.com>

After the firmware.bbclass was added, some paths were later incorrect or
inconsistent.

The first patch deals with consistency for multiconfig builds, ensuring
that the subdirectory hierarchy is present in the ${DEPLOYDIR} after
copying the binaries across.

The second and third patches then fix paths to the some of these
binaries in Corstone1000 documentation and configs respectively.

Frazer Carsley (3):
  arm/images: ensured consistent firmware deployment
  arm-bsp/docs:corstone1000: update paths
  arm-bsp/conf:corstone1000: update bl1.bin path

 meta-arm-bsp/conf/machine/corstone1000-fvp.conf       |  2 +-
 .../documentation/corstone1000/user-guide.rst         |  4 ++--
 meta-arm/recipes-bsp/images/firmware-deploy-image.bb  | 11 +++++++----
 3 files changed, 10 insertions(+), 7 deletions(-)


