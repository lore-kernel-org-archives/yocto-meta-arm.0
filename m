Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D7C43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:47:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20062.1782823631971118808
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=soNaPHL2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05BF21D15;
	Tue, 30 Jun 2026 05:47:07 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBA2C3F905;
	Tue, 30 Jun 2026 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823631; bh=9o8FgD3sM+3+BtEvc8nfz6Y579h3WSObxRqBBwXSECE=;
	h=From:To:Cc:Subject:Date:From;
	b=soNaPHL2US0i8YdiVycqotY4jsNiVp5L0/k4Qb6LWCGQjuyBh/DhrpW56AWJ0aE0s
	 bQfKUPnEmRt1t03F3xdbiCsLm97o6VTQ9svmdIagjk69evwiw2orIw6dfOuG5CkT6K
	 QizRie6OQ2O1Bjlgh6XktHk3vIeIV00qMZXqlZuM=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH wrynose 0/5] Corstone1000: update 2026.05 Wrynose release docs
Date: Tue, 30 Jun 2026 13:46:59 +0100
Message-Id: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7099

Update the Corstone-1000 changelog, release notes and user guide for
the 2026.05 wrynose release.
Update the user guide to align with the 2026.05 release branch and
documentation state, including the Yocto release name, recipe version
references, release tag references, and related asset and report links.


Harsimran Singh Tungal (5):
  arm-bsp/documentation: corstone1000: update 2026.05 wrynose release
    documentation
  arm-bsp/documentation: corstone1000-a320: update 2026.05 wrynose
    release documentation
  corstone1000: Pin layers SHA for wrynose release
  fvp:corstone1000-a320: update Corstone-1000 A320 FVP to 11.31
  ci: enable testimage coverage for Corstone-1000 A320 FVP

 .gitlab-ci.yml                                |   4 +-
 kas/corstone1000-base.yml                     |  10 +-
 .../corstone-a320_metadata.yaml               |   4 +-
 .../corstone1000-a320/topics/change-log.md    |  70 +++++
 .../corstone1000-a320/topics/release-notes.md |  12 +
 .../corstone1000-a320/topics/tests.md         | 267 ++++++++++--------
 .../corstone1000-a320/topics/user-guide.md    |  38 +--
 .../documentation/corstone1000/change-log.rst |  65 +++++
 .../corstone1000/release-notes.rst            |   6 +
 .../documentation/corstone1000/user-guide.rst | 180 +++++++-----
 .../fvp/fvp-corstone1000-a320.bb              |  37 ++-
 11 files changed, 465 insertions(+), 228 deletions(-)


