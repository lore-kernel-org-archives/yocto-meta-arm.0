Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1609.1794503668545744508
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 09:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Pyjiua4z;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8E661516;
	Thu, 12 Nov 2026 09:14:24 -0800 (PST)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9373F632;
	Thu, 12 Nov 2026 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503667; bh=3a1xhv7l9xB1AgR/l7xhxJ5Eg2OtR44SiT+obwALM5A=;
	h=From:To:Cc:Subject:Date:From;
	b=Pyjiua4z3FVDErJAdzXtPMMFUGpZqMDS9yIh/7xH8A0Dw0NiBO+TSDd4Aktclo71P
	 yoEfiVyJtsO/6ezbbmR3PhZi4hobp9QW3nhbq7gY0JXVdvTTV3UTIvwIZcZJVLSXw0
	 /KuipdBEnHX4VBuLdacHfKjEUtu+wJalMvnMa/g4=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/2] corstone1000: Update 2026.11 blacksail release documentation
Date: Thu, 12 Nov 2026 17:14:16 +0000
Message-ID: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 17:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7214
Content-Type: text/plain; charset="utf-8"

Update the Corstone-1000 and Corstone-1000 A320 release documentation for=
 the 2026.11 Blacksail release.
Changes include:

- Add 2026.11 release notes and change logs for Corstone-1000.
- Add 2026.11 release notes and change logs for Corstone-1000 A320.
- Update Corstone-1000 A320 metadata revision information.

Harsimran Singh Tungal (2):
  arm-bsp/documentation: corstone1000: Update 2026.11 blacksail release
    documentation
  arm-bsp/documentation: corstone1000-a320: Update 2026.11 blacksail
    release documentation

 .../corstone-a320_metadata.yaml               | 10 +--
 .../corstone1000-a320/topics/change-log.md    | 67 +++++++++++++++
 .../corstone1000-a320/topics/release-notes.md |  9 +++
 .../corstone1000-a320/topics/tests.md         | 81 ++++++++++---------
 .../corstone1000-a320/topics/user-guide.md    |  6 +-
 .../documentation/corstone1000/change-log.rst | 62 ++++++++++++++
 .../corstone1000/release-notes.rst            |  6 ++
 .../documentation/corstone1000/user-guide.rst | 68 +++++++++-------
 8 files changed, 232 insertions(+), 77 deletions(-)

