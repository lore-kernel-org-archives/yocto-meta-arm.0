Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B9EC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 11:18:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20805.1709810338495699041
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 03:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282241FB;
	Thu,  7 Mar 2024 03:19:35 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6223F762;
	Thu,  7 Mar 2024 03:18:57 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 0/2] Kas file and documentation updates
Date: Thu,  7 Mar 2024 11:18:34 +0000
Message-ID: <20240307111836.59383-1-drew.reed@arm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 11:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5416

From: Drew Reed <Drew.Reed@arm.com>

Updates to the referance kas files for building Corstone-1000 and modific=
ation
of the ci kas files to use them to avoid duplication information.
User Guide updates for how to build and run the FVP builds.

Drew Reed (2):
  kas: Corstone-1000 kas files updated
  bsp: Corstone-1000 userguide updates

 ci/corstone1000-common.yml                    | 39 +-------
 ci/corstone1000-firmware-only.yml             | 20 +---
 kas/corstone1000-base.yml                     | 19 ++--
 kas/corstone1000-firmware-only.yml            | 21 +++++
 kas/corstone1000-fvp.yml                      | 21 +++--
 kas/corstone1000-image-configuration.yml      | 40 ++++++++
 kas/corstone1000-mps3.yml                     |  2 +
 .../documentation/corstone1000/user-guide.rst | 91 +++++++++----------
 8 files changed, 134 insertions(+), 119 deletions(-)
 create mode 100644 kas/corstone1000-firmware-only.yml
 create mode 100644 kas/corstone1000-image-configuration.yml

--
2.44.0


