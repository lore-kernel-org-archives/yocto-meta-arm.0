Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web08.651.1610117331905739202
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 06:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LUKVp0Y9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.181, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f181.google.com with SMTP id t3so6389505ilh.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Jan 2021 06:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PGqeyC2DAc+qaulRMrHo1FQ8YDWspvyDQp2tWt1dfh4=;
        b=LUKVp0Y999AVZho4e76gWs5vF4kWqFAsUk9NGS5g6kSfYtXY+o1uRIEq9QCfET1RW8
         nIXye3/JGTtWmJHHlQfOtVXKGmAFDN3+CGAYyd/8RTsZO4iCgNJoLwzIZ12piBKa8OaR
         YycsMWU8i8Ckd8koQvFOxLDvh2tDSlz7ACTdMxIBY5xkbQlc/AAdMEfbhVvPs39sFiSW
         YUtO1oUjgIcGfkGgr2Uu/KxFWKjTvtXC7qDC3gfu7s6acw/zTt4OiD3LX9E2s0R85kOk
         ui8aSPYvmSnr2YRMntHW4b4iZ6SQIpk4F4SQL43Rw8MRya0IBAgWdANzlqDlLjlUwkAu
         52xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PGqeyC2DAc+qaulRMrHo1FQ8YDWspvyDQp2tWt1dfh4=;
        b=JReo6rNHNrDoUrRJlCy4RrLKh+Ido4FcqiRsmwQYOd1p+lEP7l3I1sVsgvREzT9lfa
         RRg9zKhd5BIyjswLDk0bpmOaNVE58zrbltR0Iu9f7Svp0ZpMuehfRQxX6AIs88LaD1IF
         skzQDMfPEOLO1rF7zqasyVRVQrw+Emk3YIropT8Ve0wcV5wpslQQOO6oYxdvOCvvZXdH
         0/iS5Nwgj2QSbdIWmGkf4ONRxhLCwSGohG1750OHXLoFakdQRFE7iKRneCMYzQlfRPvK
         t305c2eTy9l9sshKSTsjCB8PxCpd797Pr2PHUrHGwl7s5hwibEPS09yXNMohpdFwvu3m
         jhUw==
X-Gm-Message-State: AOAM530nQqixnhEp4Oxv8YD+mc6yTuLbDandfaulzh7f2Uz8soqBAV2G
	8h+r5ybK4wgcwP43bIsgg6UkqHZVIug4ag==
X-Google-Smtp-Source: ABdhPJzeezEO0026bVhp7lp/dT7Np+XoLnLYDmJ7/d591PM+7xh2APcudWh51A4dkzvsGXV7do6azw==
X-Received: by 2002:a05:6e02:20c4:: with SMTP id 4mr4114604ilq.170.1610117331359;
        Fri, 08 Jan 2021 06:48:51 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:10b9:360:420b:282e])
        by smtp.gmail.com with ESMTPSA id j12sm7319362ili.48.2021.01.08.06.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 06:48:51 -0800 (PST)
Date: Fri, 8 Jan 2021 09:48:49 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: Document VOLATILE_LOG_DIR in recipe
Message-ID: <20210108144848.GD29567@kudzu.us>
References: <20210107101054.27399-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210107101054.27399-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 10:10:54AM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Added a comment to the xenguest-manager recipe to inform the user that
> the default state is a volatile log dir, and how to persist logs across
> reboots.
> 
> Issue-Id: SCM-1860
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Ie0c92b05d11543a1524cbb7a53cd845bc63ecd3d
> ---

Pulled into master.

Thanks,
Jon

>  .../recipes-extended/xenguest/xenguest-manager.bb      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> index 16a0700..ffb0fc3 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -2,6 +2,16 @@
>  #
>  # xenguest-manager is a tool to control xen guest (e.g. create, start, stop)
>  #
> +# By default xenguest-manager logs to /var/log when in verbose mode, which is a
> +# Volatile directory. To persist logs across reboots the following needs to be
> +# added to either local.conf or distro.conf
> +#
> +#   VOLATILE_LOG_DIR="no"
> +#
> +# Read more here: https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-VOLATILE_LOG_DIR
> +#
> +# When this is enabled, logrotate will monitor the file to ensure it does not grow
> +# excessively large. See files/logrotate-xenguest
>  
>  DESCRIPTION = "Xen Guest Manager"
>  LICENSE = "MIT"
> -- 
> 2.17.1
> 

> 
> 
> 

