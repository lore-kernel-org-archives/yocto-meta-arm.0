Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C29CC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:15:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6761.1668525351795869829
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 07:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9987D13D5;
	Tue, 15 Nov 2022 07:15:57 -0800 (PST)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29A93F587;
	Tue, 15 Nov 2022 07:15:50 -0800 (PST)
Message-ID: <64e7c765-f21b-c767-86bf-51da5d6c9e5f@arm.com>
Date: Tue, 15 Nov 2022 15:15:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/5] arm/fvp: Join cli arguments in verbose logging
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
References: <20221115150116.314729-1-peter.hoyes@arm.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20221115150116.314729-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 15:15:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4134

Hi Jon,

There's no rush, but our team is planning a release based on langdale 
and it would be beneficial to have these improvements included. Let us 
know what you think.

Peter

On 15/11/2022 15:01, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> It is sometimes helpful to copy and paste the cli arguments from the
> verbose runfvp output (e.g. to test with a development FVP build), but
> currently the arguments are printed as a Python list.  Use
> shlex.join(cli) to safely join the arguments together in form that can
> be reused directly in a shell.
>
> Issue-Id: SCM-5314
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Ibb5c5ed45d02e241cb3858f68740fb9d4e89357a
> ---
>   meta-arm/lib/fvp/runner.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 28351a39..f5c61f8b 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -2,6 +2,7 @@ import asyncio
>   import re
>   import subprocess
>   import os
> +import shlex
>   import shutil
>   import sys
>   
> @@ -67,7 +68,7 @@ class FVPRunner:
>               if name in os.environ:
>                   env[name] = os.environ[name]
>   
> -        self._logger.debug(f"Constructed FVP call: {cli}")
> +        self._logger.debug(f"Constructed FVP call: {shlex.join(cli)}")
>           self._fvp_process = await asyncio.create_subprocess_exec(
>               *cli,
>               stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,

