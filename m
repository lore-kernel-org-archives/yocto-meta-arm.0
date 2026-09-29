Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7605DCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9181.1790692328042355453
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 07:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sca1L/fl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B01E1516;
	Tue, 29 Sep 2026 07:32:04 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 161733F86F;
	Tue, 29 Sep 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790692327; bh=MFhtF3XRVSxmhohI+ZpXy3Vy/vmxfEcVUWHkO/sda4o=;
	h=From:To:Cc:Subject:Date:From;
	b=sca1L/flBwdcziTAgHSof9JRTh+MurLNgcwYL4o31Z1l5o3r7XHI/GQHt3GeAoJdW
	 YYPJk/6idDYNsnAUoRZ8DPb8nOpNnuE7RuPuYHxLM5L2/pvNATk4R1Cf2IHCGoe4Ti
	 ZsOGn4QDg2wdreX9ZOIuwG+UewYfnlSXJ9WiK2Mg=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-m: corstone1000: backport Corstone-1000 security fixes
Date: Tue, 29 Sep 2026 15:31:59 +0100
Message-ID: <20260929143200.2244035-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7180

Backport two TF-M security fixes for the Corstone-1000 platform.
The fixes address vulnerabilities in the TF-M firmware and keep the
platform aligned with upstream TF-M security updates.

Harsimran Singh Tungal (1):
  arm-bsp/trusted-firmware-m: corstone1000: backport Corstone-1000
    security fixes

 ...-Fix-missing-destination-offset-of-p.patch | 92 +++++++++++++++++++
 ...Bound-FWU-writes-to-target-partition.patch | 61 ++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  2 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch


