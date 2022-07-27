Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B20C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 09:29:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17878.1658914159315851451
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 02:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B43923A;
	Wed, 27 Jul 2022 02:29:19 -0700 (PDT)
Received: from [10.57.86.161] (unknown [10.57.86.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C674A3F70D;
	Wed, 27 Jul 2022 02:29:17 -0700 (PDT)
Message-ID: <bcfedd63-9845-934c-5939-2f2aabcaa933@arm.com>
Date: Wed, 27 Jul 2022 10:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm/oeqa: Fix regex warning in linuxboot test case
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com
References: <20220726153536.3573383-1-peter.hoyes@arm.com>
 <165886848111.1179859.10226758370769335566.b4-ty@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <165886848111.1179859.10226758370769335566.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 09:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3596

On 26/07/2022 21:48, Jon Mason wrote:
> On Tue, 26 Jul 2022 16:35:36 +0100, Peter Hoyes wrote:
>> The linuxboot test case prints the following in log.do_testimage, only
>> when executing testimage without a pycache:
>>
>>    linuxboot.py:18: DeprecationWarning: invalid escape sequence \:
>>      self.target.expect(self.console, "login\:", timeout=10*60)
>>
>> Fix the warning by escaping the ':' character correctly in the pexpect
>> regex.
> Applied, thanks!
>
> [1/1] arm/oeqa: Fix regex warning in linuxboot test case
>        commit: ef879b5fb87910b80ed19e7bf036d3c6b0684f89
>
> Best regards,
Please can this patch be backported to kirkstone.

