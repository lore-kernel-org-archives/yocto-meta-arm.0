Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB09C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7571.1657621706177858534
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 096C61515;
	Tue, 12 Jul 2022 03:28:26 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7A7C3F792;
	Tue, 12 Jul 2022 03:28:24 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 0/6] Refactor runfvp for OEFVPSerialTarget
Date: Tue, 12 Jul 2022 11:28:24 +0100
Message-Id: <20220712102830.625090-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3554

From: Peter Hoyes <Peter.Hoyes@arm.com>

Please can this patch series be merged into master + kirkstone.

To enable creating consoles for multiple terminals, refactor=20
runfvp into an "fvp" library in meta-arm/lib, which can be used
by both the runfvp script and meta-arm FVP test targets. Create
selftests for the fvp library.

So that the test target can connect to all desired test
consoles on startup, and to enable reuse of test cases between
FVPs, add a new FVP_TEST_CONSOLES variable, the varflags of
which define mappings between test case console names and
underlying console names. FVP_CONSOLE is mapped as "default" by
default.

Create a new OEFVPSerialTarget which still extends OESSHTarget,
but also exposes an interface for validating the output of
multiple terminals using pexpect.

Create a "linuxboot" test case which uses the pexpect interface
on OEFVPSerialTarget. Switch corstone500, corstone1000 and
fvp-baser-aemv8r64 to use this test case with the new test
target class and remove the noop test.

Peter Hoyes (6):
  scripts,arm/lib: Refactor runfvp into FVPRunner
  arm/oeqa: Add selftests for FVP library
  arm/oeqa: Refactor OEFVPTarget to use FVPRunner and pexpect
  arm/classes: Change FVP_CONSOLE to FVP_CONSOLES in fvpconf
  arm/oeqa: Create new OEFVPSerialTarget with pexpect interface
  arm/oeqa: Use linuxboot and OEFVPSerialTarget instead of noop

 .../conf/machine/corstone1000-fvp.conf        |   4 +-
 meta-arm-bsp/conf/machine/corstone500.conf    |   4 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |   4 +-
 meta-arm/classes/fvpboot.bbclass              |   5 +-
 meta-arm/lib/fvp/__init__.py                  |   0
 meta-arm/lib/fvp/conffile.py                  |  58 +++++
 meta-arm/lib/fvp/runner.py                    | 127 +++++++++
 meta-arm/lib/fvp/terminal.py                  |  59 +++++
 meta-arm/lib/oeqa/controllers/fvp.py          | 181 ++++++++-----
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py  |  18 ++
 meta-arm/lib/oeqa/runtime/cases/noop.py       |  12 -
 meta-arm/lib/oeqa/selftest/cases/runfvp.py    |  58 +++++
 scripts/runfvp                                | 240 +++---------------
 13 files changed, 482 insertions(+), 288 deletions(-)
 create mode 100644 meta-arm/lib/fvp/__init__.py
 create mode 100644 meta-arm/lib/fvp/conffile.py
 create mode 100644 meta-arm/lib/fvp/runner.py
 create mode 100644 meta-arm/lib/fvp/terminal.py
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/linuxboot.py
 delete mode 100644 meta-arm/lib/oeqa/runtime/cases/noop.py

--=20
2.25.1


