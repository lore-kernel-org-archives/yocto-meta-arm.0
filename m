Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF5FC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:56:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.561.1787237754093511905
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=SJj/kWIb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A64153B;
	Thu, 20 Aug 2026 07:55:49 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020BC3F85F;
	Thu, 20 Aug 2026 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787237753; bh=Ct5PrBNV59CjdGkxz/0sq6jTqulA/2tEO6XPegQ7n7c=;
	h=From:To:Cc:Subject:Date:From;
	b=SJj/kWIbHkAIFCTaGh7HKc5p86t0u82xp2hYytVLfLs14SchDUVChxjqFlL8+GHLO
	 c/6B+Rri6l2TfWW4ijtLCxfgGtiF8zQqQLDUOH2XlOwLh7UvVT64mx0WRvkoxXGVHU
	 WQvZZqsh+TqborwLQVPu+PCjMnedXoZd1aNotac0=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux: corstone1000: Enable CMA for Ethos-U
Date: Thu, 20 Aug 2026 15:55:44 +0100
Message-ID: <20260820145545.3061675-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:56:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7140

Enable CMA in the Corstone-1000 Ethos-U kernel configuration.
Larger Teflon model tests require reliable contiguous buffer allocation
and relies on kernel CMA support.

Harsimran Singh Tungal (1):
  arm-bsp/linux: corstone1000: Enable CMA for Ethos-U

 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg | 2 ++
 1 file changed, 2 insertions(+)


