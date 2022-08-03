Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F878C19F2C
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8238.1659532370175550431
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D4F911FB;
	Wed,  3 Aug 2022 06:12:50 -0700 (PDT)
Received: from [10.57.84.163] (unknown [10.57.84.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2AB63F70D;
	Wed,  3 Aug 2022 06:12:48 -0700 (PDT)
Message-ID: <6caff355-be27-d7a8-b921-3feb9c89b707@arm.com>
Date: Wed, 3 Aug 2022 14:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] runfvp: Stop the FVP when telnet shuts down cleanly
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com, Robbie.Cao@arm.com
References: <20220803131013.3769839-1-peter.hoyes@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20220803131013.3769839-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3637

On 03/08/2022 14:10, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> At the moment, when using the --console flag, if telnet is shut down
> cleanly (i.e. by typing "quit" at the prompt instead of Ctrl+C), runfvp
> still waits on the FVP to exit of its own accord, so hangs.
>
> Move the fvp.run() call so that when telnet quits, it immediately
> proceeds to shut down the FVP.
>
> Issue-Id: SCM-4954
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I2169c99586a1eebc2c6ab4b2e15fb0c769fc81a8
> ---
>   scripts/runfvp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runfvp b/scripts/runfvp
> index 9fb77d3..c5a74b2 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -64,8 +64,8 @@ async def start_fvp(args, config, extra_args):
>               logger.debug(f"Telnet quit, cancelling tasks")
>           else:
>               fvp.add_line_callback(lambda line: print(line))
> +            await fvp.run()
>   
> -        await fvp.run()
>       finally:
>           await fvp.stop()
>   
Please can this also be backported to kirkstone

