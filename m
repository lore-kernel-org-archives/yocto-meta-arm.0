Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A1DC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 09:59:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12385.1706263168366202137
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 01:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0C11FB;
	Fri, 26 Jan 2024 02:00:11 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 943CC3F762;
	Fri, 26 Jan 2024 01:59:26 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] n1sdp:arm arm-bsp: fix tftf tests for n1sdp
Date: Fri, 26 Jan 2024 09:59:21 +0000
Message-Id: <20240126095922.2836205-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 09:59:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5359

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset fix the tftf tests issue on n1sdp. Before this change,=20
the tftf tests were getting stuck on n1sdp. The following changes have be=
en done:

1. There were some tftf tests based on multicore which involve powering u=
p the other cores.=20
These tests were creating issues and the same thing has already been ment=
ioned in the=20
tests-to-skip.txt file for n1sdp platform in tftf source. Those tests are=
 skipped while=20
executing tftf and patch has been created.

2. The TFTF_MODE variable added for tftf v2.10 recipe file, as did earlie=
r for tftf v2.9.=20
With the help of this, we can enable debug or relase mode. The configurat=
ion based on this has=20
been added for n1sdp in the corresponding bbappend file.

3. Add PREFERRED_VERSION_tf-a-tests for v2.10.



Harsimran Singh Tungal (1):
  n1sdp:arm arm-bsp: fix tftf tests for n1sdp

 meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
 .../files/0001-n1sdp-tftf-tests-to-skip.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  8 ++++
 .../trusted-firmware-a/tf-a-tests_2.10.0.bb   |  5 +-
 4 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-n1sdp-tftf-tests-to-skip.patch

--=20
2.25.1


