Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE3C4829A
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 09:40:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14481.1707385207201816650
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 01:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C095D1FB;
	Thu,  8 Feb 2024 01:40:48 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDAAC3F762;
	Thu,  8 Feb 2024 01:40:05 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH nanbield 0/1] Corstone1000:arm-bsp: fix tftf tests nanbield 
Date: Thu,  8 Feb 2024 09:39:57 +0000
Message-Id: <20240208093958.35600-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Feb 2024 09:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5375

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

The tftf tests are getting stuck on nanbield for corstone1000 due to inco=
mpatible=20
optee version. The optee version on nanbield needs to be upgraded to fix =
the tftf=20
tests. To avoid that upgrade on the release branch, some tftf tests are s=
kipped=20
for corstone1000 platform to make the tftf tests work.

Harsimran Singh Tungal (1):
  Corstone1000:arm-bsp: fix tftf tests nanbield

 .../0001-corstone1000-skip-tftf-tests.patch   | 33 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  5 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-corstone1000-skip-tftf-tests.patch

--=20
2.25.1


