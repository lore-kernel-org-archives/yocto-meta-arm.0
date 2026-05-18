Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA518CD4F50
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 18:51:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4585.1779130312472572076
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 11:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NBNQZJnQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A744302D;
	Mon, 18 May 2026 11:51:46 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.25.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D578D3F85F;
	Mon, 18 May 2026 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779130311; bh=Aq/UrGR+WkQO7xVH9fk/QQ6tqljHukGpJdo0bD2xVng=;
	h=From:To:Cc:Subject:Date:From;
	b=NBNQZJnQwEoucioubBw4pLIzkd+Yi/7BHFNQtgte4M5ZhxQSM0YqASPo7OZ7UK2lJ
	 a0flkKmDxuJ/IwJi7ahSMueyxrVWY1RaxkbMRtYKIhl3UPxKO/c+spdsmPK0HQ4keB
	 3y8wOSjAibtEs9iwqqBeAh10pEbhYEP3u/duMhhQ=
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH wrynose 0/6] corstone1000: Add standalone Cortex-A320 FVP support and documentation
Date: Mon, 18 May 2026 19:51:35 +0100
Message-ID: <20260518185146.11634-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 18:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7049

## Summary

Add standalone support and documentation for the Corstone-1000 Cortex-A32=
0 FVP platform.

This change introduces a dedicated `corstone1000-a320-fvp` machine and ka=
s configuration, enables CI image builds for the
Cortex-A320 variant, and moves the A320-specific documentation into its o=
wn documentation set.

## Changes

- Add standalone `corstone1000-a320-fvp` machine configuration.
- Add kas configuration for Corstone-1000 Cortex-A320 FVP builds.
- Add GitLab CI coverage for Cortex-A320 image builds.
- Add standalone Corstone-1000 A320 documentation, including user guide, =
tests, release notes, software architecture, and
  images.
- Remove A320-specific content from the base Corstone-1000 documentation.
- Add SSH image build support documentation and kas config.
- Fix the Trusted Firmware-A Cortex-A320 errata override.

Alex Chapman (3):
  arm-bsp/tf-a: corstone1000: Fix Cortex-A320 errata override
  arm-bsp/docs,kas:corstone1000: Add SSH image build support
  arm-bsp:corstone1000: Create a standalone corstone1000-a320-fvp
    machine

Hugues KAMBA MPIANA (1):
  ci: Add Corstone-1000 with Cortex-A320 builds

Michael Safwat (2):
  arm-bsp/docs: corstone1000-a320: Add standalone A320 documentation
  arm-bsp/docs: corstone1000: Drop A320 content from base documentation

 .gitlab-ci.yml                                |    9 +
 .../corstone1000-a320-fvp.yml                 |    7 +-
 kas/corstone1000-a320-fvp.yml                 |   22 +
 kas/corstone1000-ssh.yml                      |   13 +
 .../conf/machine/corstone1000-a320-fvp.conf   |   17 +
 .../conf/machine/corstone1000-fvp.conf        |    5 -
 .../machine/include/corstone1000-a320.inc     |    7 +-
 .../corstone1000-a320/.readthedocs.yaml       |   12 +
 .../documentation/corstone1000-a320/conf.py   |  117 ++
 .../corstone1000-a320/corstone-a320_map.md    |    6 +
 .../corstone-a320_metadata.yaml               |  106 ++
 .../images/CorstoneA320Subsystems.png         |  Bin
 .../images/CorstoneSubsystems.png             |  Bin 0 -> 78895 bytes
 .../images/ExternalFlash.png                  |  Bin 0 -> 59864 bytes
 .../corstone1000-a320/images/FIPDiagram.png   |  Bin 0 -> 16136 bytes
 .../images/SecureBootChain.png                |  Bin 0 -> 88376 bytes
 .../images/SecureFirmwareUpdate.png           |  Bin 0 -> 61393 bytes
 .../images/SecureServices.png                 |  Bin 0 -> 70912 bytes
 .../SystemArchitecturePSAFirmwareUpdate.png   |  Bin 0 -> 47522 bytes
 .../corstone1000-a320/images/UEFISupport.png  |  Bin 0 -> 66244 bytes
 .../documentation/corstone1000-a320/index.md  |   12 +
 .../corstone1000-a320/topics/change-log.md    |   80 ++
 .../corstone1000-a320/topics/introducing.md   |   14 +
 .../corstone1000-a320/topics/release-notes.md |   28 +
 .../topics/software-architecture.md           |  311 +++++
 .../corstone1000-a320/topics/tests.md         | 1194 +++++++++++++++++
 .../corstone1000-a320/topics/user-guide.md    |  265 ++++
 .../corstone1000/software-architecture.rst    |   13 -
 .../documentation/corstone1000/user-guide.rst |  144 +-
 meta-arm-bsp/documentation/requirements.txt   |    1 +
 .../trusted-firmware-a-corstone1000.inc       |    6 +-
 .../ssh-pregen-hostkeys_%.bbappend            |    3 +-
 32 files changed, 2246 insertions(+), 146 deletions(-)
 rename kas/corstone1000-a320.yml =3D> ci/corstone1000-a320-fvp.yml (57%)
 create mode 100644 kas/corstone1000-a320-fvp.yml
 create mode 100644 kas/corstone1000-ssh.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-a320-fvp.conf
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/.readthe=
docs.yaml
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/conf.py
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/corstone=
-a320_map.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/corstone=
-a320_metadata.yaml
 rename meta-arm-bsp/documentation/{corstone1000 =3D> corstone1000-a320}/=
images/CorstoneA320Subsystems.png (100%)
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/C=
orstoneSubsystems.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/E=
xternalFlash.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/F=
IPDiagram.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/S=
ecureBootChain.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/S=
ecureFirmwareUpdate.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/S=
ecureServices.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/S=
ystemArchitecturePSAFirmwareUpdate.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/images/U=
EFISupport.png
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/index.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/c=
hange-log.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/i=
ntroducing.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/r=
elease-notes.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/s=
oftware-architecture.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/t=
ests.md
 create mode 100644 meta-arm-bsp/documentation/corstone1000-a320/topics/u=
ser-guide.md


