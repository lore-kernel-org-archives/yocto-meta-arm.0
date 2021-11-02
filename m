Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518F3C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 15:04:45 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.1028.1635865484046797969
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 08:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vkr8wXyL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id n2so19132093qta.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Dni8bdRMJmuDRIa7m6id+YQQpo5n0xrHkwmzyk9QfU=;
        b=vkr8wXyLVMXYdp4OOUBlnhZABi8gHuPdY/0rHPb5fjGgufEyRnouz+DZDYwyHNg/Cq
         XQ8BfLZpPJICk/WM3LFld/n+mqSq1o+aMy6B26hV+yMMSBfNbvDQ5dgiYOTz+FXuTn1n
         4cMre/FUoHwM3d4JTRCP/JLrA0y7fJkd2z39d9gRFfFZP1JL8fd1usN35UAC6JE/v/tt
         Dybaxz6vzZ2+UiZ5cHzNTsg4jNQf6GvRRxE8WzwT26Tm27VBkjhRMCAFo20WHJk+1JHo
         /+RrSoUw/WZ1ezWBEsjYDkThuq07GAYGYR/W9UuhQKfVesgK2QrsAnNQfgSxbic4RRRg
         HyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Dni8bdRMJmuDRIa7m6id+YQQpo5n0xrHkwmzyk9QfU=;
        b=qlc4lnmnN5Ybpla0HIpRAROjLtpv1F+sFJXRcfknuPUstcXZPIje4CHg7CM1rkBbQ3
         ggDa8/h2iz8RErNZYdT34BjuofI9mdnseE/OjHh4kmpAgQpqN8zdITDdHBvYLEZqVkT6
         ev+TtXx8QzRtXqLk7Jm/xRMEasjPbHcZjoB/CSQU9zlWBxc+QHTWfWtU8EA04qeUid5k
         Af/ANIPqJ6lyGR/CMt5RhsMCRW0ZpYrq3vqZnyuVrR63Cw8Zc9TJ0tHvrG5ycdwWAWSv
         l9IhIPnO8TR5qChit9xGKflaiy2wLnZZsHf1YLuI6Dk5iEq2ypCY3jaam4R6jpMPbXnA
         czow==
X-Gm-Message-State: AOAM532EokYZnof5Ec5fCGlpl4NVjMe8p9lXhVeUQvhnctgXsvzZCeCn
	Wo1YbEm1ilW9VUWq24SUCyzAnw==
X-Google-Smtp-Source: 
 ABdhPJyfiHbLxaKGsBg20Kgk5m3ChyP6BJhI0r3xs2g4HDClEEfg1VGMTZng389+rKoOHZ0+3+drTA==
X-Received: by 2002:ac8:7f13:: with SMTP id
 f19mr38995377qtk.294.1635865481845;
        Tue, 02 Nov 2021 08:04:41 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a618:1500:a815:3946:1dd9:5c5b])
        by smtp.gmail.com with ESMTPSA id
 17sm13279030qtw.16.2021.11.02.08.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 08:04:41 -0700 (PDT)
Date: Tue, 2 Nov 2021 11:04:39 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"ross@burtonini.com" <ross@burtonini.com>
Subject: Re: [meta-arm] [PATCH v2] runfvp: Ensure new process group is in the
 foreground
Message-ID: <20211102150439.GA18848@kudzu.us>
References: <20211021111657.663065-1-ross.burton@arm.com>
 <AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <AM6PR08MB428068EAD2DA7AAA4833CF5DFB8A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Nov 2021 15:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2331

On Mon, Nov 01, 2021 at 03:50:15PM +0000, Peter Hoyes wrote:
> Hi,
> 
> I'm seeing the same issue on honister - is it possible to backport this patch?

Done

> 
> Cheers,
> Peter
> 
> ________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Ross Burton via lists.yoctoproject.org <ross=burtonini.com@lists.yoctoproject.org>
> Sent: 21 October 2021 12:16
> To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> Subject: [meta-arm] [PATCH v2] runfvp: Ensure new process group is in the foreground
> 
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> When a new process group is created, it is launched in the background
> and any attempt to access the session terminal triggers a SIGTTIN (for
> stdin) or SIGTTOU (for stdout) signal. These are ignored in an
> interactive shell, but the default signal behavior in a new job is to
> send a SIGTSTP to the whole process group. This causes runfvp to hang
> when executed via a subprocess when stdin is accessed.
> 
> After creating a new process group, use tcsetpgrp to make the new group
> the foreground process for the terminal associated with stdin/stdout,
> but only if stdin is a tty.
> 
> The documentation for tcsetgrp states that tcsetpgrp itself raises a
> SIGTTOU signal, so set this signal to SIG_IGN.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I349a825df7fcb8a3cedb81762b901c6f50fa53b5
> ---
>  scripts/runfvp | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/runfvp b/scripts/runfvp
> index 97836726..66a76cc5 100755
> --- a/scripts/runfvp
> +++ b/scripts/runfvp
> @@ -4,6 +4,7 @@ import asyncio
>  import json
>  import os
>  import re
> +import signal
>  import sys
>  import subprocess
>  import pathlib
> @@ -220,6 +221,9 @@ if __name__ == "__main__":
>          # Set the process group so that it's possible to kill runfvp and
>          # everything it spawns easily.
>          os.setpgid(0, 0)
> +        if sys.stdin.isatty():
> +            signal.signal(signal.SIGTTOU, signal.SIG_IGN)
> +            os.tcsetpgrp(sys.stdin.fileno(), os.getpgrp())
>          runfvp(sys.argv[1:])
>      except KeyboardInterrupt:
>          pass
> --
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2328): https://lists.yoctoproject.org/g/meta-arm/message/2328
> Mute This Topic: https://lists.yoctoproject.org/mt/86487012/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


