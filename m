Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCF1C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 08:44:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9473.1660034671219943157
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 01:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6640D23A;
	Tue,  9 Aug 2022 01:44:31 -0700 (PDT)
Received: from [10.57.84.163] (unknown [10.57.84.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDB0E3F67D;
	Tue,  9 Aug 2022 01:44:29 -0700 (PDT)
Message-ID: <ca54c29a-6e52-083d-b965-d55598cd513e@arm.com>
Date: Tue, 9 Aug 2022 09:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] docs: Update FVP_CONSOLES in runfvp documentation
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com
References: <20220805144756.2492832-1-peter.hoyes@arm.com>
 <165998718800.2694832.618076795430673700.b4-ty@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <165998718800.2694832.618076795430673700.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 08:44:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3661

On 08/08/2022 20:33, Jon Mason wrote:
> On Fri, 5 Aug 2022 15:47:55 +0100, Peter Hoyes wrote:
>> The runfvp refactor to enable OEFVPSerialTarget created FVP_CONSOLES
>> which maps the names used for serial ports in test cases to the names
>> used for serial ports in the FVP stdout.
>>
>> Refactor the FVP_CONSOLE section -> FVP_CONSOLES, noting the the
>> 'default' console is still used for the --console runfvp flag.
> Applied, thanks!
>
> [1/2] docs: Update FVP_CONSOLES in runfvp documentation
>        commit: 74a36b024f4d20c80e7c686cdc6d829d60a2689d
> [2/2] docs: Introduce meta-arm OEQA documentation
>        commit: f83aad2ba9d43327bcae28b6c05a8a8ab9d5a519
>
> Best regards,
Please can this chain be backported to kirkstone.

