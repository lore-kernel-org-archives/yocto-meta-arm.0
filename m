Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF6FC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:47:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23894.1750052831633239313
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 15 Jun 2025 22:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E245D1515;
	Sun, 15 Jun 2025 22:46:49 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.48.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64ACE3F673;
	Sun, 15 Jun 2025 22:47:10 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH walnascar 0/2] arm-bsp: corstone1000: Release CORSTONE1000-2025.05
Date: Mon, 16 Jun 2025 06:47:03 +0100
Message-Id: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 05:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6550

Based on Walnascar.

Commits include:
* Documentation updates
* Pining of SHA for layers

Hugues KAMBA MPIANA (1):
  arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05

Abdellatif El Khlifi (1):
  kas: corstone-1000: pin Yocto layer dependencies for
    CORSTONE1000-2025-05 release

 kas/corstone1000-base.yml                     |   8 +-
 .../documentation/corstone1000/change-log.rst |  66 ++-
 .../images/Corstone1000SecureFlashFVP.png     | Bin 0 -> 44060 bytes
 .../images/Corstone1000SecureFlashMPS3.png    | Bin 0 -> 44733 bytes
 .../corstone1000/images/ExternalFlash.png     | Bin 64795 -> 59864 bytes
 .../corstone1000/images/FIPDiagram.png        | Bin 0 -> 16136 bytes
 .../corstone1000/release-notes.rst            |  18 +-
 .../corstone1000/software-architecture.rst    | 528 ++++++++++--------
 .../documentation/corstone1000/user-guide.rst | 437 ++++++++-------
 9 files changed, 637 insertions(+), 420 deletions(-)
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
ne1000SecureFlashFVP.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
ne1000SecureFlashMPS3.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/FIPDia=
gram.png


