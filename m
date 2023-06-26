Return-Path: <tomasagustin.gonzalezorlando@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BB6EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 15:56:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12079.1687795009984284474
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 08:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tomasagustin.gonzalezorlando@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3A332F4;
	Mon, 26 Jun 2023 08:57:33 -0700 (PDT)
Received: from e126979.cambridge.arm.com (e126979.cambridge.arm.com [10.1.38.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1353F663;
	Mon, 26 Jun 2023 08:56:47 -0700 (PDT)
From: tomasagustin.gonzalezorlando@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com,
	Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>
Subject: [PATCH v2 mickledore 0/4] arm-bsp/documentation: corstone1000: Update documentation
Date: Mon, 26 Jun 2023 16:56:27 +0100
Message-Id: <20230626155631.53157-1-tomasagustin.gonzalezorlando@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jun 2023 15:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4840

From: Tomas Gonzalez <tomasagustin.gonzalezorlando@arm.com>

Update the documentation regarding:

 * Release notes & change log
 * Software architecture
 * Known limitations and issues
 * User guide
 * Correction of typos

Changelog :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

v2:

* Update Distro installation and boot instructions.

Abdellatif El Khlifi (2):
  arm-bsp/documentation: corstone1000: Update change log
  arm-bsp/doc: corstone1000: Update the software architecture document

Tom=C3=A1s Gonz=C3=A1lez (2):
  arm-bsp/documentation: corstone1000: Update the user guide
  arm-bsp/documentation: corstone1000: Update the release notes

 .../documentation/corstone1000/change-log.rst |  74 ++-
 .../images/CorstoneSubsystems.png             | Bin 111103 -> 78895 byte=
s
 .../corstone1000/images/ExternalFlash.png     | Bin 35431 -> 40835 bytes
 .../corstone1000/images/SecureBootChain.png   | Bin 150409 -> 95626 byte=
s
 .../corstone1000/images/SecureServices.png    | Bin 73965 -> 57910 bytes
 .../corstone1000/images/UEFISupport.png       | Bin 98811 -> 66244 bytes
 .../corstone1000/release-notes.rst            |  24 +-
 .../corstone1000/software-architecture.rst    |  63 +--
 .../documentation/corstone1000/user-guide.rst | 470 +++++++++++-------
 9 files changed, 428 insertions(+), 203 deletions(-)

--=20
2.25.1


