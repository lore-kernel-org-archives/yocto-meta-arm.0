Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.396.1794500789885856991
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 08:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gAV7z+tE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2915F1516;
	Thu, 12 Nov 2026 08:26:26 -0800 (PST)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81743F673;
	Thu, 12 Nov 2026 08:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794500789; bh=dLALoVYrgE2JSAXqOMIhgSSnG6wGNZ7q0ZDLtovV0s4=;
	h=From:To:Cc:Subject:Date:From;
	b=gAV7z+tE3SmjhmuteN6FF6pCajCdA23MnjXFBw6BR/XY5v5sgFR3XTce/8FUa8f9I
	 9mSgkgBKRnokj7D5ZmntY2xca5aL0puUdpRT7nGFVjm2HNl8UqjDVMFbtibHzeoydu
	 779HaB1PCmnOX9yaqZudiagFwyEyMi41xcybxLDU=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH blacksail 0/3] corstone1000: Update 2026.11 blacksail release documentation
Date: Thu, 12 Nov 2026 16:25:38 +0000
Message-ID: <20261112162549.1127024-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 16:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7210
Content-Type: text/plain; charset="utf-8"

Update the Corstone-1000 and Corstone-1000 A320 release documentation for=
 the 2026.11 Blacksail release.
This also updates the release metadata and pins the Yocto layer revisions=
 for the release.
Changes include:

- Add 2026.11 release notes and change logs for Corstone-1000.
- Add 2026.11 release notes and change logs for Corstone-1000 A320.
- Update Corstone-1000 A320 metadata revision information.
- Update documentation references from the previous release to Blacksail.
- Pin Yocto layer SHAs in kas/corstone1000-base.yml.
- Align documented layer revisions with the pinned SHAs.

Harsimran Singh Tungal (3):
  arm-bsp/documentation: corstone1000: Update 2026.11 blacksail release
    documentation
  arm-bsp/documentation: corstone1000-a320: Update 2026.11 blacksail
    release documentation
  corstone1000: Pin layer SHAs for blacksail release

 kas/corstone1000-base.yml                     | 11 ++-
 .../corstone-a320_metadata.yaml               | 10 +--
 .../corstone1000-a320/topics/change-log.md    | 67 +++++++++++++++
 .../corstone1000-a320/topics/release-notes.md |  9 +++
 .../corstone1000-a320/topics/tests.md         | 81 ++++++++++---------
 .../corstone1000-a320/topics/user-guide.md    |  6 +-
 .../documentation/corstone1000/change-log.rst | 62 ++++++++++++++
 .../corstone1000/release-notes.rst            |  6 ++
 .../documentation/corstone1000/user-guide.rst | 68 +++++++++-------
 9 files changed, 240 insertions(+), 80 deletions(-)

