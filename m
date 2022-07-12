Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC46C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:33:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9993.1657636374405314167
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4549E1596;
	Tue, 12 Jul 2022 07:32:54 -0700 (PDT)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495583F73D;
	Tue, 12 Jul 2022 07:32:53 -0700 (PDT)
Message-ID: <5bf1e054-70ae-731b-1c63-10113bb4e611@arm.com>
Date: Tue, 12 Jul 2022 15:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/6] Refactor runfvp for OEFVPSerialTarget
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com, robbie.cao@arm.com
References: <20220712102830.625090-1-peter.hoyes@arm.com>
 <165763606924.3923529.2623314912103237139.b4-ty@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <165763606924.3923529.2623314912103237139.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:33:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3563


On 12/07/2022 15:27, Jon Mason wrote:
> On Tue, 12 Jul 2022 11:28:24 +0100, Peter Hoyes wrote:
>> Please can this patch series be merged into master + kirkstone.
>>
>> To enable creating consoles for multiple terminals, refactor
>> runfvp into an "fvp" library in meta-arm/lib, which can be used
>> by both the runfvp script and meta-arm FVP test targets. Create
>> selftests for the fvp library.
>>
>> [...]
> Applied, thanks!
>
> [1/6] scripts,arm/lib: Refactor runfvp into FVPRunner
>        commit: 306639bbd5dbb46d257c57342cb8980c8e0468d2
> [2/6] arm/oeqa: Add selftests for FVP library
>        commit: 5ec49f964b01826fb9578255c1b85c8ef001b09d
> [3/6] arm/oeqa: Refactor OEFVPTarget to use FVPRunner and pexpect
>        commit: b3ab04f81305e108db83013e2e38cc465b28ec4a
> [4/6] arm/classes: Change FVP_CONSOLE to FVP_CONSOLES in fvpconf
>        commit: ff90c8ad54ebba9d1be5e137009e00ae0734424d
> [5/6] arm/oeqa: Create new OEFVPSerialTarget with pexpect interface
>        commit: 30b1452025c4b62de98e1514223a2ff483436ce6
> [6/6] arm/oeqa: Use linuxboot and OEFVPSerialTarget instead of noop
>        commit: 7f611a0d2ebfb2d52fa52afe27a335cdcf7cec70
>
> Best regards,

Thanks!

Please can this series also be backported to kirkstone.


