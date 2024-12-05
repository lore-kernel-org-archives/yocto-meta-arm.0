Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E252E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 16:00:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14902.1733414395196306301
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 07:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B5AB1063;
	Thu,  5 Dec 2024 08:00:22 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.89.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749383F5A1;
	Thu,  5 Dec 2024 07:59:53 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH styhead 0/3] arm-bsp: corstone1000: `CORSTONE1000-2024.11` release
Date: Thu,  5 Dec 2024 15:59:45 +0000
Message-Id: <20241205155948.787069-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Dec 2024 16:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6272

This patchset backports two commits related to the `CORSTONE1000-2024.11`=
 pre-release.

It also adds one commit to pin the required SHA for the dependencies.

To-Do after merge:
* Create `CORSTONE1000-2024.11` tag in meta-arm on `styhead` branch.

Hugues KAMBA MPIANA (3):
  arm-bsp/documentation: corstone1000: Amend documentation for
    CORSTONE1000-2024.11 release
  kas: corstone-1000: Update the SHA of the Yocto layer dependencies for
    the CORSTONE1000-2024.11 release.
  kas: corstone-1000: Pin Yocto layer dependencies for
    CORSTONE1000-2024.11 release

 kas/corstone1000-base.yml                     |   8 +-
 .../documentation/corstone1000/change-log.rst |  63 ++++
 .../corstone1000/release-notes.rst            |   6 +
 .../corstone1000/software-architecture.rst    |  25 +-
 .../documentation/corstone1000/user-guide.rst | 289 ++++++++++--------
 5 files changed, 245 insertions(+), 146 deletions(-)


