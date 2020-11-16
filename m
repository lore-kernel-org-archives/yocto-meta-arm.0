Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.35309.1605536661470675610
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UOMff2hc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id q5so16839745qkc.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JROrJ3MViMAkjfVJ1TvlNk1XDhzDLQ370S4jcRNytSs=;
        b=UOMff2hcTh7Slq2+PVoEoDrdCUYfGIszWKalFrRiPQGcqCbH9HH39ISr//fKYaAEZ6
         VP2wS1WBT9Pho0jH49mZ9T7MZ5VcUGkTXAtgu7pA9f1r3/bOfOLAwim3EGrndNdFupH7
         fkRMjxObToHaTAcTpqRl3DrIsGl2OX2uJpc6NPcuC+xe8mfoH0dqxcsElAwnxeAQa/OD
         mo29csez8ZVoFkVF2RERLvOaNCuA8TGo7yhRp/0Y8RHOzBGBVTxmgxBg4mVnxSII+9mm
         zuzWp8KTzVfPYo77DlfRJMfSLZDFJ2TE3/AFwtjpYhafk3/lWC6mrhUL1E0lpT6JlOxn
         Qd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JROrJ3MViMAkjfVJ1TvlNk1XDhzDLQ370S4jcRNytSs=;
        b=s/FJRbiBewjqWyqEVKeO/0dctFg1DrPr5sFMEbLjIhdVjT5bYHAOkalyGKk5yNQ73h
         JGgX6KQVP/2u43mM230XtFIfxHydvMugDVIc7UaigjtRQCOobh2akyiuo7pM6+EnQUtQ
         GehGS/j+25UYo2TzGd/Wqup/b+FGehITtW7pAzBDlL14hq/ieAzyWn0R40do+uaRWG7Z
         2yu16EAXfo7iOPG5+Xj4aL1yNsYyJ164JWF+1kmctl4hXCZlwzMqn4bn7+ci+CXp/Nvx
         w/udYYxBmVDoP7ucRiKufCCvRIzG23D5GtfYRNV/CQg9TzRzBXxqP5aOERMxrcRC740a
         OqFw==
X-Gm-Message-State: AOAM530oE7yI7nkgNDDf3Gqn3na/tqXzvAObBn3TQfCdv9fkUlL+96ip
	/+A9FpkuzBbztUK72NZHbBWlR4MMhcp1Xg==
X-Google-Smtp-Source: ABdhPJyF9mVf6HUUdV4G0rQU9RdBGERGJT9sXP49ispE4bNExqVqAXhXg8v61yXQNOZ+F7V9WdDU8w==
X-Received: by 2002:a05:620a:1415:: with SMTP id d21mr1395023qkj.275.1605536660579;
        Mon, 16 Nov 2020 06:24:20 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id p72sm12742837qke.110.2020.11.16.06.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:24:20 -0800 (PST)
Date: Mon, 16 Nov 2020 09:24:18 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/6] arm-bsp/documentation: fix MACHINE reference
Message-ID: <20201116142418.GB20627@kudzu.us>
References: <20201110155216.1313151-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201110155216.1313151-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 03:52:11PM +0000, Ross Burton wrote:
> The MACHINE is foundation-armv8, not foundation-v8.
> 
> Change-Id: I557eb9c32914b2ccf938a76a6efb260483e83d22
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/foundation-armv8.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
> index dacdce3..72f9f66 100644
> --- a/meta-arm-bsp/documentation/foundation-armv8.md
> +++ b/meta-arm-bsp/documentation/foundation-armv8.md
> @@ -4,7 +4,7 @@
>  
>  ### Configuration:
>  In the local.conf file, MACHINE should be set as follow:
> -MACHINE ?= "foundation-v8"
> +MACHINE ?= "foundation-armv8"
>  
>  ### Build:
>  ```bash$ bitbake core-image-minimal```
> -- 
> 2.25.1
> 

> 
> 
> 

