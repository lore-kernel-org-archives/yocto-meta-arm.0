Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825ADCA100C
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 20:15:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.953.1725048895558516216
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 13:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC90EFEC;
	Fri, 30 Aug 2024 13:15:20 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.73.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB97D3F762;
	Fri, 30 Aug 2024 13:14:53 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp,kas: corstone1000: enable External System based on new yml file 
Date: Fri, 30 Aug 2024 21:14:47 +0100
Message-Id: <20240830201448.3695005-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 20:15:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6044

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Create new yml file "corstone1000-extsys.yml" which adds "corstone1000-ex=
tsys" as
new MACHINE_FEATURE.
Based on this, external system components can be enabled or disabled from=
 the
Linux Kernel and U-Boot.

Reason for change:
DT-schema test is failing for the SystemReady-IR v2.0 certification becau=
se
device tree binding for remoteproc dts node corresponds to external syste=
m has
not been upstreamed in the Linux Kernel yet.
So, it has been decided to make enablement of external system configurabl=
e in
order to make Corstone1000 FVP SystemReady-IR v2.0 certifiable.

Harsimran Singh Tungal (1):
  arm-bsp,kas: corstone1000: enable External System based on new yml
    file

 kas/corstone1000-extsys.yml                   |  6 ++++
 .../documentation/corstone1000/user-guide.rst |  7 ++++
 .../u-boot/u-boot-corstone1000.inc            |  2 ++
 ...rstone1000-purge-remoteproc-dts-node.patch | 34 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             | 20 +++++++----
 5 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 kas/corstone1000-extsys.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
051-corstone1000-purge-remoteproc-dts-node.patch

--=20
2.25.1


