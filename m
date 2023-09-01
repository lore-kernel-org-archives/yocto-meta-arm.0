Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A48DCA0FEB
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 16:36:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.265.1693586201916731527
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 09:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA3CDFEC;
	Fri,  1 Sep 2023 09:37:19 -0700 (PDT)
Received: from PW04GXMM.arm.com (unknown [10.57.64.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234753F844;
	Fri,  1 Sep 2023 09:36:40 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/2] CI: Build custom image for N1SDP optee-xtest
Date: Fri,  1 Sep 2023 17:36:24 +0100
Message-Id: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 16:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5014

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Build a custom N1SDP image with only optee-xtests as part of the image.
A fresh custom image build is necessary to include the relevant test
suite for running the xtests.

Anusmita Dutta Mazumder (2):
  arm-bsp/n1sdp: Enable tests with pseudo trusted application
  CI: Build custom image for N1SDP optee-xtest

 .gitlab-ci.yml                                       |  1 +
 ci/n1sdp-optee.yml                                   | 12 ++++++++++++
 .../recipes-security/optee/optee-os-n1sdp.inc        |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 ci/n1sdp-optee.yml

--=20
2.34.1


