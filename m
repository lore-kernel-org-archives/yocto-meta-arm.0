Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3083E77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 11:25:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8757.1733397927605510096
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 03:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C303FEC;
	Thu,  5 Dec 2024 03:25:55 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.89.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 505A23F71E;
	Thu,  5 Dec 2024 03:25:26 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH v2 0/2] arm-bsp: corstone1000: `CORSTONE1000-2024.11` pre-release
Date: Thu,  5 Dec 2024 11:25:20 +0000
Message-Id: <20241205112522.472582-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Dec 2024 11:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6266

This patchset contains commits related to the `CORSTONE1000-2024.11`
pre-release.

Remaining steps for the release:
- [ ] Merge the commits to meta-arm `master` branch.
- [ ] Backport the commits to `styhead` branch of meta-arm.
- [ ] On `styhead` branch, add a commit to uncomment pinned dependency
  layers SHAs and change branch to `styhead` in `kas/corstone1000-base.ym=
l`.
- [ ] Create `CORSTONE1000-2024.11` tag in meta-arm on `styhead` branch
  after above.

Hugues KAMBA MPIANA (2):
  arm-bsp/documentation: corstone1000: Amend documentation for
    CORSTONE1000-2024.11 release
  kas: corstone-1000: Update the SHA of the Yocto layer dependencies for
    the CORSTONE1000-2024.11 release.

 kas/corstone1000-base.yml                     |   6 +-
 .../documentation/corstone1000/change-log.rst |  63 ++++
 .../corstone1000/release-notes.rst            |   6 +
 .../corstone1000/software-architecture.rst    |  25 +-
 .../documentation/corstone1000/user-guide.rst | 289 ++++++++++--------
 5 files changed, 244 insertions(+), 145 deletions(-)


