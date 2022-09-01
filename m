Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C265ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 09:58:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10268.1662026292603892330
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 02:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B767D6E
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Sep 2022 02:58:18 -0700 (PDT)
Received: from [10.57.87.52] (unknown [10.57.87.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74253F7B4
	for <meta-arm@lists.yoctoproject.org>; Thu,  1 Sep 2022 02:58:11 -0700 (PDT)
Message-ID: <f9928605-7131-a0f7-2bba-c5e5e799ffef@arm.com>
Date: Thu, 1 Sep 2022 10:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arm] [PATCH] arm/oeqa: Make linuxboot test case timeout
 configurable
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
References: <1710B4023C0EF1A6.1438@lists.yoctoproject.org>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <1710B4023C0EF1A6.1438@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Sep 2022 09:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3733


On 01/09/2022 10:57, Peter Hoyes via lists.yoctoproject.org wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> In complex stacks, e.g. with many cores or many init scripts, the time
> to Linux shell may be more than 10 minutes. Make the boot timeout
> configurable using TEST_FVP_LINUX_BOOT_TIMEOUT, leaving the default
> value at 10 minutes.
>
> Issue-Id: SCM-4958
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Ie074acd4b4509d0230d1f77a2a527d497bb295ce
Please can this patch also be backported to kirkstone
> ---
>   documentation/oeqa-fvp.md                    | 2 +-
>   meta-arm/lib/oeqa/runtime/cases/linuxboot.py | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
> index b53065a0..582dd38b 100644
> --- a/documentation/oeqa-fvp.md
> +++ b/documentation/oeqa-fvp.md
> @@ -37,7 +37,7 @@ self.target.expect('default', r'root@.*\:~#', timeout=30)
>   self.assertNotIn(b'ERROR:', self.target.before('tf-a'))
>   ```
>   
> -For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/linuxboot.py This test case can be used to minimally verify that a machine boots to a Linux shell.
> +For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/linuxboot.py This test case can be used to minimally verify that a machine boots to a Linux shell. The default timeout is 10 minutes, but this can be configured with the variable TEST_FVP_LINUX_BOOT_TIMEOUT, which expects a value in seconds.
>   
>   The SSH interface described above is also available on OEFVPSerialTarget to support writing a set of hybrid test suites that use a combination of serial and SSH access. Note however that this test target does not guarantee that Linux has booted to shell prior to running any tests, so the test cases in OE-core are not supported.
>   
> diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
> index 8994405e..99a8e78b 100644
> --- a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
> +++ b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
> @@ -12,7 +12,8 @@ class LinuxBootTest(OERuntimeTestCase):
>   
>       def setUp(self):
>           self.console = self.target.DEFAULT_CONSOLE
> +        self.timeout = int(self.td.get('TEST_FVP_LINUX_BOOT_TIMEOUT') or 10*60)
>   
>       def test_linux_boot(self):
>           self.logger.info(f"{self.console}: Waiting for login prompt")
> -        self.target.expect(self.console, r"login\:", timeout=10*60)
> +        self.target.expect(self.console, r"login\:", self.timeout)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3732): https://lists.yoctoproject.org/g/meta-arm/message/3732
> Mute This Topic: https://lists.yoctoproject.org/mt/93391120/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoyes@arm.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

